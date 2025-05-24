--#region Heist Tool

--#region Generic

FeatureMgr.AddLoop(eFeature.Heist.Generic.Launch)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Cutscene)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Skip)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Finish)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Cut)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Apply, function(f)
    local cut = FeatureMgr.GetFeature(eFeature.Heist.Generic.Cut):GetIntValue()
    eFeature.Heist.Generic.Apply.func(cut)
end)

--#endregion

--#region Agency

FeatureMgr.AddFeature(eFeature.Heist.Agency.Preps.Contract)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Preps.Complete, function(f)
    local ftr      = eFeature.Heist.Agency.Preps.Contract
    local contract = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Heist.Agency.Preps.Complete.func(contract)
end)

FeatureMgr.AddLoop(eFeature.Heist.Agency.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Select)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Agency.Payout.Select):SetIntValue(3000000)
end)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Apply, function(f)
    local payout = FeatureMgr.GetFeature(eFeature.Heist.Agency.Payout.Select):GetIntValue()
    eFeature.Heist.Agency.Payout.Apply.func(payout)
end)

--#endregion

--#region Apartment

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Preps.Complete)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.FleecaHack)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.PacificHack)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Play)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Unlock)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Team, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Presets):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Receivers):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):Toggle(false)

    local bool = f:GetListIndex() ~= 0
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Receivers):SetVisible((bool) and true or false)

    for i = 1, #apartmentPlayers do
        FeatureMgr.GetFeature(apartmentPlayers[i]):SetIntValue(0)
    end
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Receivers):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Presets, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):Toggle(false)

    for i = 1, #apartmentPlayers do
        FeatureMgr.GetFeature(apartmentPlayers[i]):SetIntValue(0)
    end

    local ftr    = eFeature.Heist.Apartment.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    if preset == -1 then
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(true)
        return
    else
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(false)
    end

    local ftr  = eFeature.Heist.Apartment.Cuts.Team
    local team = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    for i = 1, team do
        FeatureMgr.GetFeature(apartmentPlayers[i]):SetIntValue(preset)
    end
end)

FeatureMgr.AddLoop(eFeature.Heist.Apartment.Cuts.Bonus, nil, function(f)
    eFeature.Heist.Apartment.Cuts.Bonus.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(false)

for i = 1, #apartmentPlayers do
    FeatureMgr.AddFeature(apartmentPlayers[i])
end

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Apply, function(f)
    local ftr  = eFeature.Heist.Apartment.Cuts.Team
    local team = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    local ftr       = eFeature.Heist.Apartment.Cuts.Receivers
    local receivers = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    local ftr    = eFeature.Heist.Apartment.Cuts.Presets
    local preset = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    local cuts = {}

    for i = 1, #apartmentPlayers do
        I(cuts, FeatureMgr.GetFeature(apartmentPlayers[i]):GetIntValue())
    end

    eFeature.Heist.Apartment.Cuts.Apply.func(team, receivers, cuts)
end)

--#endregion

--#region Auto Shop

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Contract)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Complete, function(f)
    local ftr      = eFeature.Heist.AutoShop.Preps.Contract
    local contract = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Heist.AutoShop.Preps.Complete.func(contract)
end)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Payout.Select)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Payout.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Payout.Select):SetIntValue(2000000)
end)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Payout.Apply, function(f)
    local payout = FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Payout.Select):GetIntValue()
    eFeature.Heist.AutoShop.Payout.Apply.func(payout)
end)

--#endregion

--#region Cayo Perico

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Difficulty)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Approach)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Loadout)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Complete, function(f)
    local preps = {}

    for _, ftr in ipairs(cayoPreps) do
        I(preps, ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index)
    end

    eFeature.Heist.CayoPerico.Preps.Complete.func(U(preps))
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.FingerprintHack)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.PlasmaCutterCut)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.DrainagePipeCut)

FeatureMgr.AddLoop(eFeature.Heist.CayoPerico.Misc.Bag, nil, function(f)
    eFeature.Heist.CayoPerico.Misc.Bag.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Solo)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Team)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Offline)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Online)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Unlock)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Cuts.Team, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Presets):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Crew):Toggle(false)
    for i = 1, #cayoPlayers do
        FeatureMgr.GetFeature(cayoPlayers[i]):SetIntValue(0)
    end
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Cuts.Presets)

FeatureMgr.AddLoop(eFeature.Heist.CayoPerico.Cuts.Crew, nil, function(f)
    eFeature.Heist.CayoPerico.Cuts.Crew.func(f)
end)

for i = 1, #cayoPlayers do
    FeatureMgr.AddFeature(cayoPlayers[i])
