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
setProperty('bg.visible', false)
setProperty('bg2.visible', false)
setProperty('bg3.visible', false)
setProperty('pibby.visible', false)
else
 setProperty('bg.visible', true)
setProperty('bg2.visible', true)
setProperty('bg3.visible', true)
setProperty('pibby.visible', true)

end
end
end

folowcam = false
camX = 1500
camY = 900
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end

function onStepHit()
if curStep == 256 then
beat = 0
setProperty('camHUD.angle',-10)
setProperty('camGame.angle',-10)
setProperty('camHUD.x',1000)
setProperty('camGame.x',1000)

setProperty('camHUD.y',-1000)
setProperty('camGame.y',-1000)

doTweenAngle('An1', 'camHUD', 0, 1.8, 'elasticOut')
doTweenAngle('An2', 'camGame', 0, 1.8, 'elasticOut')
doTweenX('Xn1', 'camGame', 0, 1.8, 'elasticOut')
doTweenX('Xn2', 'camHUD', 0, 1.8, 'elasticOut')

doTweenY('Yn1', 'camGame', 0, 1.8, 'elasticOut')
doTweenY('Yn2', 'camHUD', 0, 1.8, 'elasticOut')
end
end
beat = 0

--[[
function onBeatHit()

if beat == 1 then
if curBeat % 2 == 0 then
setProperty('camHUD.angle',3)
setProperty('camGame.angle',3)
setProperty('camHUD.x', 50)
setProperty('camGame.x', 50)
else
 setProperty('camHUD.angle',-3)
setProperty('camGame.angle',-3)
setProperty('camHUD.x',-50)
setProperty('camGame.x',-50)
end
triggerEvent('Add Camera Zoom', 0, 0.1)

doTweenAngle('An1', 'camHUD', 0, 0.5, 'expoOut')
doTweenAngle('An2', 'camGame', 0, 0.5, 'expoOut')

doTweenX('Xn1', 'camGame', 0, 0.5, 'expoOut')
doTweenX('Xn2', 'camHUD', 0, 0.5, 'expoOut')

end
end]]