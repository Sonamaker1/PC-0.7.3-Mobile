function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('dad.alpha', 0)
end

function onSongStart()
doTweenAlpha('3', 'camGame', 1, 10)
end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
else
 folowcam = false
end
end

if n == 'WBG' then
if v1 == 'Won' or v1 == 'Bon' then
setProperty('laboratory.visible', false)
setProperty('pibby.visible', false)
else
 setProperty('laboratory.visible', true)
setProperty('pibby.visible', true)

end
end
end

folowcam = false
camX = 1300
camY = 600
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end

function onStepHit()
if curStep == 48 then
doTweenAlpha('1', 'camHUD', 1, 0.8)
elseif curStep == 60 then
doTweenAlpha('3', 'camGame', 1, 0.5, 'expoOut')
elseif curStep == 128 then
setProperty('dad.alpha', 1)
elseif curStep == 2464 then
setProperty('finn_attack.colorTransform.blueOffset', -255)
setProperty('finn_attack.colorTransform.greenOffset', -255)
setProperty('finn_attack.colorTransform.redOffset', -255)
end
end