
local anim = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'Bothchr' then
triggerEvent('Play Animation', anim[direction + 1], 'gf')
end
end