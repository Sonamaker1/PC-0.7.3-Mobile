package states;

import backend.Song;
import backend.WeekData;

class PibbyStoryState extends MusicBeatState 
{
    private static var lastDifficultyName:String = '';
	var curDifficulty:Int = 2;

    public static var curWeek:Int = 0;
    var mode:Bool = false;

    var logos:FlxTypedSpriteGroup<FlxSprite>;
    var bg:FlxSprite;
    var select:FlxText;
    var curwidth:Float;

	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;

    var logoNames:Array<String> = [
        'adventure_time', 
        'steven', 
        'fnf', 
        'regular_show', 
        'jenny', 
        'steamboat_willie'
    ];

    override function create()
    {
        Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

        PlayState.isStoryMode = true;
		WeekData.reloadWeekFiles(true);
		persistentUpdate = persistentDraw = true;

        bg = new FlxSprite(-80, 0);
		bg.frames = Paths.getSparrowAtlas('menus/story_menu/menu glitch', 'pibby');
		bg.animation.addByPrefix('idle', 'menu glitch', 30);
		bg.animation.play('idle');
        bg.antialiasing = true;
        bg.setGraphicSize(Std.int(bg.width * 0.8));
        bg.screenCenter();
        bg.alpha = 0.42;
		add(bg);

        select = new FlxText(0, 50, 0, "", 69);
		select.text = 'SELECT';
		select.setFormat(Paths.font("Pixel Emulator.otf"), 69, FlxColor.WHITE, CENTER);//haha funi number
        select.alpha = 0.7;
        select.screenCenter(X);
        add(select);
        FlxTween.tween(select, {y: 25}, 4, {ease: FlxEase.quadInOut, type: PINGPONG});
        curwidth = select.width;

        logos = new FlxTypedSpriteGroup<FlxSprite>();
		add(logos);

        for (i in 0...logoNames.length)
        {
            var logo:FlxSprite = new FlxSprite(275 + (i * 1080), 0);
            logo.frames = Paths.getSparrowAtlas('menus/story_menu/logos/' + logoNames[i] + '_logo', 'pibby');
            logo.animation.addByPrefix('idle', "logo final", 24);
            logo.animation.play('idle');
            logo.antialiasing = true;
            logo.screenCenter(Y);
            logo.y += 100;
            logo.ID = i;
            logo.setGraphicSize(Std.int(logo.width * 0.65));
            logo.updateHitbox();
			logo.scrollFactor.set();
            logos.add(logo);
        }

        leftArrow = new FlxSprite(logos.members[0].x - 85, logos.members[0].y + 170);
		leftArrow.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		leftArrow.antialiasing = true;
		add(leftArrow);

        rightArrow = new FlxSprite(leftArrow.x + 800, leftArrow.y);
		rightArrow.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		rightArrow.animation.addByPrefix('idle', "arrow right");
		rightArrow.animation.addByPrefix('press', "arrow push right");
		rightArrow.animation.play('idle');
		rightArrow.antialiasing = true;
		add(rightArrow);
    }

    override function update(elapsed:Float)
    {
        if (controls.BACK && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}

        if (!selectedWeek)
		{
            if (controls.UI_RIGHT_P)
            {
                changeWorld(1);
                tweenShit();
            }

            if (controls.UI_LEFT_P)
            {
                changeWorld(-1);
                tweenShit();
            }

			if (controls.UI_LEFT) leftArrow.animation.play('press'); else leftArrow.animation.play('idle');

			if (controls.UI_RIGHT) rightArrow.animation.play('press'); else rightArrow.animation.play('idle');
        }

        if(controls.ACCEPT)
        {
            selectWorld();
        }

        super.update(elapsed);
    }

    function changeWorld(theChange:Int = 0):Void
    {
        curWeek += theChange;
        FlxG.sound.play(Paths.sound('scrollMenu'));

        if (curWeek >= logoNames.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = logoNames.length - 1;
    }

    var selectedWeek:Bool = false;

    function selectWorld()
    {
        select.text = 'GOOD LUCK';
        select.x -= (select.width - curwidth) / 2;
        FlxG.camera.flash(FlxColor.WHITE, 1);
        FlxG.sound.play(Paths.sound('menuLaugh'));
        
        var songArray:Array<String> = [];
		var leWeek:Array<Dynamic> = WeekData.weeksLoaded.get(WeekData.weeksList[curWeek]).songs;
		for (i in 0...leWeek.length) 
        {
			songArray.push(leWeek[i][0]);
		}

		PlayState.storyPlaylist = songArray;
		PlayState.isStoryMode = true;

		var diffic = null;
			if(diffic == null) diffic = '';

		PlayState.storyDifficulty = curDifficulty;

		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
        PlayState.storyWeek = curWeek;
		PlayState.campaignScore = 0;
		PlayState.campaignMisses = 0;

		new FlxTimer().start(1.5, function(tmr:FlxTimer)
        {
            LoadingState.loadAndSwitchState(new PlayState(), true);
        });
        FlxG.sound.music.volume = 0;
    }

    function tweenShit()
    {
        switch(curWeek)
        {
            case 0: 
                FlxTween.tween(logos ,{x: 0}, 0.5, {ease: FlxEase.quadInOut});
            case 1: 
                FlxTween.tween(logos ,{x: -1060}, 0.5, {ease: FlxEase.quadInOut});
            case 2: 
                FlxTween.tween(logos ,{x: -2160}, 0.5, {ease: FlxEase.quadInOut});
            case 3: 
                FlxTween.tween(logos ,{x: -3240}, 0.5, {ease: FlxEase.quadInOut});
            case 4: 
                FlxTween.tween(logos ,{x: -4240}, 0.5, {ease: FlxEase.quadInOut});
            case 5: 
                FlxTween.tween(logos ,{x: -5332}, 0.5, {ease: FlxEase.quadInOut});
        }
    }   
}