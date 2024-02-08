function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onCreatePost()
makeLuaSprite('iconP3', 'icons/icon-jake', 0,0)

setProperty('iconP3.y', getProperty('iconP1.y') - 50)
setObjectCamera('iconP3', 'hud')
addLuaSprite('iconP3', false)

setProperty("iconP3._frame.frame.y", 0)
setProperty("iconP3._frame.frame.width", 150)
setProperty("iconP3._frame.frame.height", 150)

setObjectOrder('iconP3', getObjectOrder('iconP2') - 1)

makeLuaSprite('iconP4', 'icons/icon-pibby', 0,0)
setProperty('iconP4.flipX', true)
setProperty('iconP4.y', getProperty('iconP1.y') - 50)
setObjectCamera('iconP4', 'hud')
addLuaSprite('iconP4', false)

setProperty("iconP4._frame.frame.y", 0)
setProperty("iconP4._frame.frame.width", 150)
setProperty("iconP4._frame.frame.height", 150)

setObjectOrder('iconP4', getObjectOrder('iconP1') - 1)

makeLuaSprite('helthBar2', nil, getProperty('healthBar.x'),getProperty('healthBar.y'))
makeGraphic('helthBar2', getProperty('healthBar.width'),getProperty('healthBar.height') / 1.7, rgbToHex(getProperty('gf.healthColorArray')))
setObjectCamera('helthBar2', 'hud')
addLuaSprite('helthBar2', false)
setObjectOrder('helthBar2', getObjectOrder('iconP1') - 1)

makeLuaSprite('helthBar3', nil, getProperty('healthBar.x'),getProperty('healthBar.y'))
makeGraphic('helthBar3', getProperty('healthBar.width'),getProperty('healthBar.height') / 1.7, 'E243FF')
setObjectCamera('helthBar3', 'hud')
addLuaSprite('helthBar3', false)
setObjectOrder('helthBar3', getObjectOrder('iconP1') - 2)
end

function onUpdatePost()
setProperty("helthBar2._frame.frame.width", (getProperty('healthBar.percent')) * -6.01 + 601)
--setProperty("helthBar3._frame.frame.width", (getProperty('healthBar.percent')) * 6.01)

setProperty('iconP3.x', getProperty('iconP2.x') - 60)
setProperty('iconP3.scale.x', getProperty('iconP2.scale.x'))
setProperty('iconP3.scale.y', getProperty('iconP2.scale.y'))
setProperty('helthBar2.alpha', getProperty('healthBar.alpha'))
setProperty('iconP3.alpha', getProperty('iconP2.alpha'))
setProperty('iconP3.visible', getProperty('iconP2.visible'))


setProperty('iconP4.x', getProperty('iconP1.x') - 60)
setProperty('iconP4.scale.x', getProperty('iconP1.scale.x'))
setProperty('iconP4.scale.y', getProperty('iconP1.scale.y'))
setProperty('helthBar3.alpha', getProperty('healthBar.alpha'))
setProperty('iconP4.alpha', getProperty('iconP1.alpha'))
setProperty('iconP4.visible', getProperty('iconP1.visible'))


if getProperty('healthBar.percent') == 100 then
setProperty('helthBar2.visible', false)
else
 setProperty('helthBar2.visible', true)
end

if getProperty('healthBar.percent') >= 81 then
setProperty("iconP3._frame.frame.x", 150)
else
 setProperty("iconP3._frame.frame.x", 0)
end

if getProperty('healthBar.percent') <= 19 then
setProperty("iconP4._frame.frame.x", 150)
else
 setProperty("iconP4._frame.frame.x", 0)
end

end