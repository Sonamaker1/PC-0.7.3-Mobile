package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.3'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	private var menuItems: FlxTypedGroup<FlxText>;
	private var charMenu: FlxSprite;

	var optionShit:Array<String> = [
		'story',
		'freeplay',
		'credits',
		'options'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;

	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg: FlxSprite = new FlxSprite();
		bg.frames = Paths.getSparrowAtlas('menus/titlescreen/menuInterference');
		bg.scrollFactor.set(0, 0);
		bg.animation.addByPrefix('idle', 'thing', 24);
		bg.animation.play('idle');
		bg.setGraphicSize(Std.int(bg.width * 3));
		bg.updateHitbox();
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);
	
		menuItems = new FlxTypedGroup<FlxText>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var menuText:FlxText = new FlxText(75, ((i + 1) * 115));
			menuText.setFormat(Paths.font("Pixel Emulator.otf"), 45, FlxColor.WHITE);
			menuText.text = optionShit[i];
			menuText.antialiasing = true;
			//menuText.y -= 305;
			menuText.ID = i;
			menuText.scrollFactor.set();
			menuItems.add(menuText);
		}


		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "", 12);
		versionShit.text = 
			"Psych Engine v" + psychEngineVersion
			+ "\nPibby Corrupted' v"+ Application.current.meta.get('version');
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		
		charMenu = new FlxSprite(777, 200);
		charMenu.scrollFactor.set(0, 0);
		charMenu.frames = Paths.getSparrowAtlas('menus/main_menu/menuChar');
		charMenu.animation.addByPrefix('idle', 'menuChar ' + 0, 24);
		charMenu.animation.play('idle');
		charMenu.setGraphicSize(Std.int(charMenu.width * 1.62));
		charMenu.antialiasing = ClientPrefs.data.antialiasing;
		add(charMenu);

		
		addVirtualPad(UP_DOWN, A_B_E);

		super.create();

		FlxG.camera.follow(camFollow, null, 9);
	}

	var canSelect: Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}
		FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 / (FlxG.updateFramerate / 60), 0, 1);

		if (FlxG.sound.music != null) Conductor.songPosition = FlxG.sound.music.time;

		charMenu.y = 190 + Math.sin(Conductor.songPosition/850)*((FlxG.height * 0.015));

		if (!canSelect)
		{
			if (controls.UI_UP_P)
				changeItem(-1);

			if (controls.UI_DOWN_P)
				changeItem(1);

			if (controls.BACK)
			{
				canSelect = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if ( controls.ACCEPT )
			{
				var secondsDelayed: Float = 0;
				canSelect = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
	
				FlxTween.tween(charMenu, { alpha: 0 }, 0.2, {
					ease: FlxEase.quadOut,
					onComplete: function(tween: FlxTween)
						charMenu.kill()
				});

				menuItems.forEach(function( txt:FlxText )
				{
					if (curSelected != txt.ID)
					{
						secondsDelayed += 0.05;
						FlxTween.tween(txt, { alpha: 0, x: txt.x - 100 }, 0.2, {
							ease: FlxEase.quadOut,
							startDelay: secondsDelayed,
							onComplete: function(twn:FlxTween)
								txt.kill()
						});
					}
					else
					{
						FlxFlicker.flicker( txt, 1, 0.06, false, false, function( flick : FlxFlicker )
						{
							var daChoice: String = optionShit[curSelected];
	
							switch (daChoice)
							{
								case 'story':
									MusicBeatState.switchState(new states.StoryMenuState());
								case 'freeplay':
									MusicBeatState.switchState(new FreeplayState());
								case 'credits':
									MusicBeatState.switchState(new CreditsState());
								case 'options':
									LoadingState.loadAndSwitchState(new options.OptionsState());
							}
						});
					}
				});
			}
			else if (controls.justPressed('debug_1') || virtualPad.buttonE.justPressed)
			{
				canSelect = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
		}

		super.update(elapsed);
	}

	private var colorTextTween: FlxTween = null;
	private function changeItem(change: Int = 0)
	{
		curSelected += change;
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.3);

		if (curSelected >= menuItems.length) curSelected = 0;

		if (curSelected < 0) curSelected = menuItems.length - 1;

		menuItems.forEach(function(txt:FlxText)
		{
			txt.alpha = 0.7;
			txt.color = 0x606060;
			if (txt.x != 75)
				FlxTween.tween(txt, {x: 75}, 0.2, {ease: FlxEase.quadOut});
			if (txt.ID == curSelected)
			{
				if ( colorTextTween != null ) colorTextTween.cancel(); colorTextTween = null;
				
				colorTextTween = FlxTween.tween( txt, { alpha: 1, x: 115 }, 0.4, {ease: FlxEase.quadOut});
				txt.color = FlxColor.WHITE;
			}
		});
	}
}
