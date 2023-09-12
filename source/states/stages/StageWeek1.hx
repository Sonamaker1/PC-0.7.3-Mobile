package states.stages;

import flixel.addons.display.FlxRuntimeShader;
import flixel.FlxSubState;
import states.stages.objects.*;
import objects.Character;

class StageWeek1 extends BaseStage
{
	var dadbattleBlack:BGSprite;
	var dadbattleLight:BGSprite;
	var dadbattleFog:DadBattleFog;
	var angleTween:Array<FlxTween> = [null, null, null];
	var mustCancel = false;
	var shaders:Map<String, FlxRuntimeShader> 
	=
	[
		'pixel' => new FlxRuntimeShader(backend.Shaders.pixel, null, 140)
	];
	override function create()
	{
		var bg:BGSprite = new BGSprite('$curDirectory/stageback', -600, -200, 0.9, 0.9);
		add(bg);

		var stageFront:BGSprite = new BGSprite('$curDirectory/stagefront', -650, 600, 0.9, 0.9);
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		// stageFront.library = 'pibby';
		add(stageFront);
		if(!ClientPrefs.data.lowQuality) {
			var stageLight:BGSprite = new BGSprite('$curDirectory/stage_light', -125, -100, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
			stageLight.updateHitbox();
			// stageLight.library = 'pibby';
			add(stageLight);
			var stageLight:BGSprite = new BGSprite('$curDirectory/stage_light', 1225, -100, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
			stageLight.updateHitbox();
			stageLight.flipX = true;
			// stageLight.library = 'pibby';
			add(stageLight);

			var stageCurtains:BGSprite = new BGSprite('$curDirectory/stagecurtains', -500, -300, 1.3, 1.3);
			// stageCurtains.library = 'pibby';
			stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
			stageCurtains.updateHitbox();
			add(stageCurtains);
		}

		var glitch = new FlxSprite(-60, 40);
		glitch.frames = Paths.getSparrowAtlas('$curDirectory/pibbyglitchwhoa', 'pibby');
		glitch.animation.addByPrefix('_', 'STAGE');
		glitch.animation.play('_');
		glitch.shader = shaders['pixel'];
		add(glitch);
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		switch(event.event)
		{
			case "Dadbattle Spotlight":
				dadbattleBlack = new BGSprite(null, -800, -400, 0, 0);
				dadbattleBlack.makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
				dadbattleBlack.alpha = 0.25;
				dadbattleBlack.visible = false;
				add(dadbattleBlack);

				dadbattleLight = new BGSprite('spotlight', 400, -400);
				dadbattleLight.alpha = 0.375;
				dadbattleLight.blend = ADD;
				dadbattleLight.visible = false;
				add(dadbattleLight);

				dadbattleFog = new DadBattleFog();
				dadbattleFog.visible = false;
				add(dadbattleFog);
		}
	}

	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "Dadbattle Spotlight":
				if(flValue1 == null) flValue1 = 0;
				var val:Int = Math.round(flValue1);

				switch(val)
				{
					case 1, 2, 3: //enable and target dad
						if(val == 1) //enable
						{
							dadbattleBlack.visible = true;
							dadbattleLight.visible = true;
							dadbattleFog.visible = true;
							defaultCamZoom += 0.12;
						}

						var who:Character = dad;
						if(val > 2) who = boyfriend;
						//2 only targets dad
						dadbattleLight.alpha = 0;
						new FlxTimer().start(0.12, function(tmr:FlxTimer) {
							dadbattleLight.alpha = 0.375;
						});
						dadbattleLight.setPosition(who.getGraphicMidpoint().x - dadbattleLight.width / 2, who.y + who.height - dadbattleLight.height + 50);
						FlxTween.tween(dadbattleFog, {alpha: 0.7}, 1.5, {ease: FlxEase.quadInOut});

					default:
						dadbattleBlack.visible = false;
						dadbattleLight.visible = false;
						defaultCamZoom -= 0.12;
						FlxTween.tween(dadbattleFog, {alpha: 0}, 0.7, {onComplete: function(twn:FlxTween) dadbattleFog.visible = false});
				}
		}
	}

	override function stepHit() {
		if (PlayState.SONG.song.toLowerCase().replace('-', ' ') == 'blue balled')
		{
			switch (curStep)
			{
				case 512: 
					angleTween[2] = FlxTween.tween(game.camGame, {zoom: 1.2}, 12.5, {ease: FlxEase.smoothStepInOut, onComplete: _->angleTween[2] = null});
				case 640: 
					game.camGame.flash(FlxColor.WHITE, 1);
					tweenLoopAngle(game.camGame, -6, 6, 6, 6);
					tweenLoopAngle(game.camHUD, 4, -4, 6, 6);

				case 895: mustCancel = true;

				case 896: 
					if (angleTween[0] != null) angleTween[0].cancel();
					if (angleTween[1] != null) angleTween[1].cancel();
					tweenLoopAngle(game.camGame, 0, 0, 4, 4);
					tweenLoopAngle(game.camHUD, 0, 0, 4, 4);
			}
		}
	}

	override function openSubState(SubState:FlxSubState) {
		super.openSubState(SubState);

		if (angleTween[0] != null) angleTween[0].active = false;
		if (angleTween[1] != null) angleTween[1].active = false;
		if (angleTween[2] != null) angleTween[2].active = false;
	}

	override function closeSubState() {
		super.closeSubState();

		if (angleTween[0] != null) angleTween[0].active = true;
		if (angleTween[1] != null) angleTween[1].active = true;
		if (angleTween[2] != null) angleTween[2].active = true;
	}

	function tweenLoopAngle(varx, distance1, distance2, duration1, duration2) {
		angleTween[0] = FlxTween.tween(varx, {angle: distance1}, duration1, {
			ease: FlxEase.sineInOut,
			onComplete: 
			function (twn:FlxTween)
				{
					angleTween[0] = null;
					angleTween[1] = FlxTween.tween(varx, {angle: distance2}, duration2, {
						ease: FlxEase.sineInOut,
						onComplete: 
						function (twn:FlxTween)
							{
								angleTween[1] = null;
								if (!mustCancel) tweenLoopAngle(varx, distance1, distance2, duration1, duration2);
							}
					});
				}
		});
	}
}