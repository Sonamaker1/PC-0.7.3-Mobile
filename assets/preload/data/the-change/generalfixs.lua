function onCreatePost()
makeAnimatedLuaSprite('pibby', 'characters/pibby', 1530,370)
addAnimationByPrefix('pibby', 'idle', 'Pibby idle',24,false)
addLuaSprite('pibby', false)

setProperty('gf.x', getProperty('dad.x') + 230)
setProperty('gf.y', getProperty('dad.y') - 250)
end

function onBeatHit()
if curBeat %2 == 0 then
playAnim('pibby', 'idle', true)
end
end