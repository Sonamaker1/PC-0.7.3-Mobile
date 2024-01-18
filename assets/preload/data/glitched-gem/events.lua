function onCreate()
addCharacterToList('POV_Steven', 'dad')
addCharacterToList('pink-steven', 'dad')
addCharacterToList('Weak_steven', 'dad')
initLuaShader('inverter')
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end

local hideall = {
 'ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds', 'gf', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'
}
function onCreatePost()
makeLuaSprite("vig",'vig',0, 0)
setObjectCamera('vig', 'other')
addLuaSprite("vig");

setProperty('dad.colorTransform.greenOffset', -105)
setProperty('dad.colorTransform.redOffset', -105)
setProperty('dad.colorTransform.blueOffset', -105)

setProperty('boyfriend.colorTransform.greenOffset', -105)
setProperty('boyfriend.colorTransform.redOffset', -105)
setProperty('boyfriend.colorTransform.blueOffset', -105)

setProperty('boyfriend.alpha', 0)
setProperty('boyfriend.x', getProperty('dad.x') + 200)
setProperty('boyfriend.y', getProperty('dad.y'))

for i = 1,#hideall do
setProperty(hideall[i]..'.visible', false)
end


makeAnimatedLuaSprite('POVanim', 'characters/POVsteven_Voiceline', -20000,0)
addAnimationByPrefix('POVanim', 'dialogue', 'Steven Voiceline', 24, false)
playAnim('POVanim', 'dialogue', true)
addLuaSprite('POVanim', true)
end


function onSongStart()
doTweenAlpha('1', 'camGame',1,1.5,'sineInOut')

end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
camX = 500
camY = 500
else
 folowcam = false
end
end

if n == 'WBG' then
if v1 == 'Won' or v1 == 'Bon' then
setProperty('ground.visible', false)
setProperty('sky.visible', false)
setProperty('lion.visible', false)
setProperty('goofyAhhDarkness.visible', false)
setProperty('stevensword.visible', false)
setProperty('clusterhand.visible', false)
setProperty('moon.visible', false)
setProperty('water.visible', false)
setProperty('clouds.visible', false)
else
 setProperty('ground.visible', true)
setProperty('sky.visible', true)
setProperty('lion.visible', true)
setProperty('goofyAhhDarkness.visible', true)
setProperty('stevensword.visible', true)
setProperty('clusterhand.visible', true)
setProperty('moon.visible', true)
setProperty('water.visible', true)
setProperty('clouds.visible', true)
end
end
end

folowcam = true
camX = -180
camY = 400

randoAlpha = false
function onUpdate()
if randoAlpha then
doTweenAlpha('so', 'WBG', getRandomFloat(0,1), 0.1)
end

if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end

function onStepHit()
if curStep == 48 then
doTweenAlpha('1', 'camHUD', 1, 1, 'sineInOut')

elseif curStep == 55 then
noteTweenX('2',4,412,1,'sineInOut')
noteTweenX('3',5,524,1,'sineInOut')
noteTweenX('4',6,636,1,'sineInOut')
noteTweenX('5',7,748,1,'sineInOut')

noteTweenX('6',0,412,1,'sineInOut')
noteTweenX('7',1,524,1,'sineInOut')
noteTweenX('8',2,636,1,'sineInOut')
noteTweenX('9',3,748,1,'sineInOut')

for i = 0,3 do
noteTweenAlpha('e'..i,i,0.5,1,'sineInOut')

end

elseif curStep == 64 or curStep == 192 then
doTweenAlpha('1', 'boyfriend', 1, 1, 'sineInOut')
doTweenAlpha('2', 'dad', 0, 1, 'sineInOut')
elseif curStep == 128 then
doTweenAlpha('1', 'boyfriend', 0, 1, 'sineInOut')
doTweenAlpha('2', 'dad', 1, 1, 'sineInOut')
elseif curStep == 256 then
doTweenAlpha('1', 'camGame',0,1.5,'sineInOut')
doTweenAlpha('2', 'camHUD',0,1.5,'sineInOut')
elseif curStep == 270 then
doTweenAlpha('1', 'dad',1,0.01)
doTweenAlpha('2', 'boyfriend',0,0.01)
setProperty('boyfriend.x', defaultBoyfriendX + 100)
setProperty('boyfriend.y', defaultBoyfriendY + 350)
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)
setProperty('vig.visible', false)
setProperty('WBG.color', getColorFromHex('000000'))
elseif curStep == 280 then
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)
doTweenAlpha('1', 'camGame',1,0.5,'sineInOut')
elseif curStep == 336 then
setProperty('WBG.visible', true)
setProperty('WBG.color', getColorFromHex('ff5bf3'))
setBlendMode('WBG', 'add')
randoAlpha = true

