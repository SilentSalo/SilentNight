FeatureMgr.AddFeature(apartmentComplete.hash, apartmentComplete.name, apartmentComplete.type, apartmentComplete.desc, function(f)
    apartmentComplete.func()
end)

FeatureMgr.AddFeature(apartmentReload.hash, apartmentReload.name, apartmentReload.type, apartmentReload.desc, function(f)
    apartmentReload.func()
end)

FeatureMgr.AddFeature(apartmentForce.hash, apartmentForce.name, apartmentForce.type, apartmentForce.desc, function(f)
    apartmentForce.func()
end)

FeatureMgr.AddFeature(apartmentFinish.hash, apartmentFinish.name, apartmentFinish.type, apartmentFinish.desc, function(f)
    apartmentFinish.func()
end)

FeatureMgr.AddFeature(apartmentFleecaHack.hash, apartmentFleecaHack.name, apartmentFleecaHack.type, apartmentFleecaHack.desc, function(f)
    apartmentFleecaHack.func()
end)

FeatureMgr.AddFeature(apartmentFleecaDrill.hash, apartmentFleecaDrill.name, apartmentFleecaDrill.type, apartmentFleecaDrill.desc, function(f)
    apartmentFleecaDrill.func()
end)

FeatureMgr.AddFeature(apartmentPacificHack.hash, apartmentPacificHack.name, apartmentPacificHack.type, apartmentPacificHack.desc, function(f)
    apartmentPacificHack.func()
end)

FeatureMgr.AddFeature(apartmentPlay.hash, apartmentPlay.name, apartmentPlay.type, apartmentPlay.desc, function(f)
    apartmentPlay.func()
end)

FeatureMgr.AddFeature(apartmentUnlock.hash, apartmentUnlock.name, apartmentUnlock.type, apartmentUnlock.desc, function(f)
    apartmentUnlock.func()
end)

FeatureMgr.AddFeature(apartmentTeam.hash, apartmentTeam.name, apartmentTeam.type, apartmentTeam.desc, function(f)
    FeatureMgr.GetFeature(apartmentPresets.hash):SetListIndex(0)
    for i = 1, 4 do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue(0)
    end
end)
    :SetList(apartmentTeam.list:GetNames())

FeatureMgr.AddFeature(apartmentReceivers.hash, apartmentReceivers.name, apartmentReceivers.type, apartmentReceivers.desc, function(f)
end)
    :SetList(apartmentReceivers.list:GetNames())

FeatureMgr.AddFeature(apartmentPresets.hash, apartmentPresets.name, apartmentPresets.type, apartmentPresets.desc, function(f)
    local team   = apartmentTeam.list[FeatureMgr.GetFeatureListIndex(apartmentTeam.hash) + 1].index
    local preset = apartmentPresets.list[FeatureMgr.GetFeatureListIndex(apartmentPresets.hash) + 1].index
    local heist  = eGlobal.Heist.Apartment.HeistType:Get()
    local cuts   = {
        [1328892776] = 7453,
        [964111671]  = 2142,
        [1131632450] = 1587,
        [1967927346] = 2121,
        [1182286714] = 1000
    }
    if cuts[heist] == nil then
        FeatureMgr.GetFeature(apartmentPresets.hash):SetListIndex(0)
        return
    end
    for i = 1, 4 do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue(0)
    end
    for i = 1, team do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue((preset == -1) and cuts[heist] or preset)
    end
end)
    :SetList(apartmentPresets.list.GetNames())

for i = 1, 4 do
    FeatureMgr.AddFeature(apartmentPlayers[i].hash, apartmentPlayers[i].name, apartmentPlayers[i].type, apartmentPlayers[i].desc, function(f)
    end)
        :SetDefaultValue(0)
        :SetLimitValues(0, 10000)
        :SetStepSize(1)
        :Reset()
end

FeatureMgr.AddFeature(apartmentApply.hash, apartmentApply.name, apartmentApply.type, apartmentApply.desc, function(f)
    local team      = apartmentTeam.list[FeatureMgr.GetFeatureListIndex(apartmentTeam.hash) + 1].index
    local receivers = apartmentReceivers.list[FeatureMgr.GetFeatureListIndex(apartmentReceivers.hash) + 1].index
    local cuts      = {}
    for i = 1, 4 do
        table.insert(cuts, FeatureMgr.GetFeature(apartmentPlayers[i].hash):GetIntValue())
    end
    apartmentApply.func(team, receivers, cuts)
end)
