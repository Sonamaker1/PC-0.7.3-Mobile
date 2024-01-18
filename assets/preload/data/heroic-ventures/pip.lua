local Character_tag = 'pibby'

local x = 1900 --this is the characterX
local y = 520 --this is the characterY


offsetI = {
 '0', '0'
}-- idle

offsetL = {
 '118', '1'
}-- left

offsetD = {
 '10', '0'
}-- down

offsetU = {
 '10', '38'
}-- up

offsetR = {
 '-40', '20'
}-- right


function onCreatePost()
makeAnimatedLuaSprite(Character_tag, 'characters/pibby', x, y);

addAnimationByPrefix(Character_tag, 'IDLE', 'Pibby idle', 24, false);
addAnimationByPrefix(Character_tag, 'LEFT', 'Pibby left pose', 24, false);
addAnimationByPrefix(Character_tag, 'DOWN', 'Pibby down pose', 24, false);
addAnimationByPrefix(Character_tag, 'UP', 'Pibby up pose', 24, false);
addAnimationByPrefix(Character_tag, 'RIGHT', 'Pibby right pose', 24, false);

playAnim(Character_tag, 'IDLE', false)

addLuaSprite(Character_tag, false);
end

function onBeatHit()
if getProperty(Character_tag..'.animation.curAnim.name') == 'IDLE' then
if curBeat %2 == 0 then
playAnim(Character_tag, 'IDLE', false)
end
end
end

function onUpdatePost()
if getProperty(Character_tag..'.animation.curAnim.name') == 'IDLE' then
setProperty(Character_tag.. '.offset.x', offsetI[1]);
setProperty(Character_tag.. '.offset.y', offsetI[2]);

elseif getProperty(Character_tag..'.animation.curAnim.name') == 'LEFT' then
setProperty(Character_tag.. '.offset.x', offsetL[1]);
setProperty(Character_tag.. '.offset.y', offsetL[2]);
if mustHitSection then
setProperty('camFollow.x', getMidpointX('pibby') - 40)
setProperty('camFollow.y', getMidpointY('pibby') - 80)
end

elseif getProperty(Character_tag..'.animation.curAnim.name') == 'UP' then
setProperty(Character_tag.. '.offset.x', offsetU[1]);
setProperty(Character_tag.. '.offset.y', offsetU[2]);
if mustHitSection then
setProperty('camFollow.x', getMidpointX('pibby') - 40)
setProperty('camFollow.y', getMidpointY('pibby') - 80)
end

elseif getProperty(Character_tag..'.animation.curAnim.name') == 'DOWN' then
setProperty(Character_tag.. '.offset.x', offsetD[1]);
setProperty(Character_tag.. '.offset.y', offsetD[2]);
if mustHitSection then
setProperty('camFollow.x', getMidpointX('pibby') - 40)
setProperty('camFollow.y', getMidpointY('pibby') - 80)
end

elseif getProperty(Character_tag..'.animation.curAnim.name') == 'RIGHT' then
setProperty(Character_tag.. '.offset.x', offsetR[1]);
setProperty(Character_tag.. '.offset.y', offsetR[2]);
if mustHitSection then
setProperty('camFollow.x', getMidpointX('pibby') - 40)
setProperty('camFollow.y', getMidpointY('pibby') - 80)
end

end
end

local singing = {
 "LEFT", "DOWN", "UP", "RIGHT"
}


function goodNoteHit(id, direction, noteType, isSustainNote)
if noteType == '3rd Player' then
runTimer('idle back', 0.7)
playAnim(Character_tag, singing[direction + 1], true);
end
end

function onTimerCompleted(tag)
if tag == 'idle back' then
playAnim(Character_tag, 'IDLE', false);
end
end