elseif curStep == 352 then
for i = 1,#hideall do
setProperty(hideall[i]..'.visible', true)
end

doTweenAlpha('1', 'dad',1,0.01)
doTweenAlpha('2', 'boyfriend',1,0.01)
doTweenAlpha('3', 'camHUD',1,0.01)

setProperty('WBG.visible', false)
setProperty('WBG.color', getColorFromHex('ffffff'))
randoAlpha = false

setProperty('WBG.color', getColorFromHex('ffffff'))
setBlendMode('WBG', 'normal')

beat = 1

elseif curStep == 362 then
setProperty('WBG.alpha', 1)
noteTweenX('2',4,defaultPlayerStrumX0,1,'backOut')
noteTweenX('3',5,defaultPlayerStrumX1,1,'backOut')
noteTweenX('4',6,defaultPlayerStrumX2,1,'backOut')
noteTweenX('5',7,defaultPlayerStrumX3,1,'backOut')

noteTweenX('6',0,defaultOpponentStrumX0,1,'backOut')
noteTweenX('7',1,defaultOpponentStrumX1,1,'backOut')
noteTweenX('8',2,defaultOpponentStrumX2,1,'backOut')
noteTweenX('9',3,defaultOpponentStrumX3,1,'backOut')

for i = 0,3 do
noteTweenAlpha('e'..i,i,1,1,'sineInOut')
end

elseif curStep == 604 then
camX = 1300
camY = 500
doTweenAlpha('a1', 'camGame', 0,1,'expoOut')
doTweenAlpha('a2', 'camHUD', 0,1,'expoOut')
elseif curStep == 608 then
doTweenAlpha('a1', 'camGame', 1,1.5,'expoOut')
doTweenAlpha('a2', 'camHUD', 1,1.5,'expoOut')

camX = -130
camY = 380

setProperty('boyfriend.visible', false)
for i = 1,#hideall do
setProperty(hideall[i]..'.visible', false)
end

setSpriteShader('dad', 'inverter')
setShaderInt('dad', 'invert', 0)

beat = 0

for i = 0,3 do
noteTweenAlpha('e'..i,i,0,0.01,'sineInOut')
end

noteTweenX('2',4,262,1,'sineInOut')
noteTweenX('3',5,374,1,'sineInOut')
noteTweenX('4',6,786,1,'sineInOut')
noteTweenX('5',7,898,1,'sineInOut')


elseif curStep == 800 then
beat = 2
elseif curStep == 848 then
beat = 0

elseif curStep == 863 or curStep == 1088 then
setProperty('camGame.alpha', 0)
elseif curStep == 868 then
doTweenAlpha('a1', 'camGame', 1,1.5,'sineInOut')
elseif curStep == 888 or curStep == 920 or curStep == 952 or curStep == 984 or curStep == 1016 or curStep == 1048 or curStep == 1080 then
doTweenAlpha('1', 'vig', 0,0.7)
elseif curStep == 896 or curStep == 928 or curStep == 960 or curStep == 992 or curStep == 1024 or curStep == 1056 then
doTweenAlpha('1', 'vig', 1,0.01)


elseif curStep == 1090 then
setProperty('vig.alpha', 0)
setProperty('POVanim.x', getProperty('dad.x') - 310)
setProperty('POVanim.y', getProperty('dad.y') - 110)
setProperty('dad.visible', false)
elseif curStep == 1092 then
doTweenAlpha('1f', 'camGame', 1, 0.5, 'sineInOut')
playAnim('POVanim', 'dialogue', true)
setSpriteShader('POVanim', 'inverter')
setShaderInt('POVanim', 'invert', 0)
elseif curStep == 1112 then
setShaderInt('POVanim', 'invert', 1)
elseif curStep == 1120 then
removeSpriteShader('POVanim')
removeLuaSprite('POVanim', true)
setProperty('boyfriend.visible', true)
for i = 1,#hideall do
setProperty(hideall[i]..'.visible', true)
end

for i = 1,9 do
setSpriteShader(hideall[i], 'inverter')
setShaderInt(hideall[i], 'invert', 0)
end

setProperty('boyfriend.x', defaultBoyfriendX + 100)
setProperty('boyfriend.y', defaultBoyfriendY + 350)
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)
beat = 1
setProperty('dad.visible', true)
setSpriteShader('dad', 'inverter')
setShaderInt('dad', 'invert', 0)

elseif curStep == 1128 then
noteTweenX('2',4,defaultPlayerStrumX0,1,'backOut')
noteTweenX('3',5,defaultPlayerStrumX1,1,'backOut')
noteTweenX('4',6,defaultPlayerStrumX2,1,'backOut')
noteTweenX('5',7,defaultPlayerStrumX3,1,'backOut')

