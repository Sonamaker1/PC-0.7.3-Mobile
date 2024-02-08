function onCreate()
addCharacterToList('shield-steven', 'dad')
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
initLuaShader('inverter')
end

local hideall = {
    'ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds', 'pibby', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'
}
function onCreatePost()
setProperty('gf.alpha', 0)

end


function onSongStart()
doTweenAlpha('1', 'camGame',1,1.5,'sineInOut')
doTweenAlpha('2', 'camHUD',1,1.5,'sineInOut')

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
setProperty('ground.visible', false)
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
if curStep == 592 then
for i = 1,#hideall do
doTweenAlpha(hideall[i], hideall[i], 0, 1,'expoOut')
end
doTweenAlpha('2', 'camHUD',0,1,'expoOut')
invertNote = true
setSpriteShader('dad', 'inverter')
setShaderInt('dad', 'invert', 0)
folowcam = true
camX = -180
camY = 400

elseif curStep == 608 then
doTweenAlpha('2', 'camHUD',1,1,'expoOut')

elseif curStep == 672 then
folowcam = true
camX = -180
camY = 400
elseif curStep == 738 then
folowcam = true
camX = -200
camY = 100

elseif curStep == 739 then
setProperty('gf.colorTransform.greenOffset', -255)
setProperty('gf.colorTransform.redOffset', 255)
setProperty('gf.colorTransform.blueOffset', -255)
setProperty('gf.alpha', 1)
setProperty('dad.alpha', 0)
setProperty('boyfriend.alpha', 0)
removeSpriteShader('dad')
invertNote = false

elseif curStep == 864 then
for i = 1,#hideall do
setProperty(hideall[i]..'.alpha', 1)
end
setProperty('dad.alpha', 1)
setProperty('boyfriend.alpha', 1)
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
elseif curStep == 993 then
setProperty('boyfriend.alpha', 0)
elseif curStep == 994 then
folowcam = true
camX = -200
camY = 300
elseif curStep == 1088 then
setProperty('boyfriend.alpha', 1)
setProperty('camHUD.alpha', 1)
elseif curStep == 1206 then
setProperty('dad.alpha', 0)
elseif curStep == 1208 then
for i = 1,#hideall do
doTweenAlpha(hideall[i], hideall[i], 0, 0.3,'expoOut')
end

folowcam = true
camX = -200
camY = 100

doTweenAlpha('d', 'dad', 0, 0.5,'expoOut')
elseif curStep == 1344 then
doTweenAlpha('d', 'camGame', 0, 2,'sineInOut')
doTweenAlpha('df', 'camHUD', 0, 2,'sineInOut')

end
end



invertNote = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
if invertNote then
if noteType == 'glitch_note' then
setShaderInt('dad', 'invert', 1)
else
    setShaderInt('dad', 'invert', 0)
end
end
end