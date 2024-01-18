function onCreate()
precacheSound('slice')-- cool precache
for i = 0, getProperty('unspawnNotes.length')-1 do-- general note stuff no one gives a fuck
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet Note' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Sword');
end
end
end

function onCreatePost()--new pico assets for the attack anim only, to replace it with the actual pico
makeAnimatedLuaSprite('Pico_attack', 'characters/Corrupted-Pico', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('Pico_attack', 'attack', 'Shoot',24,false)
addLuaSprite('Pico_attack', false)

setProperty('Pico_attack.flipX', true)
setProperty('Pico_attack.visible', false)
setProperty('Pico_attack.offset.x', -6)
setProperty('Pico_attack.offset.y', 108)
end


local anim = {
 'dodgeleft', 'dodgedown', 'dodgeup', 'dodgeright'
}
function goodNoteHit(id, direction, noteType)
if noteType == 'bullet Note' then
setProperty('dad.visible', false)--hide fake pico
setProperty('Pico_attack.visible', true)--show fake pico
playAnim('Pico_attack', 'attack', true)
triggerEvent('Play Animation', anim[direction + 1], 'bf')


playSound('slice', 0.2)
runTimer('endanim', 0.55)-- timer to replace fake with real pico
triggerEvent('Screen Shake', '0.1,0.05', '0.1,0.05')
end
end


function noteMiss(id, direction, noteType)-- the same one above but now you get damage lol
if noteType == 'bullet Note' then
playAnim('Pico_attack', 'attack', true)

setProperty('Pico_attack.visible', true)
setProperty('dad.visible', false)

playSound('slice', 0.2)
runTimer('endanim', 0.55)
triggerEvent('Screen Shake', '0.1,0.05', '0.1,0.05')
setProperty('health', getProperty('health') - 0.3)
end
end

function onTimerCompleted(t)
if t == 'endanim' then
setProperty('Pico_attack.visible', false)
setProperty('dad.visible', true)
end
end