FeatureMgr.AddFeature(diamondDifficulty.hash, diamondDifficulty.name, diamondDifficulty.type, diamondDifficulty.desc, function(f)
end)
    :SetList(diamondDifficulty.list:GetNames())

FeatureMgr.AddFeature(diamondApproach.hash, diamondApproach.name, diamondApproach.type, diamondApproach.desc, function(f)
    local approach = f:GetListIndex() + 1
    local loadoutRanges = {
        [1] = { 1, 2 },
        [2] = { 3, 4 },
        [3] = { 5, 6 }
    }
    FeatureMgr.GetFeature(diamondGunman.hash):SetListIndex(0)
    FeatureMgr.GetFeature(diamondLoadout.hash):SetList(diamondLoadout.list:GetNamesRange(table.unpack(loadoutRanges[approach])))
end)
    :SetList(diamondApproach.list:GetNames())

FeatureMgr.AddFeature(diamondGunman.hash, diamondGunman.name, diamondGunman.type, diamondGunman.desc, function(f)
    local approach = FeatureMgr.GetFeatureListIndex(diamondApproach.hash) + 1
    local gunman   = diamondGunman.list[f:GetListIndex() + 1].index
    local loadoutRanges = {
        [1] = {
            [1] = { 1, 2 },
            [2] = { 3, 4 },
            [3] = { 5, 6 }
        },
        [3] = {
            [1] = { 7, 8   },
            [2] = { 9, 10  },
            [3] = { 11, 12 }
        },
        [5] = {
            [1] = { 13, 14 },
            [2] = { 15, 16 },
            [3] = { 17, 18 }
        },
        [2] = {
            [1] = { 19, 20 },
            [2] = { 21, 22 },
            [3] = { 23, 24 }
        },
        [4] = {
            [1] = { 25, 26 },
            [2] = { 27, 28 },
            [3] = { 29, 30 }
        }
    }
    FeatureMgr.GetFeature(diamondLoadout.hash):SetList(diamondLoadout.list:GetNamesRange(table.unpack(loadoutRanges[gunman][approach])))
end)
    :SetList(diamondGunman.list:GetNames())

FeatureMgr.AddFeature(diamondLoadout.hash, diamondLoadout.name, diamondLoadout.type, diamondLoadout.desc, function(f)
end)
    : SetList(diamondLoadout.list:GetNamesRange(1, 2))

FeatureMgr.AddFeature(diamondDriver.hash, diamondDriver.name, diamondDriver.type, diamondDriver.desc, function(f)
    local driver = diamondDriver.list[f:GetListIndex() + 1].index
    local vehicleRanges = {
        [1] = { 1, 4   },
        [4] = { 5, 8   },
        [2] = { 9, 12  },
        [3] = { 13, 16 },
        [5] = { 17, 20 },
    }
    FeatureMgr.GetFeature(diamondVehicles.hash):SetList(diamondVehicles.list:GetNamesRange(table.unpack(vehicleRanges[driver])))
end)
    :SetList(diamondDriver.list:GetNames())

FeatureMgr.AddFeature(diamondVehicles.hash, diamondVehicles.name, diamondVehicles.type, diamondVehicles.desc, function(f)
end)
    :SetList(diamondVehicles.list:GetNamesRange(1, 4))

FeatureMgr.AddFeature(diamondHacker.hash, diamondHacker.name, diamondHacker.type, diamondHacker.desc, function(f)
end)
    :SetList(diamondHacker.list:GetNames())

FeatureMgr.AddFeature(diamondMasks.hash, diamondMasks.name, diamondMasks.type, diamondMasks.desc, function(f)
end)
    :SetList(diamondMasks.list:GetNames())

FeatureMgr.AddFeature(diamondTarget.hash, diamondTarget.name, diamondTarget.type, diamondTarget.desc, function(f)
end)
    :SetList(diamondTarget.list:GetNames())

