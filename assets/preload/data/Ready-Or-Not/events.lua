function onCreate()
addCharacterToList('spongebob', 'dad')
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)


setProperty('boyfriend.color', getColorFromHex('000000'))
setProperty('gf.color', getColorFromHex('000000'))
setProperty('bg.color', getColorFromHex('252525'))

end

local bgs = {
 'JellyDance1', 'JellyDance2', 'JellyDance3', 'JellyDance4', 'dad','GlitchBehindChair', 'GlitchInFishEye', 'GlitchInFishMouth', 'GlitchOnDaFishTail', 'GlitchOnDaCeiling', 'GlitchOnDaChair', 'GlitchOnDaSeat', 'GlitchUnderDoor', 'GlitchOnDaMiddleWall', 'GlitchOnDaLeftWall', 'gary'
}
function onCreatePost()
makeAnimatedLuaSprite('bobfake', 'characters/shadow-sponge', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('bobfake', 'left', 'Shadow_Left', 24, false)
addAnimationByPrefix('bobfake', 'down', 'Shadow_Down', 24, false)
addAnimationByPrefix('bobfake', 'up', 'Shadow_Up', 24, false)
addAnimationByPrefix('bobfake', 'right', 'Shadow_Right', 24, false)
scaleObject('bobfake', 1.2, 1.2, true)
setProperty('bobfake.alpha', 0)
setProperty('bobfake.color', getColorFromHex('000000'))
addLuaSprite('bobfake', true)

makeAnimatedLuaSprite('ready', 'characters/im-ready', 0,0)
addAnimationByPrefix('ready', 'line', 'Symbol 2', 24, false)
setProperty('ready.alpha', 0)
addLuaSprite('ready', true)

makeAnimatedLuaSprite('bobanim1', 'characters/crustaceous-one', -20000,0)
addAnimationByPrefix('bobanim1', 'dialogue', 'Spongebob FirstPart', 24, false)
scaleObject('bobanim1', 1.5,1.5)
addLuaSprite('bobanim1', true)

makeAnimatedLuaSprite('bobanim2', 'characters/crustaceous-two', -20000,0)
addAnimationByPrefix('bobanim2', 'dialogue', 'Spongebob SecondPart', 24, false)
scaleObject('bobanim2', 1.5,1.5)
addLuaSprite('bobanim2', true)


for i = 1,#bgs do
setProperty(bgs[i]..'.alpha', 0)
end
end


function onSongStart()
doTweenAlpha('3', 'camGame', 1, 15)
end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
camX = 900
else
 folowcam = false
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

function onUpdatePost()
if luaSpriteExists('bobfake') then
if getProperty('bobfake.animation.curAnim.name') == 'left' then
setProperty('bobfake.offset.x', 70);
setProperty('bobfake.offset.y', -367);
elseif getProperty('bobfake.animation.curAnim.name') == 'down' then
setProperty('bobfake.offset.x', -4);
setProperty('bobfake.offset.y', -463);
elseif getProperty('bobfake.animation.curAnim.name') == 'up' then
setProperty('bobfake.offset.x', 60);
setProperty('bobfake.offset.y', -362);
elseif getProperty('bobfake.animation.curAnim.name') == 'right' then
setProperty('bobfake.offset.x', -96);
setProperty('bobfake.offset.y', -414);
end
end
end

function onStepHit()
if curStep == 120 or curStep == 248 then
doTweenAlpha('3', 'camGame', 0, 0.8)
elseif curStep == 127 then
setProperty('dad.alpha', 1)
setProperty('dad.color', getColorFromHex('000000'))
elseif curStep == 128 then
doTweenAlpha('3', 'camGame', 1, 0.8)
elseif curStep == 367 then
setProperty('dad.color', getColorFromHex('ffffff'))
removeLuaSprite('bobfake', true)
setProperty('gary.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('gf.alpha', 0)
setProperty('bg.alpha', 0)
folowcam = true
camX = 500
camY = 580
elseif curStep == 416 then
camY = 470
setProperty('boyfriend.color', getColorFromHex('ffffff'))
setProperty('gf.color', getColorFromHex('ffffff'))
setProperty('bg.color', getColorFromHex('ffffff'))
setProperty('gary.alpha', 1)
setProperty('boyfriend.alpha', 1)
setProperty('gf.alpha', 1)
setProperty('bg.alpha', 1)
for i = 1,#bgs do
setProperty(bgs[i]..'.alpha', 1)
end
elseif curStep == 791 then
setProperty('ready.x', getProperty('dad.x') - 300)
setProperty('ready.y', getProperty('dad.y') - 200)
elseif curStep == 792 then
folowcam = true
camX = 500
camY = 580
setProperty('camHUD.alpha', 0)
playAnim('ready', 'line', true)
setProperty('ready.alpha', 1)
setProperty('WBG.visible', true)
setProperty('WBG.colorTransform.greenOffset', -255)
setProperty('WBG.colorTransform.redOffset', -255)
setProperty('WBG.colorTransform.blueOffset', -255)
setProperty('dad.visible', false)
setProperty('boyfriend.visible', false)
elseif curStep == 800 then
folowcam = false
camY = 360
setProperty('dad.visible', true)
setProperty('camHUD.alpha', 1)
setProperty('boyfriend.visible', true)
removeLuaSprite('ready', true)
partymode = true
setProperty('WBG.alpha',0)
setProperty('Jelly Gang.visible', true)
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('gf.colorTransform.greenOffset', 0)
setProperty('gf.colorTransform.redOffset', 0)
setProperty('gf.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)
elseif curStep == 929 then
partymode = false
setProperty('Jelly Gang.visible', false)
elseif curStep == 930 then
camY = 470
setProperty('WBG.alpha', 1)

for i = 1,#bgs do
setProperty(bgs[i]..'.color', getColorFromHex('ffffff'))
end
setProperty('bg.color', getColorFromHex('ffffff'))
setProperty('boyfriend.color', getColorFromHex('ffffff'))
setProperty('gf.color', getColorFromHex('ffffff'))
elseif curStep == 1307 then
setProperty('boyfriend.visible', false)
setProperty('gf.visible', false)
setProperty('dad.visible', false)
setProperty('WBG.visible', true)
setProperty('WBG.colorTransform.greenOffset', -255)
setProperty('WBG.colorTransform.redOffset', -255)
setProperty('WBG.colorTransform.blueOffset', -255)
folowcam = true
camX = 930
camY = 600
elseif curStep == 1308 then
setProperty('bobanim1.x', getProperty('dad.x'))
setProperty('bobanim1.y', getProperty('dad.y'))
playAnim('bobanim1', 'dialogue', true)


elseif curStep == 1340 then
removeLuaSprite('bobanim1', true)
setProperty('bobanim2.x', getProperty('dad.x') - 100)
setProperty('bobanim2.y', getProperty('dad.y') - 300)
playAnim('bobanim2', 'dialogue', true)
elseif curStep == 1375 then
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('gf.colorTransform.greenOffset', 0)
setProperty('gf.colorTransform.redOffset', 0)
setProperty('gf.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)

elseif curStep == 1376 then
camX = 900
camY = 360
setProperty('dad.visible', true)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
partymode = true
setProperty('Jelly Gang.visible', true)
setProperty('WBG.alpha', 0)
removeLuaSprite('bobanim2', true)
camY = 470
setProperty('boyfriend.visible', true)
setProperty('gf.visible', true)
elseif curStep == 1514 then
partymode = false
setProperty('Jelly Gang.visible', false)
elseif curStep == 1515 then
setProperty('WBG.alpha', 1)
for i = 1,#bgs do
setProperty(bgs[i]..'.color', getColorFromHex('ffffff'))
end
setProperty('bg.color', getColorFromHex('ffffff'))
setProperty('boyfriend.color', getColorFromHex('ffffff'))
setProperty('gf.color', getColorFromHex('ffffff'))
setProperty('boyfriend.visible', false)
setProperty('gf.visible', false)
folowcam = true
camX = 500
end
end

partymode = false
local anim = {
 'left','down','up','right'
}
local colors = {
 'F794F7', '31A2FD', '31FD8C', 'F96D63'
}
function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == '3rd Player' and not isSustainNote then
playAnim('bobfake', anim[direction + 1], true)
setProperty('bobfake.alpha', 0.5)
doTweenAlpha('9sj', 'bobfake', 0, 1)
end

if partymode then
for i = 1,#bgs do
setProperty(bgs[i]..'.color', getColorFromHex(colors[direction + 1]))
end
setProperty('Jelly Gang.color', getColorFromHex(colors[direction + 1]))
setProperty('bg.color', getColorFromHex(colors[direction + 1]))
setProperty('boyfriend.color', getColorFromHex(colors[direction + 1]))
setProperty('gf.color', getColorFromHex(colors[direction + 1]))
end
end