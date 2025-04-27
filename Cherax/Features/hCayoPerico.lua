FeatureMgr.AddFeature(cayoDifficulty.hash, cayoDifficulty.name, cayoDifficulty.type, cayoDifficulty.desc, function(f)
end)
    :SetList(cayoDifficulty.list:GetNames())

FeatureMgr.AddFeature(cayoApproach.hash, cayoApproach.name, cayoApproach.type, cayoApproach.desc, function(f)
end)
    :SetList(cayoApproach.list:GetNames())

FeatureMgr.AddFeature(cayoLoadout.hash, cayoLoadout.name, cayoLoadout.type, cayoLoadout.desc, function(f)
end)
    :SetList(cayoLoadout.list:GetNames())

FeatureMgr.AddFeature(cayoPrimaryTarget.hash, cayoPrimaryTarget.name, cayoPrimaryTarget.type, cayoPrimaryTarget.desc, function(f)
end)
    :SetList(cayoPrimaryTarget.list:GetNames())

FeatureMgr.AddFeature(cayoCompoundTarget.hash, cayoCompoundTarget.name, cayoCompoundTarget.type, cayoCompoundTarget.desc, function(f)
    if f:GetListIndex() == 0 then
        FeatureMgr.GetFeature(cayoCompoundAmount.hash):SetListIndex(0)
    end
end)
    :SetList(cayoCompoundTarget.list:GetNames())

FeatureMgr.AddFeature(cayoCompoundAmount.hash, cayoCompoundAmount.name, cayoCompoundAmount.type, cayoCompoundAmount.desc, function(f)
    if f:GetListIndex() == 0 then
        FeatureMgr.GetFeature(cayoCompoundTarget.hash):SetListIndex(0)
    end
end)
    :SetList(cayoCompoundAmount.list:GetNames())

FeatureMgr.AddFeature(cayoArtsAmount.hash, cayoArtsAmount.name, cayoArtsAmount.type, cayoArtsAmount.desc, function(f)
end)
    :SetList(cayoArtsAmount.list:GetNames())

FeatureMgr.AddFeature(cayoIslandTarget.hash, cayoIslandTarget.name, cayoIslandTarget.type, cayoIslandTarget.desc, function(f)
    if f:GetListIndex() == 0 then
        FeatureMgr.GetFeature(cayoIslandAmount.hash):SetListIndex(0)
    end
end)
    :SetList(cayoIslandTarget.list:GetNames())

FeatureMgr.AddFeature(cayoIslandAmount.hash, cayoIslandAmount.name, cayoIslandAmount.type, cayoIslandAmount.desc, function(f)
    if f:GetListIndex() == 0 then
        FeatureMgr.GetFeature(cayoIslandTarget.hash):SetListIndex(0)
    end
end)
    :SetList(cayoIslandAmount.list:GetNames())

FeatureMgr.AddFeature(cayoComplete.hash, cayoComplete.name, cayoComplete.type, cayoComplete.desc, function(f)
    local difficulty     = cayoDifficulty.list[FeatureMgr.GetFeatureListIndex(cayoDifficulty.hash) + 1].index
    local approach       = cayoApproach.list[FeatureMgr.GetFeatureListIndex(cayoApproach.hash) + 1].index
    local loadout        = cayoLoadout.list[FeatureMgr.GetFeatureListIndex(cayoLoadout.hash) + 1].index
    local primaryTarget  = cayoPrimaryTarget.list[FeatureMgr.GetFeatureListIndex(cayoPrimaryTarget.hash) + 1].index
    local compoundTarget = cayoCompoundTarget.list[FeatureMgr.GetFeatureListIndex(cayoCompoundTarget.hash) + 1].index
    local compoundAmount = cayoCompoundAmount.list[FeatureMgr.GetFeatureListIndex(cayoCompoundAmount.hash) + 1].index
    local artsAmount     = cayoArtsAmount.list[FeatureMgr.GetFeatureListIndex(cayoArtsAmount.hash) + 1].index
    local islandTarget   = cayoIslandTarget.list[FeatureMgr.GetFeatureListIndex(cayoIslandTarget.hash) + 1].index
    local islandAmount   = cayoIslandAmount.list[FeatureMgr.GetFeatureListIndex(cayoIslandAmount.hash) + 1].index
    cayoComplete.func(difficulty, approach, loadout, primaryTarget, compoundTarget, compoundAmount, artsAmount, islandTarget, islandAmount)
end)

FeatureMgr.AddFeature(cayoReload.hash, cayoReload.name, cayoReload.type, cayoReload.desc, function(f)
    cayoReload.func()
end)

