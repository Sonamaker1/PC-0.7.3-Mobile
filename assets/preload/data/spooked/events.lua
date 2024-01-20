function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setObjectCamera('WBG', 'hud')
setObjectCamera('dad', 'hud')
setProperty('dad.x', 0)
setProperty('dad.y', 400)
end

function onSongStart()
doTweenAlpha('1', 'camHUD', 1, 5)
setProperty('dad.velocity.x', 80)
end


function onStepHit()
if curStep == 64 then
setObjectCamera('boyfriend', 'hud')
setProperty('boyfriend.x', 1150)
setProperty('boyfriend.y', 250)
setProperty('boyfriend.velocity.x', -80)
setObjectCamera('dad', 'game')
setProperty('dad.velocity.x', 0)
setProperty('dad.x', defaultOpponentX)
setProperty('dad.y', defaultOpponentY)
switching = 2
elseif curStep == 128 then
setProperty('boyfriend.velocity.x', 0)
setObjectCamera('boyfriend', 'game')
setObjectCamera('WBG', 'game')
setProperty('boyfriend.x', defaultBoyfriendX + 100)
setProperty('boyfriend.y', defaultBoyfriendY + 350)
setProperty('camGame.alpha', 1)
setProperty('WBG.visible', false)

setProperty('halloweenBG.colorTransform.redOffset', -50)
setProperty('halloweenBG.colorTransform.greenOffset', -50)
setProperty('halloweenBG.colorTransform.blueOffset', -50)


elseif curStep == 240 then
setProperty('WBG.colorTransform.greenOffset', -255)
setProperty('WBG.colorTransform.redOffset', -255)
setProperty('WBG.colorTransform.blueOffset', -255)

setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('halloweenBG.colorTransform.redOffset', 0)
setProperty('halloweenBG.colorTransform.greenOffset', 0)
setProperty('halloweenBG.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)

setProperty('WBG.visible', true)
setProperty('boyfriend.visible', false)
folowcam = true
camX = 300
camY = 530
elseif curStep == 256 then
setProperty('boyfriend.visible', true)
camX = 700
camY = 500
elseif curStep == 960 then
setObjectCamera('dad', 'hud')
setProperty('dad.x', 0)
setProperty('dad.y', 400)
setProperty('dad.velocity.x', 80)
setProperty('boyfriend.alpha', 0)
elseif curStep == 1024 then
switching = 2
setProperty('dad.alpha', 0)
setProperty('boyfriend.alpha', 1)
setObjectCamera('boyfriend', 'hud')
setProperty('boyfriend.x', 1150)
setProperty('boyfriend.y', 250)
setProperty('boyfriend.velocity.x', -80)
setObjectCamera('dad', 'game')
setProperty('dad.velocity.x', 0)
setProperty('dad.x', defaultOpponentX)
setProperty('dad.y', defaultOpponentY)
elseif curStep == 1089 then
switching = 1
setObjectCamera('WBG', 'game')
setProperty('dad.alpha', 1)
setProperty('boyfriend.velocity.x', 0)
setObjectCamera('boyfriend', 'game')
setProperty('boyfriend.x', defaultBoyfriendX + 100)
setProperty('boyfriend.y', defaultBoyfriendY + 350)
setProperty('camGame.alpha', 1)
elseif curStep == 1200 then
switching = 2
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
if switching == 1 and not isSustainNote then
if direction == 0 or direction == 3 then
setProperty('WBG.color', getColorFromHex('FFFFFF'))
elseif direction == 1 or direction == 2 then
setProperty('WBG.color', getColorFromHex('FEA523'))
end
end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
if switching == 2 then
setProperty('WBG.color', getColorFromHex('31B0D1'))
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
if v1 == 'Won' then
switching = 1
else
 switching = 0
end
end
end


switching = false

switching = false
folowcam = false
camX = 700
camY = 500
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end