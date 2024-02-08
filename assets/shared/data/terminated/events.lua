function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end

function onSongStart()
doTweenAlpha('1','camGame', 1, 10)

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
if curStep == 64 or curStep == 1088 then
setShaderFloat("Shader1", "AMT", 0.5)
setShaderFloat("Shader1", "SPEED", 1)
runTimer('remove', 0.1)
doTweenAlpha('1','camGame', 1, 0.01)
doTweenAlpha('2','camHUD', 1, 0.01)
end
end