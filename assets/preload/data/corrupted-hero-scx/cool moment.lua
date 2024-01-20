function onStepHit()
if curStep == 1024 then
setObjectCamera('boyfriend', 'hud')
setProperty('boyfriend.alpha', 0)
setProperty('boyfriend.x', 1050)
setProperty('boyfriend.y', 250)

setObjectCamera('dad', 'hud')
setProperty('dad.alpha', 0)
setProperty('dad.x', -250)
setProperty('dad.y', 150)

setProperty('dad.velocity.x', 50)
elseif curStep == 1028 then
doTweenAlpha('1', 'dad', 1, 1)
elseif curStep == 1072 then
setProperty('boyfriend.velocity.x', -50)
elseif curStep == 1076 then
doTweenAlpha('2', 'boyfriend', 1, 1)
elseif curStep == 1152 then
setProperty('dad.velocity.x', 0)
setProperty('boyfriend.velocity.x', 0)

setProperty('dad.velocity.y', -50)
setProperty('boyfriend.velocity.y', -50)

setProperty('boyfriend.x', 800)
setProperty('boyfriend.y', 550)

setProperty('dad.x', 100)
setProperty('dad.y', 550)
elseif curStep == 1280 then
setObjectCamera('boyfriend', 'game')
setObjectCamera('dad', 'game')
setProperty('dad.velocity.y', 0)
setProperty('boyfriend.velocity.y', 0)

setProperty('boyfriend.x', defaultBoyfriendX + 100)
setProperty('boyfriend.y', defaultBoyfriendY + 350)

setProperty('dad.x', defaultOpponentX - 50)
setProperty('dad.y', defaultOpponentY + 70)
end
end