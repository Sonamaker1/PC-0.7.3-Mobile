package states;

import openfl.filters.BitmapFilter;
import backend.WeekData;
import backend.Highscore;
import backend.Song;

import lime.utils.Assets;
import openfl.utils.Assets as OpenFlAssets;

import objects.HealthIcon;
import states.editors.ChartingState;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;

#if MODS_ALLOWED
import sys.FileSystem;
#end

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	private static var curSelected:Int = 0;
	var lerpSelected:Float = 0;
	var curDifficulty:Int = 2;
	private static var lastDifficultyName:String = '';

	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var percentText:FlxText;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;

	public var camMain:FlxCamera;
	public var camCurSong:FlxCamera;

	var filter:BitmapFilter;
	//var leFilter:Array<BitmapFilter> = [];

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	var bg:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var weekCovers:FlxSprite;
	var pibbyIcons:FlxSprite;

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		
		persistentUpdate = true;
		PlayState.isStoryMode = false;
		WeekData.reloadWeekFiles(false);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		//filter = new GlowFilter(0xFF0000, 0.8, 60, 60, 30, 5, false, false);
        //leFilter.push(filter);

		camMain = new FlxCamera();
		camCurSong = new FlxCamera();
		camCurSong.bgColor.alpha = 0;

		FlxG.cameras.add(camMain);
		FlxG.cameras.add(camCurSong);

		//camCurSong.filtersEnabled = true;

		//camCurSong.setFilters(leFilter);

		FlxCamera.defaultCameras = [camMain];

		for (i in 0...WeekData.weeksList.length) {
			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];
			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs)
			{
				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
		}

		/*		//KIND OF BROKEN NOW AND ALSO PRETTY USELESS//
		var initSonglist = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
		for (i in 0...initSonglist.length)
		{
			if(initSonglist[i] != null && initSonglist[i].length > 0) {
				var songArray:Array<String> = initSonglist[i].split(":");
				addSong(songArray[0], 0, songArray[1], Std.parseInt(songArray[2]));
			}
		}*/

		bg = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/sky', 'pibby'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		bg.y -= 56;

		var fg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/fpFG', 'pibby'));
		fg.antialiasing = ClientPrefs.data.antialiasing;
		add(fg);
		fg.screenCenter();

		weekCovers = new FlxSprite(666 /**satan reference holy shit**/, 0);
		weekCovers.frames = Paths.getSparrowAtlas('menus/freeplay/covers', 'pibby');
		weekCovers.animation.addByPrefix('cover0', 'covers at', 24);
		weekCovers.animation.addByPrefix('cover1', 'covers su', 24);
		weekCovers.animation.addByPrefix('cover2', 'covers fnf', 24);
		weekCovers.animation.addByPrefix('cover3', 'covers rs', 24);
		weekCovers.screenCenter(Y);
		weekCovers.setGraphicSize(Std.int(weekCovers.width * 0.8));
		weekCovers.antialiasing = true;
		add(weekCovers);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
			{
				var songText:Alphabet = new Alphabet(90, 320, songs[i].songName, true);
				songText.targetY = i;
				grpSongs.add(songText);
	
				songText.scaleX = Math.min(1, 980 / songText.width);
				songText.snapToPosition();
	
				Mods.currentModDirectory = songs[i].folder;
				var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
				icon.sprTracker = songText;
	
				
				// too laggy with a lot of songs, so i had to recode the logic for it
				songText.visible = songText.active = songText.isMenuItem = false;
	
				// songText.x += 40;
				// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
				// songText.screenCenter(X);
			}
		WeekData.setDirectoryFromWeek();

		scoreText = new FlxText(FlxG.width * 0.65, 25, 0, "", 44);
		scoreText.x -= 25;
		scoreText.setFormat(Paths.font("Cartoon.ttf"), 44, FlxColor.WHITE, RIGHT);

		percentText = new FlxText(FlxG.width * 0.6, scoreText.y + 45, 0, "", 44);
		percentText.setFormat(Paths.font("Cartoon.ttf"), 44, FlxColor.WHITE, RIGHT);

		pibbyIcons = new FlxSprite(scoreText.x - 20, 5);
		pibbyIcons.frames = Paths.getSparrowAtlas('menus/freeplay/pibbyIcons', 'pibby');
		pibbyIcons.animation.addByPrefix('default', 'default', 24);
		pibbyIcons.animation.addByPrefix('lowAccuracy', 'lowAccuracy', 24);
		pibbyIcons.animation.addByPrefix('midAccuracy', 'midAccuracy', 24);
		pibbyIcons.animation.addByPrefix('goodAccuracy', 'goodAccuracy', 24);
		pibbyIcons.animation.addByPrefix('greatAccuracy', 'greatAccuracy', 24);
		pibbyIcons.antialiasing = ClientPrefs.data.antialiasing;


		scoreBG = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/freeplay/coolBlackThing', 'pibby'));
		scoreBG.scale.y = 1.5;
		scoreBG.scale.x = 2.85;
		scoreBG.alpha = 0.6;
		scoreBG.antialiasing = ClientPrefs.data.antialiasing;
		add(scoreBG);

		add(scoreText);
		add(percentText);
		add(pibbyIcons);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;

		lastDifficultyName = 'Hard';
		
		changeSelection();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));
			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;
			FlxG.stage.addChild(texFel);
			// scoreText.textField.htmlText = md;
			trace(md);
		 */

		lerpSelected = curSelected;
		updateTexts();
		super.create();
	}

	override function closeSubState() {
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
		songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
	}

	/*public function addWeek(songs:Array<String>, weekNum:Int, weekColor:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];
		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);
			this.songs[this.songs.length-1].color = weekColor;
			if (songCharacters.length != 1)
				num++;
		}
	}*/

	var instPlaying:Int = -1;
	public static var vocals:FlxSound = null;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, FlxMath.bound(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, FlxMath.bound(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(CoolUtil.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

		if(songs[curSelected].week < 4)
		{
		    weekCovers.animation.play('cover' + songs[curSelected].week);
		}
		else
		{
            weekCovers.animation.play('cover0');
		}

		if(intendedRating <= .4 && intendedRating > 0)
		{
			pibbyIcons.animation.play('lowAccuracy');
		}
		else if(intendedRating <= .66 && intendedRating > .4)
		{
			pibbyIcons.animation.play('midAccuracy');
		}
		else if(intendedRating <= .8 && intendedRating > .66)
		{
			pibbyIcons.animation.play('goodAccuracy');
		}
		else if(intendedRating <= 1 && intendedRating > .8)
		{
			pibbyIcons.animation.play('greatAccuracy');
		}
		else
		{
			pibbyIcons.animation.play('default');
		}

		scoreText.text = 'BEST SCORE: ' + lerpScore;
		percentText.text = 'ACCURACY: (' + ratingSplit.join('.') + '%)';

		positionHighscore();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if(songs.length > 1)
		{
			if (upP)
			{
				changeSelection(-shiftMult);
				holdTime = 0;
			}
			if (downP)
			{
				changeSelection(shiftMult);
				holdTime = 0;
			}

			if(controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}
		}

		if (controls.BACK)
		{
			persistentUpdate = false;
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		} else if(space)
		{
			if(instPlaying != curSelected)
			{
				#if PRELOAD_ALL
				destroyFreeplayVocals();
				FlxG.sound.music.volume = 0;
				var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
				if (PlayState.SONG.needsVoices)
					vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
				else
					vocals = new FlxSound();

				FlxG.sound.list.add(vocals);
				FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
				vocals.play();
				vocals.persist = true;
				vocals.looped = true;
				vocals.volume = 0.7;
				instPlaying = curSelected;
				#end
			}
		}

		else if (accepted)
		{
			persistentUpdate = false;
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, 1);
			/*#if MODS_ALLOWED
			if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
			#else
			if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
			#end
				poop = songLowercase;
				curDifficulty = 2;
				trace('Couldnt find file');
			}*/
			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songLowercase);
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;

			trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
			if(colorTween != null) {
				colorTween.cancel();
			}
			
			if (FlxG.keys.pressed.SHIFT){
				LoadingState.loadAndSwitchState(new ChartingState());
			}else{
				LoadingState.loadAndSwitchState(new PlayState());
			}

			FlxG.sound.music.volume = 0;
					
			destroyFreeplayVocals();
		}

		updateTexts(elapsed);
		super.update(elapsed);
	}

	public static function destroyFreeplayVocals() {
		if(vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	function changeSelection(change:Int = 0, playSound:Bool = true)
		{
			if(playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	
			var lastList:Array<String> = Difficulty.list;
			curSelected += change;
	
			if (curSelected < 0)
				curSelected = songs.length - 1;
			if (curSelected >= songs.length)
				curSelected = 0;

			intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
			intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
				
			var newColor:Int = songs[curSelected].color;
			if(newColor != intendedColor) {
				if(colorTween != null) {
					colorTween.cancel();
				}
				intendedColor = newColor;
				colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
			}

			weekCovers.alpha = 0.55;
		    FlxTween.tween(weekCovers, {alpha: 1}, 0.2);
	
			// selector.y = (70 * curSelected) + 30;
	
			var bullShit:Int = 0;
	
			for (item in grpSongs.members)
			{
				bullShit++;
				item.alpha = 0.6;
				if (item.targetY == curSelected)
					item.alpha = 1;
			}
			
			Mods.currentModDirectory = songs[curSelected].folder;
			PlayState.storyWeek = songs[curSelected].week;
			Difficulty.loadFromWeek();
		}

	var _drawDistance:Int = 4;
	var _lastVisibles:Array<Int> = [];
	public function updateTexts(elapsed:Float = 0.0)
	{
		lerpSelected = FlxMath.lerp(lerpSelected, curSelected, FlxMath.bound(elapsed * 9.6, 0, 1));
		for (i in _lastVisibles)
		{
			grpSongs.members[i].visible = grpSongs.members[i].active = false;
		}
		_lastVisibles = [];

		var min:Int = Math.round(Math.max(0, Math.min(songs.length, lerpSelected - _drawDistance)));
		var max:Int = Math.round(Math.max(0, Math.min(songs.length, lerpSelected + _drawDistance)));
		for (i in min...max)
		{
			var item:Alphabet = grpSongs.members[i];
			item.visible = item.active = true;
			item.x = ((item.targetY - lerpSelected) * item.distancePerItem.x) + item.startPosition.x;
			item.y = ((item.targetY - lerpSelected) * 1.3 * item.distancePerItem.y) + item.startPosition.y;
		}
	}

	private function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 20;
		percentText.x = FlxG.width - scoreText.width - 15;

		scoreBG.scale.x = 1.85;
		scoreBG.x = FlxG.width - scoreBG.width;
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";

	public function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		if(this.folder == null) this.folder = '';
	}
}