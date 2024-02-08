function onEvent(n,v1,v2)
if n == 'Black effect' then
makeLuaSprite('flashbla', '', 0, 0);
makeGraphic('flashbla',screenWidth,screenHeight,'ffffff')
addLuaSprite('flashbla', true);
setBlendMode('flashbla', 'SUBTRACT')
setObjectCamera ('flashbla', 'other')
setProperty('flashbla.alpha',1)
doTweenAlpha('flTdw','flashbla',0,v1)
end
end