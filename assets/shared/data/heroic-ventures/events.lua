function onCreatePost()
setProperty('dad.x', 500)
setProperty('dad.y', 350)

setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
doTweenZoom('1', 'camGame', 0.4,0.01)

setProperty('boyfriend.alpha', 0)
setProperty('gf.alpha', 0)
end

function onSongStart()
doTweenAlpha('1', 'camGame', 1, 8)
end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
camX = 1300
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
camX = 900
camY = 600
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end


function onStepHit()
if curStep == 13 then
setProperty('dad.colorTransform.redOffset', 255)
setProperty('dad.colorTransform.greenOffset', -255)
setProperty('dad.colorTransform.blueOffset', -255)
doTweenAlpha('1', 'camGame', 1, 0.5, 'expoOut')
elseif curStep == 64 then
setProperty('boyfriend.alpha', 1)
setProperty('gf.alpha', 1)
elseif curStep == 1344 then
doTweenAlpha('1', 'camGame', 0, 0.5)
end
end