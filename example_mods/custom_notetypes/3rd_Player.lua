function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'pibby' then
setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true);

end
end
end