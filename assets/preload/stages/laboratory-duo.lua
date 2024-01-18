function onCreate()
makeLuaSprite("laboratory","backgrounds/finnbg/laboratory",-170,-300)
scaleObject('laboratory', 1.2, 1.2, true)
addLuaSprite("laboratory",false)

makeAnimatedLuaSprite('pibby', 'characters/pibby', 2050,620)
addAnimationByPrefix('pibby', 'idle', 'Pibby idle',24,false)
addLuaSprite('pibby', false)
end


function onBeatHit()
if curBeat %2 == 0 then
playAnim('pibby', 'idle', true)
end
end