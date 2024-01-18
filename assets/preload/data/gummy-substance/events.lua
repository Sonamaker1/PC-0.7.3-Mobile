function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('gf.alpha', 0)
end

function onCreatePost()
setProperty('gf.x', 2050)
setProperty('gf.y', 620)
makeAnimatedLuaSprite('gumfake', getProperty('dad.imageFile'), 500,250)
setObjectCamera('gumfake', 'other')
scaleObject('gumfake', 0.9, 0.9, true)
addLuaSprite('gumfake', false)

setProperty('gumfake.colorTransform.greenOffset', 255)
setProperty('gumfake.colorTransform.redOffset', 255)
setProperty('gumfake.colorTransform.blueOffset', 255)
setProperty('gumfake.alpha', 0)
end

function onUpdatePost()
if luaSpriteExists('gumfake') then
setProperty('gumfake.offset.x', getProperty('dad.offset.x'))
setProperty('gumfake.offset.y', getProperty('dad.offset.y'))
setProperty('gumfake.animation.frameName', getProperty('dad.animation.frameName'))
end
end


function onSongStart()
setProperty('camGame.alpha', 1)
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
if curStep == 64 then
doTweenAlpha('1', 'gumfake', 1, 1)
doTweenAlpha('2', 'dad', 0, 1)
setProperty('gumfake.velocity.y', -25)
elseif curStep == 120 then
doTweenAlpha('1', 'gumfake', 0, 0.7)
elseif curStep == 128 then
setProperty('gumfake.velocity.y', 0)
removeLuaSprite('gumfake', true)
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
setProperty('boyfriend.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('gf.alpha', 1)

elseif curStep == 896 then
setProperty('dad.colorTransform.redOffset', -196)
setProperty('dad.colorTransform.greenOffset', -255)
setProperty('dad.colorTransform.blueOffset', -158)

setProperty('boyfriend.colorTransform.redOffset', -196)
setProperty('boyfriend.colorTransform.greenOffset', -255)
setProperty('boyfriend.colorTransform.blueOffset', -158)

setProperty('laboratory.colorTransform.redOffset', -196)
setProperty('laboratory.colorTransform.greenOffset', -255)
setProperty('laboratory.colorTransform.blueOffset', -158)

setProperty('gf.colorTransform.redOffset', -196)
setProperty('gf.colorTransform.greenOffset', -255)
setProperty('gf.colorTransform.blueOffset', -158)

triggerEvent('cooltrail', '1')

for i = 0,7 do
noteTweenAlpha('1'..i, i, 0.3,0.01)
end

setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
elseif curStep == 1024 then


setProperty('dad.colorTransform.redOffset', -166)
setProperty('dad.colorTransform.greenOffset', -225)
setProperty('dad.colorTransform.blueOffset', -128)

setProperty('boyfriend.colorTransform.redOffset', -166)
setProperty('boyfriend.colorTransform.greenOffset', -225)
setProperty('boyfriend.colorTransform.blueOffset', -128)

setProperty('laboratory.colorTransform.redOffset', -166)
setProperty('laboratory.colorTransform.greenOffset', -225)
setProperty('laboratory.colorTransform.blueOffset', -128)

setProperty('gf.colorTransform.redOffset', -166)
setProperty('gf.colorTransform.greenOffset', -225)
setProperty('gf.colorTransform.blueOffset', -128)

for i = 0,7 do
noteTweenAlpha('1'..i, i, 0.5,0.01)
end

elseif curStep == 1136 then
if not middlescroll then
for i = 0,7 do
noteTweenAlpha('1'..i, i, 1,0.01)
end
else

    for i = 0,3 do
noteTweenAlpha('1'..i, i, 0.5,0.01)
end

for i2 = 4,7 do
noteTweenAlpha('12'..i2, i2, 1,0.01)
end
end

elseif curStep == 1138 then
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)

setProperty('laboratory.colorTransform.redOffset', 0)
setProperty('laboratory.colorTransform.greenOffset', 0)
setProperty('laboratory.colorTransform.blueOffset', 0)

setProperty('gf.colorTransform.redOffset', 0)
setProperty('gf.colorTransform.greenOffset', 0)
setProperty('gf.colorTransform.blueOffset', 0)
triggerEvent('cooltrail', '1')
elseif curStep == 1152 then
setProperty('iconP1.visible', true)
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('iconP2.visible', true)
setProperty('scoreTxt.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeTxt.visible', true)
elseif curStep == 1540 then
doTweenAlpha('1', 'camHUD', 0, 1)
end
end