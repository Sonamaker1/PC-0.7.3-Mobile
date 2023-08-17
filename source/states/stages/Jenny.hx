package states.stages;

class Jenny extends BaseStage 
{
    private var skinsuit : FlxSprite;
    private var tiger : FlxSprite;
    private var glen : FlxSprite;
    private var krakus : FlxSprite;
    private var smytus : FlxSprite;
    private var bitch : FlxSprite;


	override function create()
        {
            game.camZooming = true;

            var bg : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/BackBackground', 'pibby'));
            bg.scrollFactor.set(0.95, 0.95);
            bg.updateHitbox();
            add(bg);

            skinsuit = new FlxSprite(50, 300);
            skinsuit.frames = Paths.getSparrowAtlas('${curDirectory}/Skinsuit', 'pibby');
            skinsuit.animation.addByPrefix("idle", "skinsuit final");
            skinsuit.animation.play("idle", true);
            skinsuit.antialiasing = ClientPrefs.data.antialiasing;
            skinsuit.updateHitbox();
            add(skinsuit);
            
            var realbg:FlxSprite = new FlxSprite(0, 0);
            realbg.frames = Paths.getSparrowAtlas('${curDirectory}/Background', 'pibby');
            realbg.animation.addByPrefix("idle", "bg");
            realbg.animation.play("idle", true);
            realbg.antialiasing = ClientPrefs.data.antialiasing;
            realbg.updateHitbox();
            add(realbg);

            var leaves:FlxSprite = new FlxSprite(0, 10);
            leaves.frames = Paths.getSparrowAtlas('${curDirectory}/Leaves', 'pibby');
            leaves.animation.addByPrefix("idle", "leaves");
            leaves.animation.play("idle", true);
            leaves.antialiasing = ClientPrefs.data.antialiasing;
            leaves.updateHitbox();
            add(leaves);

            tiger = new FlxSprite(475, 355);
            tiger.frames = Paths.getSparrowAtlas('${curDirectory}/Tiger', 'pibby');
            tiger.animation.addByPrefix("idle", "tiger");
            tiger.animation.play("idle", true);
            tiger.antialiasing = ClientPrefs.data.antialiasing;
            tiger.updateHitbox();
            add(tiger);

            glen = new FlxSprite(225, 450);
            glen.frames = Paths.getSparrowAtlas('${curDirectory}/Glen', 'pibby');
            glen.animation.addByPrefix("idle", "glen");
            glen.animation.play("idle", true);
            glen.antialiasing = ClientPrefs.data.antialiasing;
            glen.updateHitbox();
            add(glen);

            krakus = new FlxSprite(400, 600);
            krakus.frames = Paths.getSparrowAtlas('${curDirectory}/Krakus', 'pibby');
            krakus.animation.addByPrefix("idle", "krakus");
            krakus.animation.play("idle", true);
            krakus.antialiasing = ClientPrefs.data.antialiasing;
            krakus.updateHitbox();
            add(krakus);

            var tiff:FlxSprite = new FlxSprite(50, 625);
            tiff.frames = Paths.getSparrowAtlas('${curDirectory}/Tiff', 'pibby');
            tiff.animation.addByPrefix("idle", "Tiff");
            tiff.animation.play("idle", true);
            tiff.antialiasing = ClientPrefs.data.antialiasing;
            tiff.scale.set(1.15, 1.15);
            tiff.updateHitbox();
            add(tiff);

            var brit:FlxSprite = new FlxSprite(200, 580);
            brit.frames = Paths.getSparrowAtlas('${curDirectory}/Brit', 'pibby');
            brit.animation.addByPrefix("idle", "Brit");
            brit.animation.play("idle", true);
            brit.antialiasing = ClientPrefs.data.antialiasing;
            brit.scale.set(1.15, 1.15);
            brit.updateHitbox();
            add(brit);

            smytus = new FlxSprite(1550, 275);
            smytus.frames = Paths.getSparrowAtlas('${curDirectory}/Smytus', 'pibby');
            smytus.animation.addByPrefix("idle", "smytus final");
            smytus.animation.play("idle", true);
            smytus.antialiasing = ClientPrefs.data.antialiasing;
            smytus.updateHitbox();
            add(smytus);

            bitch = new FlxSprite(2075, 625);
            bitch.frames = Paths.getSparrowAtlas('${curDirectory}/WhatsThisBitchsName', 'pibby');
            bitch.animation.addByPrefix("idle", "idfk");
            bitch.animation.play("idle", true);
            bitch.antialiasing = ClientPrefs.data.antialiasing;
            bitch.updateHitbox();
            add(bitch);

            var killgore:FlxSprite = new FlxSprite(2200, 950);
            killgore.frames = Paths.getSparrowAtlas('${curDirectory}/Killgore', 'pibby');
            killgore.animation.addByPrefix("idle", "killgore");
            killgore.animation.play("idle", true);
            killgore.antialiasing = ClientPrefs.data.antialiasing;
            killgore.updateHitbox();
            add(killgore);

            if (PlayState.SONG.song.toLowerCase() == 'malware') 
            {
                skinsuit.alpha = 0.001;
                tiger.alpha = 0.001;
                krakus.alpha = 0.001;
                glen.alpha = 0.001;
                bitch.alpha = 0.001;
                smytus.alpha = 0.001;
            }
        }
        
        override function createPost()
        {
            // Use this function to layer things above characters!
        }
    
        override function update(elapsed:Float)
        {
            // Code here
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
            // Code here
        }
        override function beatHit()
        {
            if (PlayState.SONG.song == 'Malware')
            {
                switch (curBeat)
                { 
                    case 288: 
                        FlxTween.tween(game.camHUD, {alpha: 0}, 1);

                    case 294: 
                        FlxTween.tween(game.camHUD, {alpha: 1}, 0.7);

                    case 296: 
                        // i need this so badly so they come out randomly
                        if (ClientPrefs.data.flashing) game.camGame.flash(FlxColor.WHITE, 1);
                        tiger.alpha = 1;
                        glen.alpha = 1;
                        krakus.alpha = 1;
                        smytus.alpha = 1;
                        bitch.alpha = 1;
                        skinsuit.alpha = 1;

                    case 424: 
                        FlxTween.tween(game.camGame, {zoom: 2}, 4, {ease: FlxEase.quadInOut});
                        game.camGame.fade(FlxColor.BLACK, 2.5);
                        FlxTween.tween(game.camHUD, {alpha: 0}, 3);
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