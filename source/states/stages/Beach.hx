package states.stages;

import openfl.filters.ShaderFilter;
import flixel.addons.display.FlxRuntimeShader;
import states.stages.objects.*;

class Beach extends BaseStage
{
	var lion:FlxSprite;
	var stevensword:FlxSprite;
	var boardwalk:FlxSprite;
	var clusterhand:FlxSprite;
	var sky:FlxSprite;
	var skyback:FlxSprite;
	var water:FlxSprite;
	var goofyAhhDarkness:FlxSprite;
	var moon:FlxSprite;

	var yeah = false;

	var shaders:Map<String, FlxRuntimeShader> 
	=
	[
		'pixel' => new FlxRuntimeShader(backend.Shaders.pixel, null, 140)
	];

	override function create()
	{
        FlxSprite.defaultAntialiasing = ClientPrefs.data.antialiasing;

		skyback = new FlxSprite(-700, -500, Paths.image('$curDirectory/yeah/skyback', 'pibby'));
        skyback.scrollFactor.set(0.1, 0.1);
        add(skyback);

        sky = new FlxSprite(-700, -500, Paths.image('$curDirectory/yeah/sky', 'pibby'));
        sky.scrollFactor.set(0.11, 0.11);
        add(sky);

        var clouds = new FlxSprite(-700, -500, Paths.image('$curDirectory/yeah/clouds', 'pibby'));
        clouds.scrollFactor.set(0.11, 0.11);
        add(clouds);

        moon = new FlxSprite(-700, -500, Paths.image('$curDirectory/yeah/moon', 'pibby'));
        moon.scrollFactor.set(0.12, 0.12);
        add(moon);

        var stars = new FlxSprite(-700, -500, Paths.image('$curDirectory/yeah/stars', 'pibby'));
        stars.scrollFactor.set(0.125, 0.125);
        add(stars);

        water = new FlxSprite(-670, -520, Paths.image('$curDirectory/yeah/water', 'pibby'));
        water.scrollFactor.set(0.28, 0.28);
        water.scale.set(1.2, 1.2);
        add(water);

        clusterhand = new FlxSprite(-730, -265);
        clusterhand.frames = Paths.getSparrowAtlas('$curDirectory/clusterhand', 'pibby');
        clusterhand.animation.addByPrefix('idle', 'za hando glitch', 24);
        clusterhand.animation.play('idle');
        clusterhand.scrollFactor.set(0.3, 0.3);
        add(clusterhand);

        boardwalk = new FlxSprite(-650, -505, Paths.image('$curDirectory/yeah/boardwalk', 'pibby'));
        boardwalk.scrollFactor.set(0.34, 0.34);
        add(boardwalk);

        lion = new FlxSprite(1230, 100);
        lion.frames = Paths.getSparrowAtlas('$curDirectory/lion', 'pibby');
        lion.animation.addByPrefix('idle', 'lion', 24, false);
        lion.animation.play('idle');
        lion.scrollFactor.set(0.34, 0.34);
        add(lion);

        var sans = new FlxSprite(-650, -505, Paths.image('$curDirectory/yeah/sand', 'pibby'));
        sans.scrollFactor.set(0.4, 0.4);
        add(sans);

        // why this one exist
        var outline = new FlxSprite(-650, -525, Paths.image('$curDirectory/yeah/outline', 'pibby'));
        outline.scrollFactor.set(0.97, 0.97);
        outline.scale.set(1.4, 1.4);
        add(outline);

        var ground = new FlxSprite(-650, -535, Paths.image('$curDirectory/yeah/BG with swordshading', 'pibby'));
        ground.scrollFactor.set(0.97, 0.97);
        ground.scale.set(1.4, 1.4);
        add(ground);

        var flowers = new FlxSprite(-600, -370, Paths.image('$curDirectory/yeah/Flowers', 'pibby'));
        add(flowers);

        stevensword = new FlxSprite(440, 160);
        stevensword.frames = Paths.getSparrowAtlas('$curDirectory/stevensword', 'pibby');
        stevensword.animation.addByPrefix('idle', 'sword glitch', 24);
        stevensword.animation.play('idle');
        add(stevensword);

        goofyAhhDarkness = new FlxSprite(-1200, 320);
        goofyAhhDarkness.frames = Paths.getSparrowAtlas('$curDirectory/stevenbigpoolleft', 'pibby');
        goofyAhhDarkness.animation.addByPrefix('idle', 'giant pool', 24);
        goofyAhhDarkness.animation.play('idle');
		goofyAhhDarkness.shader = shaders['pixel'];
        add(goofyAhhDarkness);
	}
	
