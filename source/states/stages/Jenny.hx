package states.stages;

typedef CameraEvent = {
    start: Int,
    end: Int,
    onHit: Int,
    ?camAmount: Float,
    ?hudAmount: Float
}

class Jenny extends BaseStage 
{
    private var skinsuit : FlxSprite;
    private var tiger : FlxSprite;
    private var glen : FlxSprite;
    private var krakus : FlxSprite;
    private var smytus : FlxSprite;
    private var bitch : FlxSprite;

    private var blackScreen: FlxSprite;

	override function create()
        {
            game.camZooming = true;

            var bg: FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/BackBackground2'));
            bg.scale.set(1.9, 2);
            bg.scrollFactor.set(0.95, 0.95);
            bg.updateHitbox();
            add(bg);

            skinsuit = new FlxSprite(50, 300);
            skinsuit.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            skinsuit.animation.addByPrefix("idle", "skinsuit final");
            skinsuit.animation.play("idle", true); 
            skinsuit.antialiasing = ClientPrefs.data.antialiasing;
            skinsuit.updateHitbox();
            add(skinsuit);
            
            var right_leaves:FlxSprite = new FlxSprite(0, 10);
            right_leaves.frames = Paths.getSparrowAtlas('${curDirectory}/Leaves');
            right_leaves.animation.addByPrefix("idle", "right_leaves");
            right_leaves.animation.play("idle", true);
            right_leaves.antialiasing = ClientPrefs.data.antialiasing;
            right_leaves.updateHitbox();
            add(right_leaves);
            
            var left_leaves:FlxSprite = new FlxSprite(0, 10);
            left_leaves.frames = Paths.getSparrowAtlas('${curDirectory}/Leaves');
            left_leaves.animation.addByPrefix("idle", "left_leaves");
            left_leaves.animation.play("idle", true);
            left_leaves.antialiasing = ClientPrefs.data.antialiasing;
            left_leaves.updateHitbox();
            add(left_leaves);
            
            var realbg:FlxSprite = new FlxSprite(0, 0);
            realbg.frames = Paths.getSparrowAtlas('${curDirectory}/houseJenny');
            realbg.animation.addByPrefix("idle", "bgL0");
            realbg.animation.play("idle", true);
            realbg.antialiasing = ClientPrefs.data.antialiasing;
            realbg.updateHitbox();
            realbg.x+=1;
            add(realbg);
            
            var realbg:FlxSprite = new FlxSprite(0, 0);
            realbg.frames = Paths.getSparrowAtlas('${curDirectory}/houseJenny');
            realbg.animation.addByPrefix("idle", "bgR0");
            realbg.animation.play("idle", true);
            realbg.antialiasing = ClientPrefs.data.antialiasing;
            realbg.updateHitbox();
            realbg.x-=1;
            add(realbg);
            
            var realbg:FlxSprite = new FlxSprite(0, 0);
            realbg.frames = Paths.getSparrowAtlas('${curDirectory}/houseJenny');
            realbg.animation.addByPrefix("idle", "bgM0");
            realbg.animation.play("idle", true);
            realbg.antialiasing = ClientPrefs.data.antialiasing;
            realbg.updateHitbox();
            
            add(realbg);

            

            tiger = new FlxSprite(475, 355);
            tiger.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            tiger.animation.addByPrefix("idle", "tiger");
            tiger.animation.play("idle", true);
            tiger.antialiasing = ClientPrefs.data.antialiasing;
            tiger.updateHitbox();
            add(tiger);

            glen = new FlxSprite(225, 450);
            glen.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            glen.animation.addByPrefix("idle", "glen");
            glen.animation.play("idle", true);
            glen.antialiasing = ClientPrefs.data.antialiasing;
            glen.updateHitbox();
            add(glen);

            krakus = new FlxSprite(400, 600);
            krakus.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            krakus.animation.addByPrefix("idle", "krakus");
            krakus.animation.play("idle", true);
            krakus.antialiasing = ClientPrefs.data.antialiasing;
            krakus.updateHitbox();
            add(krakus);
            
			var brit:FlxSprite = new FlxSprite(200, 580);
            brit.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            brit.animation.addByPrefix("idle", "Brit");
            brit.animation.play("idle", true);
            brit.antialiasing = ClientPrefs.data.antialiasing;
            brit.scale.set(1.15, 1.15);
            brit.updateHitbox();
            add(brit);
            
            var tiff:FlxSprite = new FlxSprite(50, 625);
            tiff.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            tiff.animation.addByPrefix("idle", "Tiff");
            tiff.animation.play("idle", true);
            tiff.antialiasing = ClientPrefs.data.antialiasing;
            tiff.scale.set(1.15, 1.15);
            tiff.updateHitbox();
            add(tiff);

            smytus = new FlxSprite(1550, 275);
            smytus.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            smytus.animation.addByPrefix("idle", "smytus final");
            smytus.animation.play("idle", true);
            smytus.antialiasing = ClientPrefs.data.antialiasing;
            smytus.updateHitbox();
            add(smytus);

            bitch = new FlxSprite(2075, 625);
            bitch.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            bitch.animation.addByPrefix("idle", "idfk");
            bitch.animation.play("idle", true);
            bitch.antialiasing = ClientPrefs.data.antialiasing;
            bitch.updateHitbox();
            add(bitch);

            var killgore:FlxSprite = new FlxSprite(2200, 950);
            killgore.frames = Paths.getSparrowAtlas('${curDirectory}/bgCharacters');
            killgore.animation.addByPrefix("idle", "killgore");
            killgore.animation.play("idle", true);
            killgore.antialiasing = ClientPrefs.data.antialiasing;
            killgore.updateHitbox();
            add(killgore);

            blackScreen = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
            blackScreen.cameras = [ game.camHUD ];
            blackScreen.alpha = 0.001;
            add(blackScreen);

            if (PlayState.SONG.song.toLowerCase() == 'nanovirus')
            {
                addCameraEvent(128, 383, 8, 0.01, 0.01);
                addCameraEvent(384, 639, 8);
                addCameraEvent(896, 1407, 4, 0.0075, 0.01);

                game.camZooming = false;
            }

            if (PlayState.SONG.song.toLowerCase() == 'malware') 
            {
                // camera event shit cuz im lazy
                addCameraEvent(128, 384, 8);
                addCameraEvent(512, 624, 8);
                addCameraEvent(640, 880, 8);
                addCameraEvent(896, 1136, 8);

                // speeds up
                addCameraEvent(1184, 1696, 4);

                // slows down before end
                addCameraEvent(1697, 1728, 8);

                skinsuit.alpha = 0.001;
                tiger.alpha = 0.001;
                krakus.alpha = 0.001;
                glen.alpha = 0.001;
                bitch.alpha = 0.001;
                smytus.alpha = 0.001;

                blackScreen.alpha = 1;
            }
        }
        
