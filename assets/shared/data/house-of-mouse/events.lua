function onCreatePost()

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

for i = 1,10 do--scaling the objects to be a bit bigger
setProperty('bg'..i..'.visible', false)
end
else

    for i = 1,10 do--scaling the objects to be a bit bigger
setProperty('bg'..i..'.visible', true)
end

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

if not mustHitSection and not folowcam then--makes dad camera not delayed anymore
triggerEvent('camera_target', 'dad')
end
end



function onStepHit()
if curStep == 124 then

end
end

beat = 0
function onBeatHit()
if curBeat % 4 == 2 and beat == 1 then
triggerEvent('Add Camera Zoom', 0.1, 0.1)
end
end


function onUpdatePost()
setProperty('gf.y', getProperty('bg6.y') + 180)
if dadName == 'willie' then
setProperty('dad.y', getProperty('bg6.y') + 600)
end
end