end

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #cayoPlayers do
        I(cuts, FeatureMgr.GetFeature(cayoPlayers[i]):GetIntValue())
    end

    eFeature.Heist.CayoPerico.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.File, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[f:GetListIndex() + 1].name
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Presets.Name):SetStringValue(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Load, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    if file == "" then return end

    eFeature.Heist.CayoPerico.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.CayoPerico.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Name)
    :SetStringValue(cayoFile.list[FeatureMgr.GetFeatureListIndex(cayoFile) + 1].name)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Presets.Name):GetStringValue()

    if file == "" then return end

    local preps = {
        difficulty      = FeatureMgr.GetFeatureListIndex(cayoPreps[1]),
        approach        = FeatureMgr.GetFeatureListIndex(cayoPreps[2]),
        loadout         = FeatureMgr.GetFeatureListIndex(cayoPreps[3]),
        primary_target  = FeatureMgr.GetFeatureListIndex(cayoPreps[4]),
        compound_target = FeatureMgr.GetFeatureListIndex(cayoPreps[5]),
        compound_amount = FeatureMgr.GetFeatureListIndex(cayoPreps[6]),
        arts_amount     = FeatureMgr.GetFeatureListIndex(cayoPreps[7]),
        island_target   = FeatureMgr.GetFeatureListIndex(cayoPreps[8]),
        island_amount   = FeatureMgr.GetFeatureListIndex(cayoPreps[9])
    }

    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Presets.Name):SetStringValue("")
    eFeature.Heist.CayoPerico.Presets.Save.func(file, preps)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Copy)

--#endregion

--#region Diamond Casino

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Approach, function(f)
    local approach = f:GetListIndex() + 1

    local loadoutRanges = {
        [1] = { 1, 2 },
        [2] = { 3, 4 },
        [3] = { 5, 6 }
    }

    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Gunman):SetListIndex(0)

    local ftr = eFeature.Heist.DiamondCasino.Preps.Loadout
    FeatureMgr.GetFeature(ftr):SetList(ftr.list:GetNamesRange(U(loadoutRanges[approach])))
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Gunman, function(f)
    local approach = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Approach) + 1
    local gunman   = eFeature.Heist.DiamondCasino.Preps.Gunman.list[f:GetListIndex() + 1].index

    local loadoutRanges = {
        [1] = {
            [1] = { 1, 2 },
            [2] = { 3, 4 },
            [3] = { 5, 6 }
        },

        [3] = {
            [1] = { 7,  8  },
            [2] = { 9,  10 },
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

    local ftr = eFeature.Heist.DiamondCasino.Preps.Loadout
    FeatureMgr.GetFeature(ftr):SetList(ftr.list:GetNamesRange(U(loadoutRanges[gunman][approach])))
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Loadout)
    :SetList(eFeature.Heist.DiamondCasino.Preps.Loadout.list:GetNamesRange(1, 2))

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Driver, function(f)
    local driver = eFeature.Heist.DiamondCasino.Preps.Driver.list[f:GetListIndex() + 1].index

    local vehicleRanges = {
        [1] = { 1,  4  },
        [4] = { 5,  8  },
        [2] = { 9,  12 },
        [3] = { 13, 16 },
        [5] = { 17, 20 },
    }

    local ftr = eFeature.Heist.DiamondCasino.Preps.Vehicles
    FeatureMgr.GetFeature(ftr):SetList(ftr.list:GetNamesRange(U(vehicleRanges[driver])))
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles)
    :SetList(eFeature.Heist.DiamondCasino.Preps.Vehicles.list:GetNamesRange(1, 4))

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Hacker)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Masks)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Keycards)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Guards)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Target)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Complete, function(f)
    local preps = {}

    for _, ftr in ipairs(diamondPreps) do
        I(preps, ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index)
    end

    I(preps, FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Loadout))
    I(preps, FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Vehicles))

    eFeature.Heist.DiamondCasino.Preps.Complete.func(U(preps))
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)

FeatureMgr.AddLoop(eFeature.Heist.DiamondCasino.Misc.Autograbber)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Unlock)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Setup)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Cuts.Team, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Presets):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Crew):Toggle(false)
    for i = 1, #diamondPlayers do
        FeatureMgr.GetFeature(diamondPlayers[i]):SetIntValue(0)
    end
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Cuts.Presets, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Crew):Toggle(false)

    for i = 1, #diamondPlayers do
        FeatureMgr.GetFeature(diamondPlayers[i]):SetIntValue(0)
    end

    local ftr    = eFeature.Heist.DiamondCasino.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    if preset == -1 then return end

    local ftr  = eFeature.Heist.DiamondCasino.Cuts.Team
    local team = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    for i = 1, team do
        FeatureMgr.GetFeature(diamondPlayers[i]):SetIntValue(preset)
    end
end)

FeatureMgr.AddLoop(eFeature.Heist.DiamondCasino.Cuts.Crew, nil, function(f)
    eFeature.Heist.DiamondCasino.Cuts.Crew.func(f)
end)

for i = 1, #diamondPlayers do
    FeatureMgr.AddFeature(diamondPlayers[i])
