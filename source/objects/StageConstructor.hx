package objects;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup.FlxTypedGroup;
import states.PlayState.instance as PlayState;


// Just a simple stage constructor to make code more clean and organized
class StageConstructor extends FlxTypedGroup<FlxBasic> {
    
    // Pirate sprites
    private var pirate_1 : FlxSprite;
    private var pirate_2 : FlxSprite;
    private var pirate_3 : FlxSprite;

    private var skinsuit : FlxSprite;
    private var tiger : FlxSprite;
    private var glen : FlxSprite;
    private var krakus : FlxSprite;
    private var smytus : FlxSprite;
    private var bitch : FlxSprite;

    private var park : FlxSprite;
    private var glitchPuddle : FlxSprite;
    private var glitchOnCart : FlxSprite;

    public var curStage : String;
    private var curDirectory : String;

    // We have different variations of groundwork! We have foreground, baseground, and midground
    public var foreground : FlxTypedGroup<FlxBasic>;
    public var midground : FlxTypedGroup<FlxBasic>;


    // We construct a new stage and set up the meta data within it
    public function new(curStage : String) {
        // Setup metadata
        super();
        this.curStage = curStage;

        foreground = new FlxTypedGroup<FlxBasic>();
        midground = new FlxTypedGroup<FlxBasic>();

        curDirectory = 'weeks/${curStage}';
        // Switch through all of the possible weeks to see which match
        switch(curStage) {
            case 'at_lab':
                PlayState.dad_cameraoffset = 30;
                PlayState.bf_cameraoffset = 10;

                var bg:BGSprite = new BGSprite('${curDirectory}/Background', -1000, -500, 0.75, 0.75);
				bg.updateHitbox();
				add(bg);

				var mg:BGSprite = new BGSprite('${curDirectory}/Middleground', -1150, -580, 0.75, 0.75);
				mg.updateHitbox();
				add(mg);

				var boardGlitch:BGSprite = new BGSprite('${curDirectory}/glitch_2', 100, -300, 0.75, 0.75, ['glitch 2'], true);
				boardGlitch.updateHitbox();
				add(boardGlitch);

				var tableGlitch:BGSprite = new BGSprite('${curDirectory}/glitch_3', -1200, -600, 0.825, 0.825, ['glitch 3'], true);
				tableGlitch.updateHitbox();
				add(tableGlitch);

				var table:BGSprite = new BGSprite('${curDirectory}/Table', -1025, -500, 0.825, 0.825);
				table.setGraphicSize(Std.int(table.width * 0.9));
				table.updateHitbox();
				add(table);

				var frontGlitch:BGSprite = new BGSprite('${curDirectory}/glitch_1', -925, -600, 0.825, 0.825, ['glitch 1'], true);
				frontGlitch.setGraphicSize(Std.int(frontGlitch.width * 1.1));
				frontGlitch.updateHitbox();
				add(frontGlitch);

				PlayState.finn_slash = new BGSprite('${curDirectory}/Finn_Pibby_Slash', PlayState.DAD_X, PlayState.DAD_Y, 1, 1, ['Finn Slash']);
				PlayState.finn_slash.visible = false;

            case 'jenny':
                PlayState.dad_cameraoffset = 30;
                PlayState.bf_cameraoffset = 10;

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

                if (PlayState.songName == 'malware') 
                {
                    skinsuit.alpha = 0.001;
                    tiger.alpha = 0.001;
                    krakus.alpha = 0.001;
                    glen.alpha = 0.001;
                    bitch.alpha = 0.001;
                    smytus.alpha = 0.001;
                }

            
            case 'livesey': 
                PlayState.dad_cameraoffset = 30;
                PlayState.bf_cameraoffset = 10;

                var back : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/boat', 'pibby'));
                add(back);

                var table : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/barrel', 'pibby'));
                midground.add(table);

                var candle : FlxSprite = new FlxSprite(1550, 1800).loadGraphic(Paths.image('${curDirectory}/candle', 'pibby'));
                foreground.add(candle);
            
            case 'livesey-boat': 
                PlayState.dad_cameraoffset = 20;
                PlayState.bf_cameraoffset = 20;

                var sky : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/8', 'pibby'));
                add(sky);

                var goowater : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/7', 'pibby'));
                add(goowater);

                var boattop : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/6', 'pibby'));
                add(boattop);


                

                pirate_1 = new FlxSprite(950, 1400);
                pirate_1.frames = Paths.getSparrowAtlas('${curDirectory}/pirate_1', 'pibby');
                pirate_1.animation.addByPrefix("idle", "pirate 1 idle");
                pirate_1.animation.play("idle", true);
                pirate_1.scale.set(1.5, 1.5);
                pirate_1.updateHitbox();
                add(pirate_1);

                pirate_2 = new FlxSprite(1875, 1550);
                pirate_2.frames = Paths.getSparrowAtlas('${curDirectory}/Killgore');
                pirate_2.animation.addByPrefix("idle", "pirate 2 idle");
                pirate_2.animation.play("idle", true);
                pirate_2.scale.set(1.5, 1.5);
                pirate_2.updateHitbox();
                add(pirate_2);

                pirate_3 = new FlxSprite(2300, 1650);
                pirate_3.frames = Paths.getSparrowAtlas('${curDirectory}/pirate_3', 'pibby');
                pirate_3.animation.addByPrefix("idle", "pirate 3 idle");
                pirate_3.animation.play("idle", true);
                pirate_3.scale.set(1.5, 1.5);
                pirate_3.updateHitbox();
                add(pirate_3);

                var capstan : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/5', 'pibby'));
                add(capstan);

                var sails : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/4', 'pibby'));
                add(sails);

                var side : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/3', 'pibby'));
                add(side);

                var topstuff : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/2', 'pibby'));
                add(topstuff);

                var pisswater : FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('${curDirectory}/1', 'pibby'));
                add(pisswater);
            
            case 'regular_show': 
                PlayState.dad_cameraoffset = 20;
                PlayState.bf_cameraoffset = 20;

                park = new FlxSprite(0, 400).loadGraphic(Paths.image('${curDirectory}/park', 'pibby'));
                add(park);

                glitchPuddle = new FlxSprite(-100, 1380);
                glitchPuddle.frames = Paths.getSparrowAtlas('${curDirectory}/Untitled-1', 'pibby');
                glitchPuddle.animation.addByPrefix("glitch", "puddle");
                glitchPuddle.animation.play("glitch", true);
                add(glitchPuddle);

                glitchOnCart = new FlxSprite(570, 1000);
                glitchOnCart.frames = Paths.getSparrowAtlas('${curDirectory}/GlitchCart', 'pibby');
                glitchOnCart.animation.addByPrefix("glitch2", "GlitchOnCart");
                glitchOnCart.animation.play("glitch2", true);
                add(glitchOnCart);
            
        }
    }

    public function getSettings() {
        switch(curStage) {
            case 'livesey':
                PlayState.healthBar.alpha = 0;
                PlayState.iconP1.alpha = 0;
                PlayState.iconP2.alpha = 0;
                PlayState.scoreTxt.alpha = 0;
                PlayState.timeBar.visible = false;
                PlayState.timeTxt.visible = false;
                PlayState.scoreTxt.y -= 36;
                Main.fpsVar.visible = false;


                for (curIndex in 0 ... 4) {
                    PlayState.opponentStrums.members[curIndex].visible = false;
                    PlayState.opponentStrums.members[curIndex].x = 415 + (115 * curIndex);
                    PlayState.playerStrums.members[curIndex].x = 415 + (115 * curIndex);
                    PlayState.playerStrums.members[curIndex].visible = false;
                }
                
                
                PlayState.dad.alpha = 0.0001;

            case 'livesey-boat':
                for (curIndex in 0 ... 4) {
                    PlayState.opponentStrums.members[curIndex].visible = false;
                    PlayState.playerStrums.members[curIndex].visible = false;
                }
        }
    }


    public function onStep ( curStep : Int )
        {
            switch (curStage)
            {
                case 'livesey-boat':
                    if (curStep == 1)
                        for (curIndex in 0 ... 4) {
                            PlayState.opponentStrums.members[curIndex].alpha = 0;
                            PlayState.playerStrums.members[curIndex].alpha = 0;
                        }
                        
            }
        }

    
    public function onBeat(curBeat : Int) {
        switch(curStage) {
            case 'livesey-boat':
                if (curBeat % 4 == 0) {
                    pirate_1.animation.play("idle");
                    pirate_2.animation.play("idle");
                    pirate_3.animation.play("idle");
                    PlayState.gf.animation.play("beat");
                }
            
            case 'jenny':
                if (curBeat == 295) {
                    tiger.alpha = 1;
                    glen.alpha = 1;
                    krakus.alpha = 1;
                    smytus.alpha = 1;
                    bitch.alpha = 1;
                    skinsuit.alpha = 1;
                }
        }
    }

    override function add(object : FlxBasic):FlxBasic {
        if (!ClientPrefs.data.antialiasing) cast(object, FlxSprite).antialiasing = false;
        return super.add(object);
    }
}