local lockcam = false
function onCreatePost()
	--luaDebugMode = true;
	addCharacterToList('monsteranim', 'dad')
    addCharacterToList('shield-steven', 'dad')
end

function onCreate()

    makeLuaSprite('shadowfocus', 'vignette', 0, 0)
    setObjectCamera('shadowfocus', 'other')
    setProperty('shadowfocus.visible', true)
    addLuaSprite('shadowfocus', true)
    setProperty('shadowfocus.alpha', 0.8)

    makeLuaSprite('nothing2', 'blackBox', -800,-100);
	addLuaSprite('nothing2', false);
	scaleObject('nothing2', 12.0, 12.0);

    makeLuaSprite('nothing', 'blackBox', 00, 00);
    setObjectCamera('nothing', 'camgame')
	addLuaSprite('nothing', true);
	scaleObject('nothing', 20.0, 20.0);
	screenCenter('nothing', 'xy')

end

function onStepHit()
	if curStep == 1 then
        doTweenZoom('byebye', 'camGame', 1.7, 11,'quadIn')
        doTweenAlpha('gonetween', 'nothing', 0.5, 20, 'linear');
        lockcam = true
    end
    if curStep == 384 then
        lockcam = true
        doTweenZoom('yoyoyo', 'camGame', 0.7, 43,'quadIn')
        doTweenAlpha('hello', 'nothing', 0.3, 43, 'linear');
    end
    if curStep == 896 then
        lockcam = true
        doTweenZoom('hey', 'camGame', 1.3, 10,'quadIn')
        noteTweenAlpha("yes", 0, 0.0, 5, "linear")
        noteTweenAlpha("yes2", 1, 0.0, 5, "linear")
        noteTweenAlpha("yes3", 2, 0.0, 5, "linear")
        noteTweenAlpha("yes4", 3, 0.0, 5, "linear")
    end
    if curStep == 895 then
        setProperty('cameraSpeed', 0.2)
    end
    if curStep == 947 then
        setShaderFloat("Shader1", "AMT", 0.03)
        setShaderFloat("Shader1", "SPEED", 1)
    end
    if curStep == 953 then
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
    end
    if curStep == 968 then
        setShaderFloat("Shader1", "AMT", 0.03)
        setShaderFloat("Shader1", "SPEED", 1)
    end
    if curStep == 971 then
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
    end
    if curStep == 1010 then
        setShaderFloat("Shader1", "AMT", 0.03)
        setShaderFloat("Shader1", "SPEED", 1)
    end
    if curStep == 1014 then
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
    end
    if curStep == 1017 then
        setShaderFloat("Shader1", "AMT", 0.3)
        setShaderFloat("Shader1", "SPEED", 1.5)
    end
    if curStep == 1024 then
        setProperty('gf.alpha', 1)
        noteTweenAlpha("no", 0, 1, 0.1, "linear")
        noteTweenAlpha("no2", 1, 1, 0.1, "linear")
        noteTweenAlpha("no3", 2, 1, 0.1, "linear")
        noteTweenAlpha("no4", 3, 1, 0.1, "linear")
        setProperty('cameraSpeed', 1.2)
        doTweenAlpha('asddsgdsdasd', 'nothing2', 0, 0.1, 'linear');
        doTweenAlpha('asdagas', 'nothing', 0.1, 0.1, 'linear');
        doTweenAlpha('alsndsankasfgsd', 'shadowfocus', 0.2, 0.1, 'linear');
        setProperty("healthBar.visible", true)
        setProperty("healthBarBG.visible", true)
        setProperty("iconP1.visible", true)
        setProperty("iconP2.visible", true)
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
        lockcam = false
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1041 then
        setProperty('defaultCamZoom', 1.0)
    end    
    if curStep == 1057 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1073 then
        setProperty('defaultCamZoom', 1.0)
    end   
    if curStep == 1089 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1105 then
        setProperty('defaultCamZoom', 1.0)
    end    
    if curStep == 1121 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1137 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1146 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1150 then
        doTweenAlpha('yowhatsup', 'nothing', 1.0, 0.1, 'linear');
    end
    if curStep == 1152 then
        setProperty('defaultCamZoom', 0.6)
        doTweenAlpha('yowhatsup', 'nothing', 0, 0.01, 'linear');
    end
    if curStep == 1280 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1288 then
        setProperty('defaultCamZoom', 1.4)
    end
    if curStep == 1292 then
        setProperty('defaultCamZoom', 1.6)
    end
    if curStep == 1296 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1304 then
        setProperty('defaultCamZoom', 1.4)
    end
    if curStep == 1308 then
        setProperty('defaultCamZoom', 1.6)
    end
    if curStep == 1344 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1352 then
        setProperty('defaultCamZoom', 1.4)
    end
    if curStep == 1356 then
        setProperty('defaultCamZoom', 1.6)
    end
    if curStep == 1360 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1368 then
        setProperty('defaultCamZoom', 1.4)
    end
    if curStep == 1372 then
        setProperty('defaultCamZoom', 1.6)
    end
    if curStep == 1408 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1416 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1418 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1424 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1432 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1434 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1440 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1472 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1480 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1482 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1488 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1496 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1498 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1504 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1536 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 1664 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 1792 then
        setProperty('defaultCamZoom', 1.0)
    end
    if curStep == 1904 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1920 then
        setProperty('defaultCamZoom', 0.6)
    end
end

function onTweenCompleted(tag)
    if tag == 'byebye' then
        setProperty('defaultCamZoom', 1.7)
    end
    if tag == 'hey' then
        setProperty('defaultCamZoom', 0.6)
    end
end



function onStartCountdown()
    setProperty('defaultCamZoom', 2.5)
    setProperty("healthBar.visible", false)
    setProperty("healthBarBG.visible", false)
    setProperty("iconP1.visible", false)
    setProperty("iconP2.visible", false)
    setProperty('camZooming', true)
    setProperty('gf.alpha', 0)

    return Function_Continue
end

function onUpdatePost(el)
	if lockcam then
		setProperty('camZooming', false)
	end
end
