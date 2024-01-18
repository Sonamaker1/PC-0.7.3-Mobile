function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('cameraSpeed', 10000)
addLuaScript('custom_events/Cinematics (UnderLap)')

end
function onCreatePost()
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
triggerEvent('Cinematics (UnderLap)', '0.2', '180')
for i = 0,7 do
setPropertyFromGroup('strumLineNotes', i, 'x', 8002)
end
end

function onSongStart()
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
doTweenAlpha('2', 'camGame', 0,1)
camX = 400
end

function onStepHit()
if curStep == 15 or curStep == 47 or curStep == 79 or curStep == 111 then
camX = 1100
elseif curStep == 16 or curStep == 48 or curStep == 80 or curStep == 112 then
setProperty('camGame.alpha', 1)
doTweenAlpha('2', 'camGame', 0,1)
elseif curStep == 31 or curStep == 63 or curStep == 95 then
camX = 400
elseif curStep == 32 or curStep == 64 or curStep == 96 then
setProperty('camGame.alpha', 1)
doTweenAlpha('2', 'camGame', 0,1)
elseif curStep == 128 then

setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)

setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)

setProperty('camHUD.alpha', 1)
setProperty('iconP1.visible', true)
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible',true)
setProperty('iconP2.visible', true)
setProperty('scoreTxt.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeTxt.visible', true)
elseif curStep == 1156 then
doTweenAlpha('1', 'camHUD', 0, 1)
end
end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
camX = 770
camY = 600
else
 folowcam = false
end
end
end



folowcam = true
camX = 400
camY = 600
function onUpdate()


if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end