FeatureMgr.AddFeature(diamondComplete.hash, diamondComplete.name, diamondComplete.type, diamondComplete.desc, function(f)
    local difficulty = diamondDifficulty.list[FeatureMgr.GetFeatureListIndex(diamondDifficulty.hash) + 1].index
    local approach   = diamondApproach.list[FeatureMgr.GetFeatureListIndex(diamondApproach.hash) + 1].index
    local gunman     = diamondGunman.list[FeatureMgr.GetFeatureListIndex(diamondGunman.hash) + 1].index
    local loadout    = FeatureMgr.GetFeatureListIndex(diamondLoadout.hash)
    local driver     = diamondDriver.list[FeatureMgr.GetFeatureListIndex(diamondDriver.hash) + 1].index
    local vehicles   = FeatureMgr.GetFeatureListIndex(diamondVehicles.hash)
    local hacker     = diamondHacker.list[FeatureMgr.GetFeatureListIndex(diamondHacker.hash) + 1].index
    local masks      = diamondMasks.list[FeatureMgr.GetFeatureListIndex(diamondMasks.hash) + 1].index
    local target     = diamondTarget.list[FeatureMgr.GetFeatureListIndex(diamondTarget.hash) + 1].index
    diamondComplete.func(difficulty, approach, gunman, loadout, driver, vehicles, hacker, masks, target)
end)

FeatureMgr.AddFeature(diamondReload.hash, diamondReload.name, diamondReload.type, diamondReload.desc, function(f)
    diamondReload.func()
end)

FeatureMgr.AddFeature(diamondForce.hash, diamondForce.name, diamondForce.type, diamondForce.desc, function(f)
    diamondForce.func()
end)

FeatureMgr.AddFeature(diamondFinish.hash, diamondFinish.name, diamondFinish.type, diamondFinish.desc, function(f)
    diamondFinish.func()
end)

FeatureMgr.AddFeature(diamondFingerprintHack.hash, diamondFingerprintHack.name, diamondFingerprintHack.type, diamondFingerprintHack.desc, function(f)
    diamondFingerprintHack.func()
end)

FeatureMgr.AddFeature(diamondKeypadHack.hash, diamondKeypadHack.name, diamondKeypadHack.type, diamondKeypadHack.desc, function(f)
    diamondKeypadHack.func()
end)

FeatureMgr.AddFeature(diamondVaultDoorDrill.hash, diamondVaultDoorDrill.name, diamondVaultDoorDrill.type, diamondVaultDoorDrill.desc, function(f)
    diamondVaultDoorDrill.func()
end)

FeatureMgr.AddFeature(diamondAutograbber.hash, diamondAutograbber.name, diamondAutograbber.type, diamondAutograbber.desc, function(f)
end)

FeatureMgr.AddFeature(diamondCooldown.hash, diamondCooldown.name, diamondCooldown.type, diamondCooldown.desc, function(f)
    diamondCooldown.func()
end)

FeatureMgr.AddFeature(diamondUnlock.hash, diamondUnlock.name, diamondUnlock.type, diamondUnlock.desc, function(f)
    diamondUnlock.func()
end)

FeatureMgr.AddFeature(diamondTeam.hash, diamondTeam.name, diamondTeam.type, diamondTeam.desc, function(f)
    FeatureMgr.GetFeature(diamondPresets.hash):SetListIndex(0)
    for i = 1, 4 do
        FeatureMgr.GetFeature(diamondPlayers[i].hash):SetIntValue(0)
    end
end)
    :SetList(diamondTeam.list:GetNames())

FeatureMgr.AddFeature(diamondPresets.hash, diamondPresets.name, diamondPresets.type, diamondPresets.desc, function(f)
    local team   = diamondTeam.list[FeatureMgr.GetFeatureListIndex(diamondTeam.hash) + 1].index
    local preset = diamondPresets.list[FeatureMgr.GetFeatureListIndex(diamondPresets.hash) + 1].index
    for i = 1, 4 do
        FeatureMgr.GetFeature(diamondPlayers[i].hash):SetIntValue(0)
    end
    for i = 1, team do
        FeatureMgr.GetFeature(diamondPlayers[i].hash):SetIntValue(preset)
    end
end)
    :SetList(diamondPresets.list.GetNames())

for i = 1, 4 do
    FeatureMgr.AddFeature(diamondPlayers[i].hash, diamondPlayers[i].name, diamondPlayers[i].type, diamondPlayers[i].desc, function(f)
    end)
        :SetDefaultValue(0)
        :SetLimitValues(0, 999)
        :SetStepSize(1)
        :Reset()
end

FeatureMgr.AddFeature(diamondApply.hash, diamondApply.name, diamondApply.type, diamondApply.desc, function(f)
    local cuts = {}
    for i = 1, 4 do
        table.insert(cuts, FeatureMgr.GetFeature(diamondPlayers[i].hash):GetIntValue())
    end
    diamondApply.func(cuts)
end)
