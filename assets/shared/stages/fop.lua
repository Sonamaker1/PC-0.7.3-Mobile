initialOffset1 = 0
initialOffset2 = 0

function onCreatePost()
    luaDebugMode = true
    addHaxeLibrary("Paths", 'backend')
    addHaxeLibrary('Std')
    addHaxeLibrary("FlxMath", 'flixel.math')
    addHaxeLibrary("HealthIcon", 'objects')

    initialOffset1 = getProperty("opponentCameraOffset[0]", false)
    initialOffset2 = getProperty("boyfriendCameraOffset[0]", false)

    makeLuaSprite("bg", 'fop/bg', 0, 0)
    setGraphicSize("bg", getProperty("bg.width", false) * .8)
    addLuaSprite("bg", false)
    setProperty("bg.alpha", 0, false)

    makeLuaSprite("dark", nil, -screenWidth * .8, -screenHeight * .8)
    makeGraphic("dark", screenWidth * 4, screenHeight * 4, '000000')
    setProperty("dark.visible", false, false)
    addLuaSprite("dark", false)

    makeLuaSprite("invisibleObject", nil, 0, 0)
    makeGraphic("invisibleObject", 1, 1, '000000')
    addLuaSprite("invisibleObject", false)

    makeAnimatedLuaSprite("static", nil, 0, 0)
    addLuaSprite("static", false)

    runHaxeCode([[
        game.getLuaObject('static', false).frames = Paths.getSparrowAtlas('menus/titlescreen/menuInterference', 'pibby');
        game.getLuaObject('static', false).animation.addByPrefix('idle', 'thing', 24);
        game.getLuaObject('static', false).animation.play('idle');
        game.getLuaObject('static', false).antialiasing = ClientPrefs.data.antialiasing;
        game.getLuaObject('static', false).setGraphicSize(Std.int(game.getLuaObject('static', false).width * 3));
        game.getLuaObject('static', false).updateHitbox();
        game.getLuaObject('static', false).alpha = 0;
        game.getLuaObject('static', false).scrollFactor.set();
        game.getLuaObject('static', false).camera = game.camOther;
    ]])

    setProperty("boyfriendCameraOffset[0]", getProperty 'boyfriendCameraOffset[0]' + 170, false)

    runHaxeCode([[
        iconP3 = new HealthIcon('timmy', false);
        iconP3.y = game.healthBar.y - 105;
		iconP3.visible = false;
		iconP3.alpha = ClientPrefs.data.healthBarAlpha;
        iconP3.cameras = [game.camHUD];
        game.add(iconP3);

        game.modchartSprites.set('iconP3', iconP3);

        game.moveCamera(false);
    ]])

    setObjectCamera("iconP3", 'camHUD')
    setObjectOrder("iconP3", getObjectOrder("iconP2") - 1)
    addLuaSprite("iconP3", false)

    cameraFade("game", "000000", 0.0001)
    setProperty("camGame.zoom", 3, false)

    setProperty("cameraSpeed", 100, false)

    setProperty("gfGroup.alpha", 0, false)
    setProperty("dadGroup.alpha", 0, false)
    setProperty("camHUD.alpha", 0, false)

    setProperty("opponentCameraOffset[0]", getProperty "opponentCameraOffset[0]" - 150, false)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType == 'GF Sing' then
        setProperty("health", getProperty 'health' + getRandomFloat(.03, .075), false)
    end
end

function onUpdatePost(elapsed)
    setProperty("iconP3.x", getProperty("iconP2.x", false) - 70, false)

    scaleObject("iconP3", lerp(1, getProperty 'iconP3.scale.x', bound(1 - (elapsed * 9 * playbackRate), 0, 1)), lerp(1, getProperty 'iconP3.scale.y', bound(1 - (elapsed * 9 * playbackRate), 0, 1)), true)
    setProperty("iconP3.animation.curAnim.curFrame", getProperty("healthBar.percent", false) > 80 and 1 or 0) 

    for i = 0,getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i ,'gfNote') then
			setPropertyFromGroup('notes', i, 'alpha', 0.3)
		end

		if not getPropertyFromGroup('notes', i ,'mustPress') and not getPropertyFromGroup('notes', i ,'gfNote') then
			setPropertyFromGroup('notes', i, 'alpha', 1)
		end
	end
end

function onSongStart()
    setProperty("camFollow.y", getProperty("camFollow.y") - 600, false)
    runHaxeCode("FlxG.camera.fade(0x000000, 5, true);")
    startTween("coolTween", "camFollow", {['y'] = getProperty("camFollow.y") + 600}, 11, {['ease'] = 'sineInOut'})
    doTweenZoom("coolZoomTween", "camGame", .8, 13, "quadInOut")
    setProperty("cameraSpeed", 1, false)
end

