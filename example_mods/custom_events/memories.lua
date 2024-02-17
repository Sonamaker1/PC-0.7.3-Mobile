function onEvent(name, value1, value2)
if name == 'memories' then
makeLuaSprite('flash', value2, 0, 0);
addLuaSprite('flash', true);
setObjectCamera('flash', 'hud')
setProperty('flash.alpha', 1)
scaleObject('flash', 0.7, 0.7)
if value2 == '7' then
scaleObject('flash', 1.3, 1.3)
end

doTweenAlpha('flTw','flash',0,value1,'linear')
end
end
