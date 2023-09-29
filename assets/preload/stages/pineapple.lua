function onCreate()
    addHaxeLibrary('FlxTween', 'flixel.tweens')
    makeLuaSprite('bg', 'spongebob/sp_house_bg_final_bg', -400, -380)
    setGraphicSize('bg', getProperty('bg.width') * 1.35)
    setScrollFactor('bg', 0.95, 0.95)
    addLuaSprite('bg')

    makeAnimatedLuaSprite('gary', 'spongebob/GaryAnims', 900, 560)
    addAnimationByPrefix('gary', 'idle', 'Gary Anim', 24, false)
    playAnim('gary', 'idle')
    setGraphicSize('gary', getProperty('gary.width') * 1.65)
    setScrollFactor('gary', 0.95, 0.95)
    addLuaSprite('gary')
    
    makeAnimatedLuaSprite('GlitchBehindChair', 'spongebob/GlitchBehindChair', 910, 660)
    addAnimationByPrefix('GlitchBehindChair', 'GlitchBehindChair', 'GlitchBehindChair', 40, true)
    playAnim('GlitchBehindChair', 'GlitchBehindChair')
    setGraphicSize('GlitchBehindChair', getProperty('GlitchBehindChair.width') * 1.65)
    setScrollFactor('GlitchBehindChair', 0.95, 0.95)
    addLuaSprite('GlitchBehindChair')

    makeAnimatedLuaSprite('GlitchInFishEye', 'spongebob/GlitchInFishEye', -150, 210)
    addAnimationByPrefix('GlitchInFishEye', 'GlitchInFishEye', 'GlitchInFishEye', 40, true)
    playAnim('GlitchInFishEye', 'GlitchInFishEye')
    setGraphicSize('GlitchInFishEye', getProperty('GlitchInFishEye.width') * 1.65)
    setScrollFactor('GlitchInFishEye', 0.95, 0.95)
    addLuaSprite('GlitchInFishEye')

    makeAnimatedLuaSprite('GlitchInFishMouth', 'spongebob/GlitchInFishMouth', -370, 230)
    addAnimationByPrefix('GlitchInFishMouth', 'GlitchInFishMouth', 'GlitchInFishMouth', 30, true)
    playAnim('GlitchInFishMouth', 'GlitchInFishMouth')
    setGraphicSize('GlitchInFishMouth', getProperty('GlitchInFishMouth.width') * 1.65)
    setScrollFactor('GlitchInFishMouth', 0.95, 0.95)
    addLuaSprite('GlitchInFishMouth')

    makeAnimatedLuaSprite('GlitchOnDaFishTail', 'spongebob/GlitchOnDaFishTail', 320, 230)
    addAnimationByPrefix('GlitchOnDaFishTail', 'GlitchOnDaFishTail', 'GlitchOnDaFishTail', 30, true)
    playAnim('GlitchOnDaFishTail', 'GlitchOnDaFishTail')
    setGraphicSize('GlitchOnDaFishTail', getProperty('GlitchOnDaFishTail.width') * 1.65)
    setScrollFactor('GlitchOnDaFishTail', 0.95, 0.95)
    addLuaSprite('GlitchOnDaFishTail')

    makeAnimatedLuaSprite('GlitchOnDaCeiling', 'spongebob/GlitchOnDaCeiling', 1520, -300)
    addAnimationByPrefix('GlitchOnDaCeiling', 'GlitchOnDaCeiling', 'GlitchOnDaCeiling', 30, true)
    playAnim('GlitchOnDaCeiling', 'GlitchOnDaFishTail')
    setGraphicSize('GlitchOnDaCeiling', getProperty('GlitchOnDaCeiling.width') * 1.65)
    setScrollFactor('GlitchOnDaCeiling', 0.95, 0.95)
    addLuaSprite('GlitchOnDaCeiling')

    makeAnimatedLuaSprite('GlitchOnDaChair', 'spongebob/GlitchOnDaChair', 1210, 280)
    addAnimationByPrefix('GlitchOnDaChair', 'GlitchOnDaChair', 'GlitchOnDaChair ', 30, true)
    playAnim('GlitchOnDaChair', 'GlitchOnDaChair')
    setGraphicSize('GlitchOnDaChair', getProperty('GlitchOnDaChair.width') * 1.65)
    setScrollFactor('GlitchOnDaChair', 0.95, 0.95)
    addLuaSprite('GlitchOnDaChair')

    makeAnimatedLuaSprite('GlitchOnDaSeat', 'spongebob/GlitchOnDaSeat', 1080, 705)
    addAnimationByPrefix('GlitchOnDaSeat', 'GlitchOnDaSeat', 'GlitchOnDaSeat', 30, true)
    playAnim('GlitchOnDaSeat', 'GlitchOnDaSeat')
    setGraphicSize('GlitchOnDaSeat', getProperty('GlitchOnDaSeat.width') * 1.65)
    setScrollFactor('GlitchOnDaSeat', 0.95, 0.95)
    addLuaSprite('GlitchOnDaSeat')

    makeAnimatedLuaSprite('GlitchUnderDoor', 'spongebob/GlitchUnderDoor', 520, 630)
    addAnimationByPrefix('GlitchUnderDoor', 'GlitchUnderDoor', 'GlitchUnderDoor', 30, true)
    playAnim('GlitchUnderDoor', 'GlitchUnderDoor')
    setGraphicSize('GlitchUnderDoor', getProperty('GlitchUnderDoor.width') * 1.65)
    setScrollFactor('GlitchUnderDoor', 0.95, 0.95)
    addLuaSprite('GlitchUnderDoor')

    makeAnimatedLuaSprite('GlitchOnDaMiddleWall', 'spongebob/GlitchOnDaMiddleWall', 700, 50)
    addAnimationByPrefix('GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall', 30, true)
    playAnim('GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall')
    setGraphicSize('GlitchOnDaMiddleWall', getProperty('GlitchOnDaMiddleWall.width') * 1.65)
    setScrollFactor('GlitchOnDaMiddleWall', 0.95, 0.95)
    addLuaSprite('GlitchOnDaMiddleWall')

    makeAnimatedLuaSprite('GlitchOnDaLeftWall', 'spongebob/GlitchOnDaLeftWall', -120, -190)
    addAnimationByPrefix('GlitchOnDaLeftWall', 'GlitchOnDaLeftWall', 'GlitchOnDaLeftWall', 30, true)
    playAnim('GlitchOnDaLeftWall', 'GlitchOnDaLeftWall')
    setGraphicSize('GlitchOnDaLeftWall', getProperty('GlitchOnDaLeftWall.width') * 1.65)
    setScrollFactor('GlitchOnDaLeftWall', 0.95, 0.95)
    addLuaSprite('GlitchOnDaLeftWall')

    makeLuaSprite('yeah', nil, -300, -200)
    makeGraphic('yeah', 5000, 5000, '000000')
    setScrollFactor('yeah', 0, 0)
    setProperty('yeah.alpha', 0.85)
    addLuaSprite('yeah', true)

    cameraFade('other', '000000', 0.0001)
    setProperty("camHUD.alpha", 0, false)

    setProperty("skipArrowStartTween", true, false)
