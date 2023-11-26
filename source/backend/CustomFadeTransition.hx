package backend;

class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback: Void->Void;
	private var leTween: FlxTween = null;
	public static var nextCamera: FlxCamera;
	public static var isOnInitialize: Bool = false;
	
    private var isTransIn: Bool = false;
    private var interfaceSprite: FlxSprite;
	private var interfaceSpriteTrans: FlxSprite;


	public function new(duration:Float, isTransIn:Bool) {
		super();

		this.isTransIn = isTransIn;

		var zoom:Float = FlxMath.bound(FlxG.camera.zoom, 0.05, 1);
		var width:Int = Std.int(FlxG.width / zoom);
		var height:Int = Std.int(FlxG.height / zoom);

		interfaceSprite = new FlxSprite();
		if (!isOnInitialize)
		{
			interfaceSprite.makeGraphic(1, height + 400, FlxColor.BLACK);
			isOnInitialize = true;
		}
		else
		{
			interfaceSpriteTrans = new FlxSprite();
			interfaceSpriteTrans.frames = Paths.getSparrowAtlas('menus/titlescreen/menuInterference', 'pibby');
			interfaceSpriteTrans.animation.addByPrefix('idle', 'thing', 24);
			interfaceSpriteTrans.animation.play('idle');
			interfaceSpriteTrans.antialiasing = ClientPrefs.data.antialiasing;
			interfaceSpriteTrans.setGraphicSize(Std.int(interfaceSpriteTrans.width * 3));
			interfaceSpriteTrans.updateHitbox();
			interfaceSpriteTrans.alpha = 0;
			interfaceSpriteTrans.scrollFactor.set();

			interfaceSprite.frames = Paths.getSparrowAtlas('menus/titlescreen/menuInterference', 'pibby');
			interfaceSprite.animation.addByPrefix('idle', 'thing', 24);
			interfaceSprite.animation.play('idle');
			interfaceSprite.antialiasing = ClientPrefs.data.antialiasing;
		}

		interfaceSprite.setGraphicSize(Std.int(interfaceSprite.width * 3));
		interfaceSprite.updateHitbox();
		interfaceSprite.scrollFactor.set();
		add(interfaceSprite);
	
		if (isOnInitialize)
			add(interfaceSpriteTrans);

		if(isTransIn)
			FlxTween.tween(interfaceSprite, {alpha: 1}, duration, {
			    ease: FlxEase.linear,
                onComplete: function(twn:FlxTween) 
					{
						if (isOnInitialize && interfaceSpriteTrans != null)
							interfaceSpriteTrans.alpha = 1;
						close();
					}
			});
		else
            leTween = FlxTween.tween(interfaceSprite, {alpha: 0}, duration, {
			    ease: FlxEase.linear,
                onComplete: function(twn:FlxTween) 
					if (finishCallback != null)
					{
						if (isOnInitialize && interfaceSpriteTrans != null)
							interfaceSpriteTrans.alpha = 0;
						finishCallback();
					}
            });

		if(nextCamera != null)
		{
			if (isOnInitialize)
				interfaceSpriteTrans.cameras = [nextCamera];
			interfaceSprite.cameras = [nextCamera];
		}
		
		nextCamera = null;
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
	}

	override function destroy() {
		if(leTween != null) {
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}