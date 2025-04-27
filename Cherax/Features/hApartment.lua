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

FeatureMgr.AddFeature(apartmentCooldown.hash, apartmentCooldown.name, apartmentCooldown.type, apartmentCooldown.desc, function(f)
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
    for i = 1, 4 do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue(0)
    end
    local preset = apartmentPresets.list[FeatureMgr.GetFeatureListIndex(apartmentPresets.hash) + 1].index
    if preset == -1 then
        return
    end
    local team = apartmentTeam.list[FeatureMgr.GetFeatureListIndex(apartmentTeam.hash) + 1].index
    for i = 1, team do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue(preset)
    end
end)
    :SetList(apartmentPresets.list.GetNames())

FeatureMgr.AddFeature(apartmentBonus.hash, apartmentBonus.name, apartmentBonus.type, apartmentBonus.desc, function(f)
    f:Toggle((eGlobal.Heist.Apartment.Heist.Type:Get() == eTable.Heist.Apartment.Heists.PacificJob) and true or false)
    apartmentBonus.func(f:IsToggled())
end)

FeatureMgr.AddFeature(apartmentDouble.hash, apartmentDouble.name, apartmentDouble.type, apartmentDouble.desc, function(f)
end)

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
