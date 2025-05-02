FeatureMgr.AddFeature(doomsdayAct.hash, doomsdayAct.name, doomsdayAct.type, doomsdayAct.desc, function(f)
end)
    :SetList(doomsdayAct.list:GetNames())

FeatureMgr.AddFeature(doomsdayComplete.hash, doomsdayComplete.name, doomsdayComplete.type, doomsdayComplete.desc, function(f)
    local act = doomsdayAct.list[FeatureMgr.GetFeatureListIndex(doomsdayAct.hash) + 1].index
    doomsdayComplete.func(act)
end)

FeatureMgr.AddFeature(doomsdayReset.hash, doomsdayReset.name, doomsdayReset.type, doomsdayReset.desc, function(f)
    local act = doomsdayAct.list[FeatureMgr.GetFeatureListIndex(doomsdayAct.hash) + 1].index
    doomsdayReset.func(act)
end)

FeatureMgr.AddFeature(doomsdayReload.hash, doomsdayReload.name, doomsdayReload.type, doomsdayReload.desc, function(f)
    doomsdayReload.func()
end)

FeatureMgr.AddFeature(doomsdayForce.hash, doomsdayForce.name, doomsdayForce.type, doomsdayForce.desc, function(f)
    doomsdayForce.func()
end)

FeatureMgr.AddFeature(doomsdayFinish.hash, doomsdayFinish.name, doomsdayFinish.type, doomsdayFinish.desc, function(f)
    doomsdayFinish.func()
end)

FeatureMgr.AddFeature(doomsdayDataHack.hash, doomsdayDataHack.name, doomsdayDataHack.type, doomsdayDataHack.desc, function(f)
    doomsdayDataHack.func()
end)

FeatureMgr.AddFeature(doomsdayDoomsdayHack.hash, doomsdayDoomsdayHack.name, doomsdayDoomsdayHack.type, doomsdayDoomsdayHack.desc, function(f)
    doomsdayDoomsdayHack.func()
end)

FeatureMgr.AddFeature(doomsdayTeam.hash, doomsdayTeam.name, doomsdayTeam.type, doomsdayTeam.desc, function(f)
    FeatureMgr.GetFeature(doomsdayPresets.hash):SetListIndex(0)
    for i = 1, #doomsdayPlayers do
        FeatureMgr.GetFeature(doomsdayPlayers[i].hash):SetIntValue(0)
    end
end)
    :SetList(doomsdayTeam.list:GetNames())

FeatureMgr.AddFeature(doomsdayPresets.hash, doomsdayPresets.name, doomsdayPresets.type, doomsdayPresets.desc, function(f)
    local team   = doomsdayTeam.list[FeatureMgr.GetFeatureListIndex(doomsdayTeam.hash) + 1].index
    local preset = doomsdayPresets.list[FeatureMgr.GetFeatureListIndex(doomsdayPresets.hash) + 1].index
    for i = 1, #doomsdayPlayers do
        FeatureMgr.GetFeature(doomsdayPlayers[i].hash):SetIntValue(0)
    end
    for i = 1, team do
        FeatureMgr.GetFeature(doomsdayPlayers[i].hash):SetIntValue(preset)
    end
end)
    :SetList(doomsdayPresets.list.GetNames())

for i = 1, #doomsdayPlayers do
    FeatureMgr.AddFeature(doomsdayPlayers[i].hash, doomsdayPlayers[i].name, doomsdayPlayers[i].type, doomsdayPlayers[i].desc, function(f)
    end)
        :SetDefaultValue(0)
        :SetLimitValues(0, 999)
        :SetStepSize(1)
        :Reset()
end

FeatureMgr.AddFeature(doomsdayApply.hash, doomsdayApply.name, doomsdayApply.type, doomsdayApply.desc, function(f)
    local cuts = {}
    for i = 1, #doomsdayPlayers do
        table.insert(cuts, FeatureMgr.GetFeature(doomsdayPlayers[i].hash):GetIntValue())
    end
    doomsdayApply.func(cuts)
end)
