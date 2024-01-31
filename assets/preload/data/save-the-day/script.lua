function onCreate()
    makeLuaSprite("black", nil, 0, 0)
    makeGraphic("black", screenWidth, screenHeight, '000000')
    addLuaSprite("black", false)
    setObjectCamera("black", 'hud')
    setObjectOrder("black", 0)
    setProperty("black.alpha", 0)
end

local modchart = false

function onStepHit()
    if curStep == 1 then
        setProperty("black.alpha", 1)
        doTweenAlpha("heththeth", "black", 0, (crochet / 500) * 16, "circIn")
    end

    if curStep == 256 then
        setProperty("cameraSpeed", 3)
        modchart = true
    end

    if curStep == 512 then
        setProperty("cameraSpeed", 0.4)
        modchart = false
        setProperty("black.alpha", 0.3)
        cameraFlash('hud', 'ffffff', 1, true)
    end

    if curStep == 640 then
        doTweenAlpha("hdghdgj", "black", 1, (crochet / 500) * 14, "circIn")
    end

    if curStep == 768 then
        setProperty("black.alpha", 0)
        cameraFlash('hud', 'ffffff', 1, true)
        setProperty("cameraSpeed", 3)
    end

    if curStep == 1008 then
        doTweenAlpha("you stupid ni-", "black", 0.5, 0.25, "circIn")

        makeLuaText("subtitleTxt", '"Grahhh, stop it!"', screenWidth, 0.0, 0.0)
        setTextSize("subtitleTxt", 32)
        setTextColor("subtitleTxt", "FF6DA7")
        addLuaText("subtitleTxt")
        screenCenter("subtitleTxt", 'xy')
        setProperty("subtitleTxt.alpha", 0)
        doTweenAlpha("subtitle thing", "subtitleTxt", 1, 0.25, "circIn")

        setObjectOrder("black", getObjectOrder("subtitleTxt") - 1)

        setProperty("cameraSpeed", 0.4)
    end

    if curStep == 1024 then
        setObjectOrder("black", 0)
        doTweenAlpha("you stupid ni-", "black", 0, 0.35, "circOut")
        doTweenAlpha("subtitle thing", "subtitleTxt", 0, 0.35, "circOut")

        setProperty("cameraSpeed", 3)

        modchart = true
    end

    if curStep == 1280 then
        modchart = false
        setProperty("cameraSpeed", 1)
        doTweenAlpha("you stupid ni-", "black", 1, 0.35, "circIn")
    end
end

function allnoteTweenY(tag, value, duration, ease)
    for i = 0, 7 do
        noteTweenY(tag .. i, i, value, duration, ease)
    end
end

local ypos = {
    20,
    40,
    50,
    55,
    55,
    50,
    40,
    20
}

local ypos2 = {
    55,
    50,
    40,
    20,
    20,
    40,
    50,
    55
}

local modchartnumber = 0

function allnoteTweenY2(tag, duration, ease)
    if modchartnumber == 0 then
        for i = 0, 7 do
            noteTweenY(tag .. i, i, ypos2[i + 1] - 50, duration, ease)
        end
    elseif modchartnumber == 1 then
        for i = 0, 7 do
            noteTweenY(tag .. i, i, ypos[i + 1] + 50, duration, ease)
        end
    end
end

function onBeatHit()
    if modchart == true then
        if curBeat % 2 == 0 then
            allnoteTweenY2("wrhwrhw1", 0.001, "circIn")
        elseif curBeat % 2 == 1 then
            allnoteTweenY2("wrhwrhw1", 0.001, "circIn")
        end

        triggerEvent("Add Camera Zoom", 0.1, 0.05)
    end

    if curBeat % 2 == 0 then
        modchartnumber = 1
    elseif curBeat % 2 == 1 then
        modchartnumber = 0
    end
end

---
--- @param tag string
---
function onTweenCompleted(tag, vars)
    if tag == 'wrhwrhw17' then
        allnoteTweenY("whrar", defaultOpponentStrumY0, crochet / 1000, "circOut")
    end
end