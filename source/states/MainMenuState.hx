package states;

import backend.WeekData;
import backend.Achievements;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;

import flixel.input.keyboard.FlxKey;
import lime.app.Application;

import objects.AchievementPopup;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxText>;
	private var charMenu : FlxSprite;

	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
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

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg : FlxSprite = new FlxSprite();
		bg.frames = Paths.getSparrowAtlas('menus/titlescreen/menuInterference', 'pibby');
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
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxText>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var menuText:FlxText = new FlxText(-535, ((i + 1) * 115));
			menuText.setFormat(Paths.font("Pixel Emulator.otf"), 45, FlxColor.WHITE);
			menuText.text = optionShit[i];
			menuText.antialiasing = true;
			menuText.y -= 305;
			menuText.ID = i;
			menuItems.add(menuText);
		}

		FlxG.camera.follow(camFollow, null, 0);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		
		charMenu = new FlxSprite(777, 200);
		charMenu.scrollFactor.set(0, 0);
		charMenu.frames = Paths.getSparrowAtlas('menus/main_menu/menuChar', 'pibby');
		charMenu.animation.addByPrefix('idle', 'menuChar ' + 0, 24);
		charMenu.animation.play('idle');
		charMenu.setGraphicSize(Std.int(charMenu.width * 1.62));
		charMenu.antialiasing = ClientPrefs.data.antialiasing;
		add(charMenu);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementPopup('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

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

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if ( controls.ACCEPT )
			{
				var secondsDelayed : Float = 0;
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
	
				menuItems.forEach(function( txt:FlxText )
				{
					if (curSelected != txt.ID)
					{
						secondsDelayed += 0.15;
						FlxTween.tween(txt, { alpha: 0, x: txt.x - 350 }, 0.4, {
							ease: FlxEase.quadOut,
							startDelay: secondsDelayed,
							onComplete: function(twn:FlxTween)
							{
								txt.kill();
							}
						});
					}
					else
					{
						FlxFlicker.flicker( txt, 1, 0.06, false, false, function( flick : FlxFlicker )
						{
							var daChoice : String = optionShit[curSelected];
	
							switch ( daChoice )
							{
								case 'story':
									MusicBeatState.switchState(new states.PibbyStoryState());
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
			#if desktop
			else if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	private var textTween : FlxTween = null;

	private function changeItem ( change : Int = 0 )
	{
		curSelected += change;
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.3);

		if ( curSelected >= menuItems.length ) curSelected = 0;

		if ( curSelected < 0 ) curSelected = menuItems.length - 1;

		menuItems.forEach(function(txt:FlxText)
		{
			txt.alpha = 0.7;
			txt.color = 0x606060;
			if (txt.ID == curSelected)
			{
				if ( textTween != null ) { textTween.cancel(); textTween = null; }
				textTween = FlxTween.tween( txt, { alpha : 1 }, 0.4 );
				txt.color = FlxColor.WHITE;
			}
		});
	}
}