noteTweenX('6',0,defaultOpponentStrumX0,1,'backOut')
noteTweenX('7',1,defaultOpponentStrumX1,1,'backOut')
noteTweenX('8',2,defaultOpponentStrumX2,1,'backOut')
noteTweenX('9',3,defaultOpponentStrumX3,1,'backOut')


for i = 0,3 do
noteTweenAlpha('e'..i,i,1,1,'sineInOut')
end

elseif curStep == 1488 then
for i = 0,3 do
noteTweenAlpha('e'..i,i,0,0.5,'sineInOut')
end

folowcam = true
camX = -180
camY = 400

for i = 1,#hideall do
doTweenAlpha(hideall[i], hideall[i], 0,0.5,'sineInOut')
end

elseif curStep == 1520 then

for i = 0,3 do
noteTweenAlpha('e'..i,i,1,0.01)
end

for i = 1,#hideall do
doTweenAlpha(hideall[i], hideall[i], 1,0.01)
removeSpriteShader(hideall[i])
end

beat = 0

removeSpriteShader('dad')

elseif curStep == 1536 then
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)

elseif curStep == 1792 then
setProperty('camHUD.alpha', 0)
setProperty('vig.alpha', 1)
setProperty('vig.visible', true)
elseif curStep == 1794 then
folowcam = true
camX = -180
camY = 400

setProperty('boyfriend.alpha', 0)
setProperty('boyfriend.x', getProperty('dad.x') + 200)
setProperty('boyfriend.y', getProperty('dad.y'))

setObjectCamera('gf', 'other')
setProperty('gf.x', 500)
setProperty('gf.y', 250)
setProperty('gf.alpha', 0)
setProperty('gf.visible', true)

elseif curStep == 1796 then
doTweenAlpha('1', 'camGame', 1, 1, 'sineInOut')
doTweenAlpha('19', 'camHUD', 1, 1, 'sineInOut')
noteTweenX('2',4,412,1,'sineInOut')
noteTweenX('3',5,524,1,'sineInOut')
noteTweenX('4',6,636,1,'sineInOut')
noteTweenX('5',7,748,1,'sineInOut')

noteTweenX('6',0,412,1,'sineInOut')
noteTweenX('7',1,524,1,'sineInOut')
noteTweenX('8',2,636,1,'sineInOut')
noteTweenX('9',3,748,1,'sineInOut')

for i = 0,3 do
noteTweenAlpha('e'..i,i,0.5,1,'sineInOut')
end
elseif curStep == 1936 then
doTweenAlpha('1', 'boyfriend', 1, 1, 'sineInOut')
doTweenAlpha('2', 'dad', 0, 1, 'sineInOut')
elseif curStep == 1980 then
doTweenAlpha('1', 'boyfriend', 0, 1, 'sineInOut')
doTweenAlpha('2', 'dad', 1, 1, 'sineInOut')
elseif curStep == 2016 then
doTweenAlpha('odj', 'gf', 0.5, 3,'sineInOut')
elseif curStep == 2040 then
doTweenAlpha('odj', 'gf', 0, 1.5,'sineInOut')
elseif curStep == 2080 then
doTweenAlpha('1', 'camGame', 0, 2, 'sineInOut')
doTweenAlpha('2', 'camHUD', 0, 2, 'sineInOut')

end

if dadName == 'pink-steven' then
iver = getRandomBool(50)
inv = getRandomInt(1,9)
for i = inv,inv do
if iver then
setShaderInt(hideall[i], 'invert', 1)
else
 setShaderInt(hideall[i], 'invert', 0)
end
end
end


end

inv = 0
iver = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'glitch_note' then
if dadName == 'POV_Steven' then
setShaderInt('dad', 'invert', 1)
runTimer('remove', 0.1)
end
end

if dadName == 'pink-steven' then
if noteType == 'glitch_note' then
setShaderInt('dad', 'invert', 1)
runTimer('removeall', 0.1)
for i = 1,9 do
setShaderInt(hideall[i], 'invert', 1)
end
end

if getProperty('health') > 0.3 then
setProperty('health', getProperty('health') - 0.015)
end

setShaderFloat("Shader1", "AMT", 0.02)
setShaderFloat("Shader1", "SPEED", 1)
glit = glit + 0.008
triggerEvent('AddChrom', 0.5)
end
end

function onTimerCompleted(t)
if t == 'remove' then
setShaderInt('dad', 'invert', 0)
elseif t == 'removeall' then
setShaderInt('dad', 'invert', 0)
for i = 1,9 do
setShaderInt(hideall[i], 'invert', 0)
end

end
end

beat = 0
function onBeatHit()
if curBeat %4 == 2 and beat == 1 then
triggerEvent('AddChrom', 2)
end

if curBeat %2 == 1 and beat == 2 then
triggerEvent('AddChrom', 2)
end
end