scale = 1.2
function onCreate()
makeLuaSprite('bg', 'backgrounds/Mordecaibg/park',0,0)
scaleObject('bg', scale, scale, true)
addLuaSprite('bg')

makeAnimatedLuaSprite('bg2', 'backgrounds/Mordecaibg/GlitchCart',780,735)
addAnimationByPrefix('bg2', 'idle', 'GlitchOnCart',24,true)
scaleObject('bg2', scale, scale, true)
addLuaSprite('bg2')


makeAnimatedLuaSprite('bg3', 'backgrounds/Mordecaibg/glitchy',-45,1150)
addAnimationByPrefix('bg3', 'idle', 'puddle',24,true)
scaleObject('bg3', scale, scale, true)
addLuaSprite('bg3')


makeAnimatedLuaSprite('pibby', 'characters/pibby', 2130,840)
addAnimationByPrefix('pibby', 'idle', 'Pibby idle',24,false)
addLuaSprite('pibby', false)
end


function onBeatHit()
if curBeat %2 == 0 then
playAnim('pibby', 'idle', true)
end
end

--[[
chr = 'dad'
x = 0
y = 0
function onUpdate()
if keyPressed ('left') then
x = x - 5
debugPrint('X',x)
elseif keyPressed ('down') then
y = y + 5
debugPrint('Y',y)
elseif keyPressed ('up') then
y = y - 5
debugPrint('Y',y)
elseif keyPressed ('right') then
x = x + 5
debugPrint('X',x)
end

setProperty(chr..'.x', x)
setProperty(chr..'.y', y)
end]]