        override function createPost()
        {
            if (PlayState.SONG.song == "Nanovirus") {
                PlayState.instance.camHUD.alpha = 0;
            }

            if (PlayState.SONG.song == "Malware") {

            }
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
        
        private var cameraEvents: Array<CameraEvent> = [];
        /**
         * Helper class to create camera events in an easier fashion.
         * @param start At what point to start in steps
         * @param end At what point to end in steps
         * @param onHit What mod should be hit to start a zoom
         * @param camAmount What the game camera should bop at, default is 0.015
         * @param hudAmount What the HUD camera should bop at, default is 0.03
         */
        private function addCameraEvent(start: Int, end: Int, onHit: Int, ?camAmount: Float, ?hudAmount: Float)
        {
            cameraEvents.push(cast {
                start: start,
                end: end,
                onHit: onHit,
                camAmount: camAmount != null ? camAmount : 0.015,
                hudAmount: hudAmount != null ? hudAmount : 0.03,
            });
        }

        private function tweenCam(x: Float, y: Float, time: Float, ?zoom: Float)
        {
            @:privateAccess {
                game.isCameraOnForcedPos = true;

                FlxTween.tween(game.camFollow, { x: x, y: y  }, time, { ease: FlxEase.quadInOut });
                FlxTween.tween(FlxG.camera, { zoom: zoom }, time, { ease: FlxEase.quadInOut });
                FlxTween.num(game.defaultCamZoom, zoom, time, { ease: FlxEase.quadInOut }, function(_) { game.defaultCamZoom = _; });
            }
        }

        @:noCompletion
        private function _cameraEvent(currentStep: Int)
        {
            for (event in cameraEvents)
                if (currentStep >= event.start && currentStep <= event.end)
                    if (currentStep % event.onHit == 0) {
                        FlxG.camera.zoom += event.camAmount;
                        game.camHUD.zoom += event.hudAmount;
                        break;
                    }
        }

        // Steps, Beats and Sections:
        //    curStep, curDecStep
        //    curBeat, curDecBeat
        //    curSection
        override function stepHit()
        {
            _cameraEvent(curStep);

            if (PlayState.SONG.song == "Nanovirus") {
                switch (curStep) {
                    case 112: {
                        tweenCam(868.7, 892.6, 0.8, 0.75);
                        FlxTween.tween(game.camHUD, { alpha: 1 }, 0.65, { ease: FlxEase.quadInOut });
                    }

                    case 145: {
                        @:privateAccess
                            game.isCameraOnForcedPos = false;
                    }

                    case 635: {
                        tweenCam(868.7, 892.6, 0.75, 0.9);
                    }
                    
                    case 646: {
                        @:privateAccess
                            game.isCameraOnForcedPos = false;
                    }

                    case 880: {
                        @:privateAccess
                            game.isCameraOnForcedPos = true;

                        FlxTween.tween(FlxG.camera, { zoom: 0.75 }, 1.2, { ease: FlxEase.quadInOut });
                        FlxTween.num(game.defaultCamZoom, 0.75, 1.3, { ease: FlxEase.quadInOut }, function(_) { game.defaultCamZoom = _; });
                    }
                    
                    case 896: {
                        @:privateAccess
                            game.isCameraOnForcedPos = false;
                    }

                    case 1416: {
                        FlxTween.tween(blackScreen, { alpha: 1 }, 2.5, { ease: FlxEase.quadIn });
                        FlxTween.tween(game.camHUD, { alpha: 0 }, 2, { ease: FlxEase.quadInOut });
                    }
                }

            }

            if (PlayState.SONG.song == "Malware") {
                switch (curStep) {
                    case 1: {
                        @:privateAccess {
                            game.isCameraOnForcedPos = true;
                            game.defaultCamZoom = 1.4;
                            game.camFollow.setPosition(1350, 250);
                        }

                        FlxTween.tween(blackScreen, { alpha: 0 }, 12.8, { ease: FlxEase.quadIn });
                    }

                    case 16: {
                        tweenCam(1250, 600, 10, 0.6);
                    }
                       
                    case 120: {
                        tweenCam(868.7, 892.6, 1.2, 0.75);
                    }

                    case 137: {
                        @:privateAccess
                            game.isCameraOnForcedPos = false;
                    }

                    case 1142: {
                        tweenCam(868.7, 892.6, 0.9, 0.9);
                    }

                    case 1168: {
                        @:privateAccess
                            game.isCameraOnForcedPos = false;
                        FlxTween.tween(FlxG.camera, { zoom: 0.75 }, 1.2, { ease: FlxEase.quadInOut });
                        FlxTween.num(game.defaultCamZoom, 0.75, 1.3, { ease: FlxEase.quadInOut }, function(_) { game.defaultCamZoom = _; });
                    }

                    case 1728: {
                        blackScreen.alpha = 1;
                    }
                }
            }
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
