function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
folowcam = true
camX = 300
camY = 460
end

function onStepHit()
if curStep == 34 or curStep == 68 or curStep == 102 or curStep == 136 or curStep == 158 then
doTweenAlpha('1', 'camGame', 0, 0.7)
elseif curStep == 8 or curStep == 42 or curStep == 76 or curStep == 110 or curStep == 146 then
doTweenAlpha('1', 'camGame', 0.5, 0.7)
elseif curStep == 170 then
camX = 700
camY = 500
setProperty('boyfriend.alpha', 1)
elseif curStep == 176 then
doTweenAlpha('1', 'camGame', 1, 0.7)
elseif curStep == 784 then
setProperty('halloweenBG.visible', false)
setProperty('halloweenWhite.visible', false)
camX = 1200
camY = 500
elseif curStep == 816 then
setProperty('halloweenBG.visible', true)
setProperty('halloweenWhite.visible', true)
camX = 750
camY = 500
elseif curStep == 2116 then
doTweenAlpha('1', 'camHUD', 0, 0.5)
end
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
setProperty('halloweenBG.visible', false)
setProperty('halloweenWhite.visible', false)
else
 setProperty('halloweenBG.visible', true)
setProperty('halloweenWhite.visible', true)
end
end
end


folowcam = false
camX = 750
camY = 500
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end