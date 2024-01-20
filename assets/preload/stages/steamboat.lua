dir = 'backgrounds/williebg/Wille_BG_'
function onCreate()
--hud shit
makeLuaSprite("vig",'vig',0, 0)
setObjectCamera('vig', 'other')
setProperty('vig.alpha', 0.3)
addLuaSprite("vig");


--------------non animated shit---------------
makeLuaSprite("bg1",dir..'1',0, 0)

makeLuaSprite("bg6",dir..'6',0, 0)

makeLuaSprite("bg9",dir..'9',0, 0)

----------------animated shit-----------------
makeAnimatedLuaSprite('bg2', dir..'2', 1690, 750);
addAnimationByPrefix('bg2','Idle', 'hill glitch', 24, true);

makeAnimatedLuaSprite('bg3', dir..'3', 2390, 710);
addAnimationByPrefix('bg3','Idle', 'bush_goop', 24, true);

makeAnimatedLuaSprite('bg4', dir..'4', 1365, 930);
addAnimationByPrefix('bg4','Idle', 'birds', 24, true);

makeAnimatedLuaSprite('bg5', dir..'5', -20, 205);
addAnimationByPrefix('bg5','Idle', 'bird', 24, true);

makeAnimatedLuaSprite('bg7', dir..'7', 0, 1195);
addAnimationByPrefix('bg7','Idle', 'boat glitch', 24, true);

makeAnimatedLuaSprite('bg8', dir..'8', 1635, 625);
setProperty('bg8.angle', 35)--fixing the angle
addAnimationByPrefix('bg8','Idle', 'flag', 24, true);

makeAnimatedLuaSprite('bg10', dir..'10', 2735, 1520);
addAnimationByPrefix('bg10','Idle', 'fish', 24, true);


for i = 1,10 do--scaling the objects to be a bit bigger
scaleObject('bg'..i, 1.2, 1.2)
end

addLuaSprite("bg1");
addLuaSprite('bg2')
addLuaSprite('bg3')
addLuaSprite('bg4')
addLuaSprite('bg5')
addLuaSprite("bg6");
addLuaSprite("bg7");
addLuaSprite("bg8");
addLuaSprite("bg9");
addLuaSprite("bg10");


end



function onCreatePost()
doTweenAlpha('VigTweenOut', 'vig', 0.1, 0.1)--start Vignette fade in n out stuff
doTweenY('moveUp', 'bg6', 50, 1, 'sineInOut')--start boat to move up and down
end

function onTweenCompleted(tag)
if tag == 'VigTweenOut' then
doTweenAlpha('VigTweenIn', 'vig', 0.4, getRandomFloat(0.05,0.1))
elseif tag == 'VigTweenIn' then
doTweenAlpha('VigTweenOut', 'vig', 0.1, getRandomFloat(0.05,0.1))
end

if tag == 'moveUp' then
doTweenY('moveDown', 'bg6', 0, 1, 'sineInOut')
elseif tag == 'moveDown' then
doTweenY('moveUp', 'bg6', 50, 1, 'sineInOut')
end
end

function onUpdatePost()
setProperty('bg7.y', getProperty('bg6.y') + 1200)--move boat goo glitch
setProperty('bg8.y', getProperty('bg6.y') + 625)--move flag

end

function onUpdate()
if not mustHitSection and not folowcam then--makes dad camera not delayed anymore
cameraSetTarget('dad')
end
end