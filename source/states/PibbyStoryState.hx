package states;

import backend.Song;
import backend.WeekData;

class PibbyStoryState extends MusicBeatState 
{
    public static var curWorld: Int = 0;

    private var bg: FlxSprite;
    private var select: FlxText;
    private var curwidth: Float;

	private var leftArrow: FlxSprite;
	private var rightArrow: FlxSprite;
    
    private var selectedWeek: Bool = false;

    // First index is logo name, second is position it is in.
    private final logoNames: Array<Array<Dynamic>> = [
        ['adventure_time', 0], 
        ['steven', -1060], 
        ['fnf', -2160], 
        ['regular_show',-3240], 
        ['jenny', -4240], 
        ['steamboat_willie', -5332]
    ];
    private var logos: FlxTypedSpriteGroup<FlxSprite>;

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

        var currentWorldIndex: Int = 0;
        for (world in logoNames)
        {
            var logo:FlxSprite = new FlxSprite(275 + (currentWorldIndex * 1080), 0);
            logo.frames = Paths.getSparrowAtlas('menus/story_menu/logos/' + world[0] + '_logo', 'pibby');
            logo.animation.addByPrefix('idle', "logo final", 24, false);
            logo.antialiasing = true;
            logo.screenCenter(Y);
            logo.y += 100;
            logo.ID = world[0];
            logo.setGraphicSize(Std.int(logo.width * 0.65));
            logo.updateHitbox();
			logo.scrollFactor.set();
            logos.add(logo);
            currentWorldIndex++;
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
        
        Conductor.songPosition = FlxG.sound.music != null ? FlxG.sound.music.time : 0;

        if (!selectedWeek)
		{
            if (controls.UI_RIGHT_P)
                changeWorld(1);
            
            if (controls.UI_LEFT_P)
                changeWorld(-1);

			if (controls.UI_LEFT) leftArrow.animation.play('press'); else leftArrow.animation.play('idle');

			if (controls.UI_RIGHT) rightArrow.animation.play('press'); else rightArrow.animation.play('idle');
        }

        if(controls.ACCEPT)
            selectWorld();
        

        super.update(elapsed);
    }

    override function beatHit() {
        super.beatHit();

        if (curBeat % 2 == 0) logos.forEach(logo -> logo.animation.play('idle')); 
    }

    function changeWorld(theChange:Int = 0):Void
    {
        curWorld += theChange;
        FlxG.sound.play(Paths.sound('scrollMenu'));

        if (curWorld >= logoNames.length)
			curWorld = 0;
		if (curWorld < 0)
			curWorld = logoNames.length - 1;

        FlxTween.tween(logos ,{x: logoNames[curWorld][1]}, 0.5, {ease: FlxEase.quadInOut});
    }

    function selectWorld()
    {
        select.text = 'GOOD LUCK';
        select.x -= (select.width - curwidth) / 2;
        FlxG.camera.flash(FlxColor.WHITE, 1);
        FlxG.sound.play(Paths.sound('menuLaugh'));
        
        var songArray:Array<String> = [];
		var leWeek:Array<Dynamic> = WeekData.weeksLoaded.get(WeekData.weeksList[curWorld]).songs;
		for (i in 0...leWeek.length) 
			songArray.push(leWeek[i][0]);

		PlayState.storyPlaylist = songArray;
		PlayState.isStoryMode = true;

		PlayState.storyDifficulty = 2;

		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
        PlayState.storyWeek = curWorld;
		PlayState.campaignScore = 0;
		PlayState.campaignMisses = 0;

		new FlxTimer().start(1.5, function(tmr:FlxTimer)
        {
            LoadingState.loadAndSwitchState(new PlayState(), true);
        });
        FlxG.sound.music.volume = 0;
    }
}