end

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #diamondPlayers do
        I(cuts, FeatureMgr.GetFeature(diamondPlayers[i]):GetIntValue())
    end

    eFeature.Heist.DiamondCasino.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.File, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[f:GetListIndex() + 1].name
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Presets.Name):SetStringValue(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Load, function(f)
    local ftr  = eFeature.Heist.DiamondCasino.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    if file == "" then return end

    eFeature.Heist.DiamondCasino.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.DiamondCasino.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.DiamondCasino.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Name)
    :SetStringValue(diamondFile.list[FeatureMgr.GetFeatureListIndex(diamondFile) + 1].name)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Presets.Name):GetStringValue()

    if file == "" then return end

    local preps = {
        difficulty = FeatureMgr.GetFeatureListIndex(diamondPreps[1]),
        approach   = FeatureMgr.GetFeatureListIndex(diamondPreps[2]),
        gunman     = FeatureMgr.GetFeatureListIndex(diamondPreps[3]),
        driver     = FeatureMgr.GetFeatureListIndex(diamondPreps[4]),
        hacker     = FeatureMgr.GetFeatureListIndex(diamondPreps[5]),
        masks      = FeatureMgr.GetFeatureListIndex(diamondPreps[6]),
        guards     = FeatureMgr.GetFeatureListIndex(diamondPreps[7]),
        keycards   = FeatureMgr.GetFeatureListIndex(diamondPreps[8]),
        target     = FeatureMgr.GetFeatureListIndex(diamondPreps[9]),
        loadout    = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Loadout),
        vehicles   = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Vehicles)
    }

    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Presets.Name):SetStringValue("")
    eFeature.Heist.DiamondCasino.Presets.Save.func(file, preps)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Copy)

--#endregion

--#region Doomsday

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Preps.Act)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Preps.Complete, function(f)
    local ftr = eFeature.Heist.Doomsday.Preps.Act
    local act = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Heist.Doomsday.Preps.Complete.func(act)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.DataHack)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Cuts.Team, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Presets):SetListIndex(0)
    for i = 1, #doomsdayPlayers do
        FeatureMgr.GetFeature(doomsdayPlayers[i]):SetIntValue(0)
    end
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Cuts.Presets, function(f)
    for i = 1, #doomsdayPlayers do
        FeatureMgr.GetFeature(doomsdayPlayers[i]):SetIntValue(0)
    end

    local ftr    = eFeature.Heist.Doomsday.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    if preset == -1 then return end

    local ftr  = eFeature.Heist.Doomsday.Cuts.Team
    local team = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    for i = 1, team do
        FeatureMgr.GetFeature(doomsdayPlayers[i]):SetIntValue(preset)
    end
end)

for i = 1, #doomsdayPlayers do
    FeatureMgr.AddFeature(doomsdayPlayers[i])
end

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #doomsdayPlayers do
        I(cuts, FeatureMgr.GetFeature(doomsdayPlayers[i]):GetIntValue())
    end

    eFeature.Heist.Doomsday.Cuts.Apply.func(cuts)
end)

--#endregion

--#region Salvage Yard

for i = 1, 3 do
    FeatureMgr.AddFeature(salvageSlotsRobbery[i])

    FeatureMgr.AddFeature(salvageSlotsVehicle[i])

    FeatureMgr.AddFeature(salvageSlotsMod[i])

    FeatureMgr.AddFeature(salvageSlotsKeep[i])

    FeatureMgr.AddFeature(salvageSlotsApply[i], function(f)
        local robbery = salvageSlotsRobbery[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsRobbery[i]) + 1].index
        local vehicle = salvageSlotsVehicle[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsVehicle[i]) + 1].index
        local mod     = salvageSlotsMod[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsMod[i]) + 1].index
        local keep    = salvageSlotsKeep[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsKeep[i]) + 1].index
        salvageSlotsApply[i].func(robbery, vehicle, mod, keep)
    end)
end

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Preps.Apply, function(f)
    local preps = {}

    for i = 1, 3 do
        local robbery = salvageSlotsRobbery[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsRobbery[i]) + 1].index
        local vehicle = salvageSlotsVehicle[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsVehicle[i]) + 1].index
        local mod     = salvageSlotsMod[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsMod[i]) + 1].index
        local keep    = salvageSlotsKeep[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsKeep[i]) + 1].index
        I(preps, robbery)
        I(preps, vehicle)
        I(preps, mod)
        I(preps, keep)
    end

    eFeature.Heist.SalvageYard.Preps.Apply.func(U(preps))
end)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Preps.Complete)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Kill)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Skip)

for i = 1, #salvageSlotsAvailable do
    FeatureMgr.AddFeature(salvageSlotsAvailable[i])
end

FeatureMgr.AddLoop(eFeature.Heist.SalvageYard.Misc.Free.Setup, nil, function(f)
    eFeature.Heist.SalvageYard.Misc.Free.Setup.func(f)
end)

FeatureMgr.AddLoop(eFeature.Heist.SalvageYard.Misc.Free.Claim, nil, function(f)
    eFeature.Heist.SalvageYard.Misc.Free.Claim.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Payout.Salvage)

for i = 1, #salvageSlotsValue do
    FeatureMgr.AddFeature(salvageSlotsValue[i])
end

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Payout.Apply, function(f)
    local salvageMultiplier = FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Salvage):GetFloatValue()
    local sellValues        = {}

    for i = 1, #salvageSlotsValue do
        I(sellValues, FeatureMgr.GetFeature(salvageSlotsValue[i]):GetIntValue())
    end

    eFeature.Heist.SalvageYard.Payout.Apply.func(salvageMultiplier, U(sellValues))
end)

--#endregion

--#endregion
