function onCreate()
    setProperty("skipCountdown", true)

    makeLuaSprite("bg1", 'lab/Background', -530, -400)
    setScrollFactor("bg1", 0.7, 0.8)
    scaleLuaSprite("bg1", 1.1, 1.1)
    addLuaSprite("bg1", false)
    
    makeLuaSprite("bg2", 'lab/Middleground', -500, -420)
    setScrollFactor("bg2", 0.9, 1)
    addLuaSprite("bg2", false)
    
    makeLuaSprite("bg3", 'lab/Table', -500, -420)
    setScrollFactor("bg3", 0.8, 1)
    addLuaSprite("bg3", false)

    makeAnimatedLuaSprite("bg4", 'lab/glitch_1', -650, -420)
    -- setScrollFactor("bg4", 1.1, 1.1)
    addAnimationByPrefix("bg4", "idle", "glitch 1")
    objectPlayAnimation("bg4", "idle")
    addLuaSprite("bg4")

    makeAnimatedLuaSprite("bg5", 'lab/glitch_2', -500, -420)
    setScrollFactor("bg5", 0.8, 0.8)
    addAnimationByPrefix("bg5", "idle", "glitch 2")
    objectPlayAnimation("bg5", "idle")
    addLuaSprite("bg5")
end