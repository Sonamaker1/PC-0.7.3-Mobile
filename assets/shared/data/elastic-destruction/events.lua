function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('camGame.zoom', 0.3)
initLuaShader('inverter')
end

function onCreatePost()
setProperty('gf.x', 2050)
setProperty('gf.y', 620)


makeAnimatedLuaSprite('jakeanim1', 'characters/jake-scream1', 400,150)
addAnimationByPrefix('jakeanim1', 'dialogue', 'Jake Scream1', 24, false)
scaleObject('jakeanim1', 0.8,0.8)
setProperty('jakeanim1.visible', false)
setProperty('jakeanim1.offset.x', 30)
setProperty('jakeanim1.offset.y', -100)
addLuaSprite('jakeanim1', true)

makeAnimatedLuaSprite('jakeanim2', 'characters/jake-scream2', 400,150)
addAnimationByPrefix('jakeanim2', 'dialogue', 'Jake Scream2', 24, false)

addAnimationByIndices('jakeanim2', 'dialogue2', 'Jake Scream2', [[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50]], 24, true)

scaleObject('jakeanim2', 0.8,0.8)
setProperty('jakeanim2.visible', false)
addLuaSprite('jakeanim2', true)
end


alphatween = true
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
else
    setProperty('laboratory.visible', true)
end
end

if n == 'Set Property' then
if v2 == '1' and alphatween then

doTweenAlpha('1', 'camGame', 0,0.7)

end
end
end

folowcam = true
camX = 1300
camY = 600
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end

function onStepHit()
if curStep == 238 then
alphatween = false
elseif curStep == 240 then
setProperty('laboratory.visible', false)
setProperty('gf.visible', false)
elseif curStep == 256 then
setProperty('camHUD.alpha', 1)
setProperty('gf.visible', true)
setProperty('laboratory.visible', true)
elseif curStep == 496 then
setProperty('camHUD.alpha', 0)
setObjectCamera('UpperBar(UnderLap)', 'other')
setObjectCamera('LowerBar(UnderLap)', 'other')
elseif curStep == 512 then
setProperty('camHUD.alpha', 1)
setObjectCamera('UpperBar(UnderLap)', 'hud')
setObjectCamera('LowerBar(UnderLap)', 'hud')
elseif curStep == 1291 or curStep == 2379 then
doTweenAlpha('1', 'camGame', 0, 1, 'expoOut')
elseif curStep == 1296 or curStep == 2384 then
doTweenAlpha('1', 'camGame', 1, 1, 'expoOut')

elseif curStep == 1412 then
setProperty('gf.visible', false)
setProperty('boyfriend.visible', false)

setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)
setSpriteShader('jakeanim2', 'inverter')
setShaderInt('jakeanim2', 'invert', 0)
inver = true
elseif curStep == 1416 then
doTweenAlpha('1', 'camGame', 1, 0.5, 'expoOut')

elseif curStep == 1424 then
doTweenAlpha('1', 'camHUD', 0, 1, 'expoOut')
playAnim('jakeanim1', 'dialogue', true)
setProperty('jakeanim1.visible', true)
setProperty('dad.visible', false)
elseif curStep == 1429 then
playAnim('jakeanim2', 'dialogue', true)
setProperty('jakeanim2.visible', true)
removeLuaSprite('jakeanim1', true)
elseif curStep == 1443 then
playAnim('jakeanim2', 'dialogue2', true)
elseif curStep == 1472 then
removeSpriteShader('jakeanim2')
removeLuaSprite('jakeanim2', true)
setProperty('camHUD.alpha', 1)
setProperty('dad.visible', true)
setProperty('gf.visible', true)
setProperty('boyfriend.visible', true)
inver = false
elseif curStep == 2496 then
noteTweenAlpha('1', 0,0,0.01)
noteTweenAlpha('2', 2,0,0.01)
noteTweenAlpha('3', 3,0,0.01)
for i = 4,7 do
noteTweenAlpha(i, i,0,0.5,'sineInOut')
end

noteTweenX('move', 1,600,3.5)
noteTweenY('move2', 1,300,3.5)
doTweenZoom('move3', 'camHUD',2,3.5)
elseif curStep == 2539 then
doTweenAlpha('odh', 'camHUD', 0, 0.3,'expoOut')
end
end


inver = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'glitch_note' and inver then
setShaderInt('jakeanim2', 'invert', 1)
runTimer('remove', 0.05)
end
end

function onTimerCompleted(t)
if t == 'remove' then
setShaderInt('jakeanim2', 'invert', 0)
end
end