	override function createPost()
	{
	}

	override function update(elapsed:Float)
	{
		// Code here
	}

    override function startCountdown():Bool {
        new FlxTimer().start(Conductor.crochet / 1000 / game.playbackRate, function(tmr:FlxTimer)
			{
				if (lion != null && tmr.loopsLeft % 2 == 0 && lion.animation.curAnim != null)
					lion.animation.play('idle');
            });

        return true;
    }
	
	override function countdownTick(count:Countdown, num:Int)
	{
		switch(count)
		{
			case THREE: //num 0
			case TWO: //num 1
			case ONE: //num 2
			case GO: //num 3
			case START: //num 4
		}
	}

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		if (yeah)
		{
			stevensword.shader = FlxG.random.int(1, 50) < 25 ? null : shaders['pixel'];
			clusterhand.shader = FlxG.random.int(1, 70) < 35 ? null : shaders['pixel'];
			boardwalk.shader = FlxG.random.int(1, 80) < 40 ? null : shaders['pixel'];
			sky.shader = FlxG.random.int(1, 100) < 50 ? null : shaders['pixel'];
			water.shader = FlxG.random.int(1, 20) < 10 ? null : shaders['pixel'];
			skyback.shader = sky.shader;
			moon.shader = sky.shader;
			goofyAhhDarkness.shader = FlxG.random.int(1, 40) < 20 ? null : shaders['pixel'];

			shaders['pixel'].setFloat('size', FlxG.random.int(5, 17));
		}
	}

	override function beatHit()
	{
		if (curBeat % 2 == 0)
            lion.animation.play('idle');

		switch (PlayState.SONG.song.toLowerCase().replace('-', ' '))
		{
			case 'glitched gem':
				switch (curBeat)
				{
					case 8: 
						FlxG.camera.setFilters([]);

					case 80 | 81 | 82 | 83: 
						for (objects in [game.timeBar, game.timeTxt, game.scoreTxt]) {
							objects.visible = true;
							objects.alpha = 1;
						}
						game.timeBar.alpha = 1;
						game.timeBar.visible = true;

					case 280: 
						FlxG.camera.setFilters([]);
						yeah = true;
						
					case 376: 
						yeah = false;

						stevensword.shader = null;
						clusterhand.shader = null;
						boardwalk.shader = null;
						sky.shader = null;
						water.shader = null;
						skyback.shader = sky.shader;
						moon.shader = sky.shader;
						goofyAhhDarkness.shader = shaders['pixel'];

						shaders['pixel'].setFloat('size', 13);

						// just in case
						new FlxTimer().start(0.0075, _->goofyAhhDarkness.shader = shaders['pixel']);
				}
		}
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	// For events
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "My Event":
		}
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}
	override function eventPushedUnique(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events where its values affect what assets should be preloaded
		switch(event.event)
		{
			case "My Event":
				switch(event.value1)
				{
					// If value 1 is "blah blah", it will preload these assets:
					case 'blah blah':
						//precacheImage('myImageOne') //preloads images/myImageOne.png
						//precacheSound('mySoundOne') //preloads sounds/mySoundOne.ogg
						//precacheMusic('myMusicOne') //preloads music/myMusicOne.ogg

					// If value 1 is "coolswag", it will preload these assets:
					case 'coolswag':
						//precacheImage('myImageTwo') //preloads images/myImageTwo.png
						//precacheSound('mySoundTwo') //preloads sounds/mySoundTwo.ogg
						//precacheMusic('myMusicTwo') //preloads music/myMusicTwo.ogg
					
					// If value 1 is not "blah blah" or "coolswag", it will preload these assets:
					default:
						//precacheImage('myImageThree') //preloads images/myImageThree.png
						//precacheSound('mySoundThree') //preloads sounds/mySoundThree.ogg
						//precacheMusic('myMusicThree') //preloads music/myMusicThree.ogg
				}
		}
	}
}