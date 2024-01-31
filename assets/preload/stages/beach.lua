local dir = 'backgrounds/Stevenbg/'--image direction support
function onCreate()
makeLuaSprite("sky",dir..'sky',-700, -500)
setScrollFactor("sky", 0.11, 0.11);
addLuaSprite("sky");


makeLuaSprite("clouds",dir..'clouds',-700, -500)
setScrollFactor("clouds", 0.11, 0.11);
addLuaSprite("clouds");


makeLuaSprite("moon",dir..'moon',-700, -500)
setScrollFactor("moon", 0.12, 0.12);
addLuaSprite("moon");


makeLuaSprite("water",dir..'water',-600, -1060)
setScrollFactor("water", 0.28, 0.28);
scaleObject("water", 1, 1.7, true);
addLuaSprite("water");


makeAnimatedLuaSprite("clusterhand",dir..'clusterhand',-730, -265)
addAnimationByPrefix('clusterhand','idle', 'za hando glitch', 24);
setScrollFactor("clusterhand", 0.3, 0.3);
addLuaSprite('clusterhand')


makeLuaSprite("ground",dir..'ground',-1100, -765)
setScrollFactor("ground", 0.97, 0.97);
scaleObject("ground", 1.4, 1.4, true);
addLuaSprite("ground");


makeAnimatedLuaSprite("lion", dir..'lion', 1220, 55)
addAnimationByPrefix('lion', 'idle', 'lion', 24, false);
setScrollFactor("lion", 0.28,0.28);
addLuaSprite('lion')


makeAnimatedLuaSprite("stevensword",dir..'stevensword', 390, 235)
addAnimationByPrefix('stevensword','idle', 'sword glitch', 24);
addLuaSprite('stevensword')


makeAnimatedLuaSprite("goofyAhhDarkness",dir..'stevenbigpoolleft', -1200, 320)
addAnimationByPrefix('goofyAhhDarkness','idle', 'giant pool', 24);
scaleObject("goofyAhhDarkness", 1.4, 1.4, true);
addLuaSprite('goofyAhhDarkness')

end


function onBeatHit()--lion play idle animation on beat
if curBeat %2 == 0 then
playAnim('lion', 'idle', true)
end
end