function onBeatHit()
    if curBeat == 64 then
        setProperty("static.alpha", 1, false)
        setProperty("camGame.zoom", 2, false)
        setProperty("cameraSpeed", 100, false)
    end

    if curBeat == 72 then
        doTweenAlpha("staticss", "static", 0, 1)
    end

    if curBeat == 78 then
        doTweenZoom("coolZoomTween", "camGame", .78, 5, "quadInOut")
        doTweenAlpha("dads", "dadGroup", 1, 2, "sineInOut")
       -- setProperty("cameraSpeed", 1, false)
    end

    if curBeat == 96 then
        if flashingLights then cameraFlash("game", "FFFFFF", 1) end

        for m, stuff in pairs({'iconP1', 'iconP2', 'healthBar', 'scoreTxt'}) do
            setProperty(stuff..".alpha", 0, false)
        end

        for i = 0, 3 do setPropertyFromGroup("playerStrums", i, 'alpha', 0, false) end

        setProperty("camGame.zoom", .92, false)
        setProperty("defaultCamZoom", .92, false)

        doTweenAlpha("hudThing", "camHUD", 1, .8, "sineInOut")
        setProperty("bg.alpha", 1, false)
        setProperty("opponentCameraOffset[0]", getProperty "opponentCameraOffset[0]" + 100, false)
        setProperty("boyfriendCameraOffset[0]", getProperty 'boyfriendCameraOffset[0]' - 100, false)
    end

    if curBeat == 110 then
        for i = 4, 7 do noteTweenAlpha("scaryStrums"..i, i, 1, 1, "quartOut") end
    end

    if curBeat == 136 or curBeat == 140 or curBeat == 142 then
        setProperty("cameraSpeed", 1.15, false)

        setProperty("defaultCamZoom", getProperty 'defaultCamZoom' + .05, false)
        setProperty("opponentCameraOffset[0]", getProperty "opponentCameraOffset[0]" - 25, false)
    end

    if curBeat == 144 then
        setProperty("cameraSpeed", 100, false)

        setProperty("defaultCamZoom", getProperty 'defaultCamZoom' - .2, false)
        setProperty("camGame.zoom", getProperty 'defaultCamZoom', false)
    end

    if curBeat == 152 or curBeat == 156 or curBeat == 158 or curBeat == 160 then
        setProperty("cameraSpeed", 1.15, false)

        setProperty("defaultCamZoom", getProperty 'defaultCamZoom' + .09, false)
        --setProperty("boyfriendCameraOffset[0]", getProperty "boyfriendCameraOffset[0]" + 25, false)
    end

    if curBeat == 157 then
        for m, stuff in pairs({'iconP1', 'iconP2', 'healthBar', 'scoreTxt'}) do
            doTweenAlpha("oootheyreturn"..stuff, stuff, 1, 0.5, "quadOut")
        end
    end

    if curBeat == 160 then
        setProperty("defaultCamZoom", .82, false)
        startTween("scaryhealth", "this", {['health'] = getRandomFloat(0.023, .002)}, 0.56, {['ease'] = 'quadOut'})
        cameraShake("hud", 0.1, .7)

        setProperty("opponentCameraOffset[0]", initialOffset1)
        setProperty("boyfriendCameraOffset[0]", initialOffset2)
    end

    if curBeat == 228 then
        setProperty("opponentCameraOffset[0]", getProperty 'opponentCameraOffset[0]' - 35)
        setProperty("defaultCamZoom", .91, false)

        runHaxeCode("game.moveCamera(true);")
    end

    if curBeat == 236 then
        setProperty("opponentCameraOffset[0]", getProperty 'opponentCameraOffset[0]' - 35)
        setProperty("defaultCamZoom", 1.03, false)
        runHaxeCode("game.moveCamera(true);")
    end

    if curBeat == 240 then
        setProperty("opponentCameraOffset[0]", initialOffset1)
        setProperty("defaultCamZoom", .93, false)
        setProperty('cameraSpeed', 2.3)
    end

    if curBeat == 244 then
        setProperty("boyfriendCameraOffset[0]", getProperty 'boyfriendCameraOffset[0]' + 25)
        setProperty("defaultCamZoom", 1.02, false)
        runHaxeCode("game.moveCamera(false);")
    end

    if curBeat == 252 then
        setProperty("boyfriendCameraOffset[0]", getProperty 'boyfriendCameraOffset[0]' + 25)
        setProperty("defaultCamZoom", 1.12, false)
        runHaxeCode("game.moveCamera(false);")
    end

    if curBeat == 254 then
        setProperty("opponentCameraOffset[0]", getProperty 'opponentCameraOffset[0]' - 135)
        setProperty("opponentCameraOffset[1]", getProperty 'opponentCameraOffset[1]' - 70)
        setProperty("camGame.zoom", .78, false)
        setProperty("defaultCamZoom", .78, false)
        runHaxeCode("game.moveCamera(true);")
        startTween("zoomThingieWithDelay", "game.camGame", {['zoom'] = 1.2}, .6, {['ease'] = 'expoOut', ['startDelay'] = .001})
    end

    if curBeat == 256 then
        setProperty("opponentCameraOffset[0]", getProperty 'opponentCameraOffset[0]' + 135)
        setProperty("opponentCameraOffset[1]", getProperty 'opponentCameraOffset[1]' + 70)
    end

    if curBeat == 283 then
        doTweenZoom("yay", "camGame", 2, 4, "linear")
        runHaxeCode("game.camGame.fade(0x000000, .9);")

        for s, coolStuff in pairs({'scoreTxt', 'timeTxt'}) do
            doTweenAlpha("theTweensFor"..coolStuff, coolStuff, 0, 1, 'linear')
        end

        for i = 0, 3 do
            noteTweenX("notesThingie"..i, i, getPropertyFromGroup("opponentStrums", i, 'x') - 800, 1, "linear")
        end
    end

    if curBeat == 288 then
        cancelTween("yay")
        runHaxeCode("game.camGame.fade(0x000000, 5, true);")
        setCharacterX("boyfriend", getCharacterX("boyfriend") + 370)
        setProperty("bg.alpha", 0, false)
        setProperty("defaultCamZoom", .2, false)
        triggerEvent("Camera Follow Pos", 1250, 480)
    end

    if curBeat == 289 then setProperty("defaultCamZoom", .45, false)  end

    if curBeat == 344 then
        setProperty("defaultCamZoom", .7, false)
        triggerEvent("Camera Follow Pos", '', '')
    end

    if curBeat == 348 then
        setProperty("defaultCamZoom", .85, false)
    end

    if curBeat == 352 then
        triggerEvent("Camera Follow Pos", 1000, 680) 
        setProperty("gfGroup.alpha", 1, false)
        setProperty("gfGroup.x", getProperty("gfGroup.x") - 600, false)
        doTweenX("coolgfx", "gfGroup", getProperty("gfGroup.x") + 600, 1, "expoOut")
        doTweenAlpha("daddies", "dadGroup", .5, 1, "linear")
        doTweenAlpha("huddies", "camHUD", 0, 1, "linear")
    end

    if curBeat == 356 then
        doTweenZoom("timmies", "camGame", 5, 6, "sineInOut")
        cameraShake("game", 0.05, 1)
    end

    if curBeat == 360 then
        cancelTween("timmies")
        setProperty("bg.alpha", 1, false)
        cameraFlash("game", "FFFFFF", 1)

        doTweenAlpha("hudUndies", 'camHUD', 1, 1, 'linear')
        for s, coolStuff in pairs({'scoreTxt', 'timeTxt'}) do
            doTweenAlpha("theTweensFor"..coolStuff, coolStuff, 1, 1, 'linear')
        end

        for i = 0, 3 do
            noteTweenX("notesThingie"..i, i, getPropertyFromGroup("opponentStrums", i, 'x') + 800, .001, "linear")
        end

        setProperty("iconP3.visible", true, false)
    end

    if curBeat == 390 then
        setProperty("dadGroup.alpha", 1, false)
        triggerEvent("Camera Follow Pos", '', '') 
        runHaxeCode("game.moveCamera(true);")
        setProperty("defaultCamZoom", .87, false)
    end

    if curBeat == 424 then
        triggerEvent("Camera Follow Pos", 1320, 580) 
        setProperty("defaultCamZoom", .63, false)  
    end

    if curBeat == 480 then
        triggerEvent("Camera Follow Pos", 1000, 680) 
        setProperty("defaultCamZoom", .87, false)
    end

    if curBeat == 484 then
        triggerEvent("Camera Follow Pos", '', '') 
        runHaxeCode("game.moveCamera(true);")
        setProperty("defaultCamZoom", .87, false)
    end

    if curBeat == 488 then
        setProperty("camGame.alpha", 0, false)
        cameraFlash("hud", "FFFFFF", 1)

        for e, objects in pairs({'iconP1', 'iconP2', 'iconP3', 'healthBar', 'timeTxt', 'scoreTxt'}) do 
            setProperty(objects..".alpha", 0, false)
        end

        for i = 0, 3 do setPropertyFromGroup("playerStrums", i, 'alpha', 0, false) end

        doTweenAlpha("last", "camHUD", 0, 8, "quadInOut")
    end

    if curBeat % 8 == 0 and curBeat >= 160 and getRandomInt(1, 4) == 1 then
        startTween("scaryhealth", "this", {['health'] = getRandomFloat(0.023, .002)}, 0.56, {['ease'] = 'quadOut'})
        cameraShake("hud", 0.1, .7)
        triggerEvent("Add Camera Zoom", .04, 0)
        triggerEvent("Change Scroll Speed", getRandomFloat(0.85, 1.35), .6)
    end

    if curBeat >= 160 and curBeat < 352 then
        triggerEvent("Add Camera Zoom", .015, .03)
    end

    if getProperty("iconP3.visible") then scaleObject("iconP3", 1.2, 1.2, true) end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'cams' then setProperty("cameraSpeed", 1.15, false) end
    if tag == 's' then triggerEvent("Camera Follow Pos", 790, 580) end
end

function lerp(a, b, c)
    return a + c * (b - a);
end

function bound(Value, Min, Max)
    local lowerBound = ((Min ~= nil and Value < Min)) and Min or Value;
	return ((Max ~= nil and lowerBound > Max)) and Max or lowerBound;
end