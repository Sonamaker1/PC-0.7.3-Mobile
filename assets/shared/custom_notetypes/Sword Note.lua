function onCreate()
precacheSound('slice')-- cool precache
for i = 0, getProperty('unspawnNotes.length')-1 do-- general note stuff no one gives a fuck
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sword Note' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Sword');
end
end
end

function onCreatePost()--new finn assets for the attack anim only, to replace it with the actual fjnn
if dadName == 'finn' then
makeAnimatedLuaSprite('finn_attack', 'characters/Finn', getProperty('dad.x'),getProperty('dad.y'))
elseif gfName == 'finn' then
makeAnimatedLuaSprite('finn_attack', 'characters/Finn', getProperty('gf.x'),getProperty('gf.y'))
end
addAnimationByPrefix('finn_attack', 'attack', 'Finn Slash',24,false)
scaleObject('finn_attack', 0.9, 0.9, true)
addLuaSprite('finn_attack', false)

setProperty('finn_attack.visible', false)
setProperty('finn_attack.offset.x', 80)
setProperty('finn_attack.offset.y', 144)

setObjectOrder('boyfriendGroup', 2)
setObjectOrder('finn_attack', 3)
setObjectOrder('gfGroup', 4)
setObjectOrder('dadGroup', 5)
end


local anim = {
 'dodgeleft', 'dodgedown', 'dodgeup', 'dodgeright'
}
function goodNoteHit(id, direction, noteType)
if noteType == 'Sword Note' then
playAnim('finn_attack', 'attack', true)
setProperty('finn_attack.visible', true)--show fake finn
triggerEvent('Play Animation', anim[direction + 1], 'bf')
if dadName == 'finn' then--hide real finn
setProperty('dad.visible', false)
elseif gfName == 'finn' then
setProperty('gf.visible', false)
end
playSound('slice', 0.2)
runTimer('endanim', 0.48)-- timer to replace fake with real finn
triggerEvent('Screen Shake', '0.1,0.05', '0.1,0.05')
end
end


function noteMiss(id, direction, noteType)-- the same one above but now you get damage lol
if noteType == 'Sword Note' then
playAnim('finn_attack', 'attack', true)
setProperty('finn_attack.visible', true)
if dadName == 'finn' then
setProperty('dad.visible', false)
elseif gfName == 'finn' then
setProperty('gf.visible', false)
end
playSound('slice', 0.2)
runTimer('endanim', 0.48)
triggerEvent('Screen Shake', '0.1,0.05', '0.1,0.05')
setProperty('health', getProperty('health') - 0.3)
end
end

function onTimerCompleted(t)
if t == 'endanim' then
setProperty('finn_attack.visible', false)
if dadName == 'finn' then
setProperty('dad.visible', true)
elseif gfName == 'finn' then
setProperty('gf.visible', true)
end
end
end