end

function onCreatePost()
    for i, yeah in pairs({'healthBar', 'iconP1', 'iconP2', 'scoreTxt'}) do
        setProperty(yeah..".alpha", 0, false)
    end

    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'alpha', 0)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('gary', 'idle')
    end

    if curBeat == 8 then
        for i, yeah in pairs({'GlitchOnDaFishTail', 'GlitchInFishMouth', 'GlitchInFishEye', 'GlitchBehindChair', 
        'GlitchOnDaLeftWall', 'GlitchOnDaMiddleWall', 'GlitchOnDaSeat', 'GlitchUnderDoor', 'GlitchOnDaCeiling', 'GlitchOnDaChair'}) do
        setProperty(""..yeah..".alpha", 0, false)
        end
        setPropertyFromClass('flixel.FlxG', 'camera.zoom', 2)
        runHaxeCode([[
            game.camOther.fade(0x000000, 5, true)
        ]])
        doTweenZoom('a', 'camGame',  0.75, 6, 'smoothStepInOut')
    end

    if curBeat == 95 then
        for i, yeah in pairs({'healthBar', 'iconP1', 'iconP2', 'scoreTxt'}) do
            setProperty(yeah..".alpha", 1, false)
        end
    
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 1)
        end

        setProperty("yeah.alpha", 0, false)
        setHealth(1)
        for i, yeah3 in pairs({'GlitchOnDaFishTail', 'GlitchInFishMouth', 'GlitchInFishEye', 'GlitchBehindChair', 
        'GlitchOnDaLeftWall', 'GlitchOnDaMiddleWall', 'GlitchOnDaSeat', 'GlitchUnderDoor', 'GlitchOnDaCeiling', 'GlitchOnDaChair'}) do
            setProperty(""..yeah3..".alpha", 1, false)
        end
    end
end