FeatureMgr.AddFeature(cayoForce.hash, cayoForce.name, cayoForce.type, cayoForce.desc, function(f)
    cayoForce.func()
end)

FeatureMgr.AddFeature(cayoFinish.hash, cayoFinish.name, cayoFinish.type, cayoFinish.desc, function(f)
    cayoFinish.func()
end)

FeatureMgr.AddFeature(cayoFingerprintHack.hash, cayoFingerprintHack.name, cayoFingerprintHack.type, cayoFingerprintHack.desc, function(f)
    cayoFingerprintHack.func()
end)

FeatureMgr.AddFeature(cayoPlasmaCutterCut.hash, cayoPlasmaCutterCut.name, cayoPlasmaCutterCut.type, cayoPlasmaCutterCut.desc, function(f)
    cayoPlasmaCutterCut.func()
end)

FeatureMgr.AddFeature(cayoDrainagePipeCut.hash, cayoDrainagePipeCut.name, cayoDrainagePipeCut.type, cayoDrainagePipeCut.desc, function(f)
    cayoDrainagePipeCut.func()
end)

FeatureMgr.AddFeature(cayoBag.hash, cayoBag.name, cayoBag.type, cayoBag.desc, function(f)
    cayoBag.func()
end)

FeatureMgr.AddFeature(cayoSoloCooldown.hash, cayoSoloCooldown.name, cayoSoloCooldown.type, cayoSoloCooldown.desc, function(f)
    cayoSoloCooldown.func()
end)

FeatureMgr.AddFeature(cayoTeamCooldown.hash, cayoTeamCooldown.name, cayoTeamCooldown.type, cayoTeamCooldown.desc, function(f)
    cayoTeamCooldown.func()
end)

FeatureMgr.AddFeature(cayoOffline.hash, cayoOffline.name, cayoOffline.type, cayoOffline.desc, function(f)
    cayoOffline.func()
end)

FeatureMgr.AddFeature(cayoOnline.hash, cayoOnline.name, cayoOnline.type, cayoOnline.desc, function(f)
    cayoOnline.func()
end)

FeatureMgr.AddFeature(cayoUnlock.hash, cayoUnlock.name, cayoUnlock.type, cayoUnlock.desc, function(f)
    cayoUnlock.func()
end)

FeatureMgr.AddFeature(cayoTeam.hash, cayoTeam.name, cayoTeam.type, cayoTeam.desc, function(f)
    FeatureMgr.GetFeature(cayoPresets.hash):SetListIndex(0)
    FeatureMgr.GetFeature(cayoCrew.hash):Toggle(false)
    for i = 1, 4 do
        FeatureMgr.GetFeature(cayoPlayers[i].hash):SetIntValue(0)
    end
end)
    :SetList(cayoTeam.list:GetNames())

FeatureMgr.AddFeature(cayoPresets.hash, cayoPresets.name, cayoPresets.type, cayoPresets.desc, function(f)
    FeatureMgr.GetFeature(cayoCrew.hash):Toggle(false)
    local team   = cayoTeam.list[FeatureMgr.GetFeatureListIndex(cayoTeam.hash) + 1].index
    local preset = cayoPresets.list[FeatureMgr.GetFeatureListIndex(cayoPresets.hash) + 1].index
    for i = 1, 4 do
        FeatureMgr.GetFeature(cayoPlayers[i].hash):SetIntValue(0)
    end
    if preset == -1 then
        return
    end
    for i = 1, team do
        FeatureMgr.GetFeature(cayoPlayers[i].hash):SetIntValue(preset)
    end
end)
    :SetList(cayoPresets.list.GetNames())

FeatureMgr.AddFeature(cayoCrew.hash, cayoCrew.name, cayoCrew.type, cayoCrew.desc, function(f)
end)

for i = 1, 4 do
    FeatureMgr.AddFeature(cayoPlayers[i].hash, cayoPlayers[i].name, cayoPlayers[i].type, cayoPlayers[i].desc, function(f)
    end)
        :SetDefaultValue(0)
        :SetLimitValues(0, 999)
        :SetStepSize(1)
        :Reset()
end

FeatureMgr.AddFeature(cayoApply.hash, cayoApply.name, cayoApply.type, cayoApply.desc, function(f)
    local cuts = {}
    for i = 1, 4 do
        table.insert(cuts, FeatureMgr.GetFeature(cayoPlayers[i].hash):GetIntValue())
    end
    cayoApply.func(cuts)
end)
