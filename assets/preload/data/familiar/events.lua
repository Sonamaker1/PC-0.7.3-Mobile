function onCreate()
addCharacterToList('steven', 'dad')
addCharacterToList('steven-transform', 'dad')
initLuaShader('inverter')
setProperty("skipArrowStartTween", true)
end

local hideall = {
    'ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'
}
function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)

for i = 0,7 do
noteTweenAlpha(i,i,0,0.01)
end
end

function onSongStart()
setProperty('dad.cameraPosition[0]', -450)
end

function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
camX = 500
camY = 400
else
    folowcam = false
end
end

if n == 'WBG' then
if v1 == 'Won' or v1 == 'Bon' then
for i = 1,#hideall do
setProperty(hideall[i]..'.visible', false)
end
else
    for i = 1,#hideall do
setProperty(hideall[i]..'.visible', true)
end

end
end
end



folowcam = false
camX = 500
camY = 400
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end



function onStepHit()
if curStep == 16 then
doTweenAlpha('1', 'camGame',1,10,'sineInOut')
setProperty('camHUD.alpha', 1)
elseif curStep == 120 then
doTweenAlpha('1', 'camGame',0,0.65,'sineInOut')
doTweenAlpha('2', 'camHUD',0,0.65,'sineInOut')
elseif curStep == 128 then
doTweenAlpha('1', 'camGame',1,0.54,'expoIn')
doTweenAlpha('2', 'camHUD',1,0.54,'expoIn')

for i = 0,7 do
noteTweenAlpha('n'..i,i,1,0.01)
end

setProperty('dad.cameraPosition[0]', -340)
elseif curStep == 256 then
for i = 0,7 do
noteTweenAlpha('n'..i,i,0,1, 'expoOut')
end
elseif curStep == 280 then
setSpriteShader('dad', 'inverter')
setShaderInt('dad', 'invert', 1)
elseif curStep == 288 then
removeSpriteShader('dad')
beat = 1
for i = 0,7 do
noteTweenAlpha('n'..i,i,1,0.01)
end
elseif curStep == 536 or curStep == 672 or curStep == 1175 or curStep == 2208 then
beat = 0
elseif curStep == 544 or curStep == 928 then
beat = 1
elseif curStep == 732 then
setSpriteShader('dad', 'inverter')
setShaderInt('dad', 'invert', 1)
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)
elseif curStep == 736 then
setProperty('dad.colorTransform.greenOffset', 255)
setProperty('dad.colorTransform.redOffset',255)
setProperty('dad.colorTransform.blueOffset', 255)
removeSpriteShader('dad')
elseif curStep == 1240 then
for i = 10,#hideall do
setProperty(hideall[i]..'.visible', false)
end

for i = 0,7 do
noteTweenAlpha(i,i,0,0.01)
end
elseif curStep == 1293 then
setShaderFloat("Shader1", "AMT", 0.5)
setShaderFloat("Shader1", "SPEED", 0.5)
elseif curStep == 1296 then
setShaderFloat("Shader1", "AMT", 0)
setShaderFloat("Shader1", "SPEED", 0)
elseif curStep == 1304 then
doTweenAlpha('1', 'camGame',0,0.45,'sineInOut')
doTweenAlpha('2', 'camHUD',0,0.45,'sineInOut')
elseif curStep == 1312 then
doTweenAlpha('1', 'camGame',1,1,'sineInOut')
doTweenAlpha('2', 'camHUD',1,1,'sineInOut')
for i = 0,7 do
noteTweenAlpha('n'..i,i,1,0.01)
end

for i = 10,#hideall do
setProperty(hideall[i]..'.visible', true)
end

elseif curStep == 1436 then
doTweenAlpha('1', 'camGame',0,0.55,'sineInOut')
doTweenAlpha('2', 'camHUD',0,0.55,'sineInOut')

elseif curStep == 1446 then
for i = 1,#hideall do
setProperty(hideall[i]..'.visible', false)
end
setProperty('boyfriend.visible', false)
setProperty('gf.visible', false)


elseif curStep == 1448 then
doTweenAlpha('1', 'camGame',1,0.55,'sineInOut')
elseif curStep == 1696 then

setProperty('boyfriend.visible', true)
setProperty('gf.visible', true)
setProperty('camHUD.alpha', 1)
beat = 1

end
end


beat = 0
function onBeatHit()
if curBeat %2 == 1 and beat == 1 then
triggerEvent('Add Camera Zoom', 0.1,0.05)
end
end