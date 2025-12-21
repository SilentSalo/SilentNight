--#region Heist Tool

--#region Generic

FeatureMgr.AddFeature(eFeature.Heist.Generic.Cutscene)

FeatureMgr.AddFeature(eFeature.Heist.Generic.Skip)

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

FeatureMgr.AddFeature(eFeature.Heist.Agency.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Misc.Teleport.Computer):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Misc.Teleport.Mission):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Select)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Agency.Payout.Select):SetIntValue(2500000)
    eFeature.Heist.Agency.Payout.Max.func()
end)

FeatureMgr.AddFeature(eFeature.Heist.Agency.Payout.Apply, function(f)
    local payout = FeatureMgr.GetFeature(eFeature.Heist.Agency.Payout.Select):GetIntValue()
    eFeature.Heist.Agency.Payout.Apply.func(payout)
end)

--#endregion

--#region Apartment

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Preps.Complete)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Preps.Change)

FeatureMgr.AddLoop(eFeature.Heist.Apartment.Launch.Solo, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(true)
    eFeature.Heist.Apartment.Launch.Solo.func(f)
end, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(false)
    eFeature.Heist.Apartment.Launch.Solo.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Launch.Reset, function(f)
    local temp = CONFIG.logging
    CONFIG.logging = 0

    for i = 1, #soloLaunches do
        FeatureMgr.GetFeature(soloLaunches[i]):Toggle(false)
    end

    CONFIG.logging = temp
    eFeature.Heist.Apartment.Launch.Reset.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Teleport.Board):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.FleecaHack)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.PacificHack)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Play)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Misc.Unlock)

FeatureMgr.AddLoop(eFeature.Heist.Apartment.Cuts.Bonus, nil, function(f)
    eFeature.Heist.Apartment.Cuts.Bonus.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Presets, function(f)
    local ftr    = eFeature.Heist.Apartment.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    local list  = eFeature.Heist.Apartment.Cuts.Presets.list
    local index = list[f:GetListIndex() + 1].index
    SilentLogger.LogInfo(F("[Presets (Apartment)] Selected preset: %s. Don't forget to apply ツ", list:GetName(index)))

    if preset == -1 then
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(true)
        return
    else
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):SetVisible(false)
    end

    for i = 1, #apartmentPlayers.Cuts do
        FeatureMgr.GetFeature(apartmentPlayers.Cuts[i]):SetIntValue(preset)
    end
end)

for i = 1, #apartmentPlayers.Toggles do
    FeatureMgr.AddFeature(apartmentPlayers.Toggles[i]):SetBoolValue((i == 1) and true or false)
    FeatureMgr.AddFeature(apartmentPlayers.Cuts[i])
end

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #apartmentPlayers.Toggles do
        local ftr = FeatureMgr.GetFeature(apartmentPlayers.Toggles[i])
        I(cuts, (ftr:IsToggled()) and FeatureMgr.GetFeature(apartmentPlayers.Cuts[i]):GetIntValue() or 0)
    end

    eFeature.Heist.Apartment.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.File)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Load, function(f)
    local ftr  = eFeature.Heist.Apartment.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.Apartment.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.Apartment.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.Apartment.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Name)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.Apartment.Presets.Name):GetStringValue()

    if file == "" then
        SilentLogger.LogError("[Save (Apartment)] Failed to save preset. File name is empty.")
        return
    end

    local preps = {
        solo_launch         = FeatureMgr.GetFeatureBool(eFeature.Heist.Apartment.Launch.Solo),
        bonus_12mil         = FeatureMgr.GetFeatureBool(eFeature.Heist.Apartment.Cuts.Bonus),
        double_rewards_week = FeatureMgr.GetFeatureBool(eFeature.Heist.Apartment.Cuts.Double),
        presets             = FeatureMgr.GetFeatureListIndex(eFeature.Heist.Apartment.Cuts.Presets),

        player1 = {
            enabled = FeatureMgr.GetFeatureBool(apartmentPlayers.Toggles[1]),
            cut     = FeatureMgr.GetFeatureInt(apartmentPlayers.Cuts[1])
        },

        player2 = {
            enabled = FeatureMgr.GetFeatureBool(apartmentPlayers.Toggles[2]),
            cut     = FeatureMgr.GetFeatureInt(apartmentPlayers.Cuts[2])
        },

        player3 = {
            enabled = FeatureMgr.GetFeatureBool(apartmentPlayers.Toggles[3]),
            cut     = FeatureMgr.GetFeatureInt(apartmentPlayers.Cuts[3])
        },

        player4 = {
            enabled = FeatureMgr.GetFeatureBool(apartmentPlayers.Toggles[4]),
            cut     = FeatureMgr.GetFeatureInt(apartmentPlayers.Cuts[4])
        }
    }

    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Presets.Name):SetStringValue("")
    eFeature.Heist.Apartment.Presets.Save.func(file, preps)
end)

FeatureMgr.AddFeature(eFeature.Heist.Apartment.Presets.Copy)

--#endregion

--#region Auto Shop

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Contract)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Complete, function(f)
    local ftr      = eFeature.Heist.AutoShop.Preps.Contract
    local contract = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Heist.AutoShop.Preps.Complete.func(contract)
end)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Misc.Teleport.Board):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Misc.Cooldown)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Payout.Select)

FeatureMgr.AddFeature(eFeature.Heist.AutoShop.Payout.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Payout.Select):SetIntValue(2000000)
    eFeature.Heist.AutoShop.Payout.Max.func()
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

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Advanced, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Default):SetVisible((f:IsToggled()) and true or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash):SetVisible((f:IsToggled()) and true or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed):SetVisible((f:IsToggled()) and true or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke):SetVisible((f:IsToggled()) and true or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold):SetVisible((f:IsToggled()) and true or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts):SetVisible((f:IsToggled()) and true or false)
    eFeature.Heist.CayoPerico.Preps.Advanced.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Default, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash):SetIntValue(eTable.Heist.CayoPerico.Values.Cash)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed):SetIntValue(eTable.Heist.CayoPerico.Values.Weed)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke):SetIntValue(eTable.Heist.CayoPerico.Values.Coke)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold):SetIntValue(eTable.Heist.CayoPerico.Values.Gold)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts):SetIntValue(eTable.Heist.CayoPerico.Values.Arts)
    eFeature.Heist.CayoPerico.Preps.Target.Value.Default.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Complete, function(f)
    local preps = {}

    for _, ftr in ipairs(cayoPreps) do
        local feature = FeatureMgr.GetFeature(ftr)

        if feature:GetType() == eFeatureType.Combo then
            I(preps, ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index)
        elseif feature:GetType() == eFeatureType.Toggle then
            I(preps, feature:IsToggled())
        elseif feature:GetType() == eFeatureType.InputInt then
            I(preps, feature:GetIntValue())
        end
    end

    eFeature.Heist.CayoPerico.Preps.Complete.func(U(preps))
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Reset)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Preps.Reload)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Launch.Reset, function(f)
    for i = 1, #soloLaunches do
        FeatureMgr.GetFeature(soloLaunches[i]):Toggle(false)
    end
    eFeature.Heist.CayoPerico.Launch.Reset.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Teleport):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Misc.Finish)

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

FeatureMgr.AddLoop(eFeature.Heist.CayoPerico.Cuts.Crew, nil, function(f)
    eFeature.Heist.CayoPerico.Cuts.Crew.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Cuts.Presets, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Crew):SetVisible(true)

    local ftr    = eFeature.Heist.CayoPerico.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    local list  = eFeature.Heist.CayoPerico.Cuts.Presets.list
    local index = list[f:GetListIndex() + 1].index
    SilentLogger.LogInfo(F("[Presets (Cayo Perico)] Selected preset: %s. Don't forget to apply ツ", list:GetName(index)))

    if preset == -1 then return end

    for i = 1, #cayoPlayers.Cuts do
        FeatureMgr.GetFeature(cayoPlayers.Cuts[i]):SetIntValue(preset)
    end
end)

for i = 1, #cayoPlayers.Toggles do
    FeatureMgr.AddFeature(cayoPlayers.Toggles[i]):SetBoolValue((i == 1) and true or false)
    FeatureMgr.AddFeature(cayoPlayers.Cuts[i])
end

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #cayoPlayers.Toggles do
        local ftr = FeatureMgr.GetFeature(cayoPlayers.Toggles[i])
        I(cuts, (ftr:IsToggled()) and FeatureMgr.GetFeature(cayoPlayers.Cuts[i]):GetIntValue() or 0)
    end

    eFeature.Heist.CayoPerico.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.File)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Load, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.CayoPerico.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.CayoPerico.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.CayoPerico.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Name)

FeatureMgr.AddFeature(eFeature.Heist.CayoPerico.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Presets.Name):GetStringValue()

    if file == "" then
        SilentLogger.LogError("[Save (Cayo Perico)] Failed to save preset. File name is empty.")
        return
    end

    local preps = {
        difficulty       = FeatureMgr.GetFeatureListIndex(cayoPreps[1]),
        approach         = FeatureMgr.GetFeatureListIndex(cayoPreps[2]),
        loadout          = FeatureMgr.GetFeatureListIndex(cayoPreps[3]),
        primary_target   = FeatureMgr.GetFeatureListIndex(cayoPreps[4]),
        compound_target  = FeatureMgr.GetFeatureListIndex(cayoPreps[5]),
        compound_amount  = FeatureMgr.GetFeatureListIndex(cayoPreps[6]),
        arts_amount      = FeatureMgr.GetFeatureListIndex(cayoPreps[7]),
        island_target    = FeatureMgr.GetFeatureListIndex(cayoPreps[8]),
        island_amount    = FeatureMgr.GetFeatureListIndex(cayoPreps[9]),
        advanced         = FeatureMgr.GetFeatureBool(cayoPreps[10]),
        cash_value       = FeatureMgr.GetFeatureInt(cayoPreps[11]),
        weed_value       = FeatureMgr.GetFeatureInt(cayoPreps[12]),
        coke_value       = FeatureMgr.GetFeatureInt(cayoPreps[13]),
        gold_value       = FeatureMgr.GetFeatureInt(cayoPreps[14]),
        arts_value       = FeatureMgr.GetFeatureInt(cayoPreps[15]),
        womans_bag       = FeatureMgr.GetFeatureBool(eFeature.Heist.CayoPerico.Misc.Bag),
        remove_crew_cuts = FeatureMgr.GetFeatureBool(eFeature.Heist.CayoPerico.Cuts.Crew),
        presets          = FeatureMgr.GetFeatureListIndex(eFeature.Heist.CayoPerico.Cuts.Presets),

        player1 = {
            enabled = FeatureMgr.GetFeatureBool(cayoPlayers.Toggles[1]),
            cut     = FeatureMgr.GetFeatureInt(cayoPlayers.Cuts[1])
        },

        player2 = {
            enabled = FeatureMgr.GetFeatureBool(cayoPlayers.Toggles[2]),
            cut     = FeatureMgr.GetFeatureInt(cayoPlayers.Cuts[2])
        },

        player3 = {
            enabled = FeatureMgr.GetFeatureBool(cayoPlayers.Toggles[3]),
            cut     = FeatureMgr.GetFeatureInt(cayoPlayers.Cuts[3])
        },

        player4 = {
            enabled = FeatureMgr.GetFeatureBool(cayoPlayers.Toggles[4]),
            cut     = FeatureMgr.GetFeatureInt(cayoPlayers.Cuts[4])
        }
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

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Keycards):SetListIndex(2)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Preps.Guards):SetListIndex(3)

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

FeatureMgr.AddLoop(eFeature.Heist.DiamondCasino.Launch.Solo, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(true)
    eFeature.Heist.DiamondCasino.Launch.Solo.func(f)
end, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(false)
    eFeature.Heist.DiamondCasino.Launch.Solo.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Launch.Reset, function(f)
    local temp = CONFIG.logging
    CONFIG.logging = 0

    for i = 1, #soloLaunches do
        FeatureMgr.GetFeature(soloLaunches[i]):Toggle(false)
    end

    CONFIG.logging = temp
    eFeature.Heist.DiamondCasino.Launch.Reset.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Setup):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Board):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)

FeatureMgr.AddLoop(eFeature.Heist.DiamondCasino.Misc.Autograbber, nil, function(f)
    eFeature.Heist.DiamondCasino.Misc.Autograbber.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)

FeatureMgr.AddLoop(eFeature.Heist.DiamondCasino.Cuts.Crew, nil, function(f)
    eFeature.Heist.DiamondCasino.Cuts.Crew.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Cuts.Presets, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Crew):Toggle(f:GetListIndex() == 3):SetVisible(true)

    local ftr    = eFeature.Heist.DiamondCasino.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    local list  = eFeature.Heist.DiamondCasino.Cuts.Presets.list
    local index = list[f:GetListIndex() + 1].index
    SilentLogger.LogInfo(F("[Presets (Diamond Casino)] Selected preset: %s. Don't forget to apply ツ", list:GetName(index)))

    if preset == -1 then return end

    for i = 1, #diamondPlayers.Cuts do
        FeatureMgr.GetFeature(diamondPlayers.Cuts[i]):SetIntValue(preset)
    end
end)

for i = 1, #diamondPlayers.Toggles do
    FeatureMgr.AddFeature(diamondPlayers.Toggles[i]):SetBoolValue((i == 1) and true or false)
    FeatureMgr.AddFeature(diamondPlayers.Cuts[i])
end

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #diamondPlayers.Toggles do
        local ftr = FeatureMgr.GetFeature(diamondPlayers.Toggles[i])
        I(cuts, (ftr:IsToggled()) and FeatureMgr.GetFeature(diamondPlayers.Cuts[i]):GetIntValue() or 0)
    end

    eFeature.Heist.DiamondCasino.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.File)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Load, function(f)
    local ftr  = eFeature.Heist.DiamondCasino.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.DiamondCasino.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.DiamondCasino.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.DiamondCasino.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Name)

FeatureMgr.AddFeature(eFeature.Heist.DiamondCasino.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Presets.Name):GetStringValue()

    if file == "" then
        SilentLogger.LogError("[Save (Diamond Casino)] Failed to save preset. File name is empty.")
        return
    end

    local preps = {
        difficulty       = FeatureMgr.GetFeatureListIndex(diamondPreps[1]),
        approach         = FeatureMgr.GetFeatureListIndex(diamondPreps[2]),
        gunman           = FeatureMgr.GetFeatureListIndex(diamondPreps[3]),
        driver           = FeatureMgr.GetFeatureListIndex(diamondPreps[4]),
        hacker           = FeatureMgr.GetFeatureListIndex(diamondPreps[5]),
        masks            = FeatureMgr.GetFeatureListIndex(diamondPreps[6]),
        guards           = FeatureMgr.GetFeatureListIndex(diamondPreps[7]),
        keycards         = FeatureMgr.GetFeatureListIndex(diamondPreps[8]),
        target           = FeatureMgr.GetFeatureListIndex(diamondPreps[9]),
        loadout          = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Loadout),
        vehicles         = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Preps.Vehicles),
        solo_launch      = FeatureMgr.GetFeatureBool(eFeature.Heist.DiamondCasino.Launch.Solo),
        autograbber      = FeatureMgr.GetFeatureBool(eFeature.Heist.DiamondCasino.Misc.Autograbber),
        remove_crew_cuts = FeatureMgr.GetFeatureBool(eFeature.Heist.DiamondCasino.Cuts.Crew),
        presets          = FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Cuts.Presets),

        player1 = {
            enabled = FeatureMgr.GetFeatureBool(diamondPlayers.Toggles[1]),
            cut     = FeatureMgr.GetFeatureInt(diamondPlayers.Cuts[1])
        },

        player2 = {
            enabled = FeatureMgr.GetFeatureBool(diamondPlayers.Toggles[2]),
            cut     = FeatureMgr.GetFeatureInt(diamondPlayers.Cuts[2])
        },

        player3 = {
            enabled = FeatureMgr.GetFeatureBool(diamondPlayers.Toggles[3]),
            cut     = FeatureMgr.GetFeatureInt(diamondPlayers.Cuts[3])
        },

        player4 = {
            enabled = FeatureMgr.GetFeatureBool(diamondPlayers.Toggles[4]),
            cut     = FeatureMgr.GetFeatureInt(diamondPlayers.Cuts[4])
        }
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

FeatureMgr.AddLoop(eFeature.Heist.Doomsday.Launch.Solo, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(true)
    eFeature.Heist.Doomsday.Launch.Solo.func(f)
end, function(f)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Launch.Reset):SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Launch.Reset):SetVisible(false)
    eFeature.Heist.Doomsday.Launch.Solo.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Launch.Reset, function(f)
    local temp = CONFIG.logging
    CONFIG.logging = 0

    for i = 1, #soloLaunches do
        FeatureMgr.GetFeature(soloLaunches[i]):Toggle(false)
    end

    CONFIG.logging = temp
    eFeature.Heist.Doomsday.Launch.Reset.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.Teleport.Screen):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.DataHack)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Cuts.Presets, function(f)
    local ftr    = eFeature.Heist.Doomsday.Cuts.Presets
    local preset = ftr.list[f:GetListIndex() + 1].index

    local list  = eFeature.Heist.Doomsday.Cuts.Presets.list
    local index = list[f:GetListIndex() + 1].index
    SilentLogger.LogInfo(F("[Presets (Doomsday)] Selected preset: %s. Don't forget to apply ツ", list:GetName(index)))

    if preset == -1 then return end

    for i = 1, #doomsdayPlayers.Cuts do
        FeatureMgr.GetFeature(doomsdayPlayers.Cuts[i]):SetIntValue(preset)
    end
end)

for i = 1, #doomsdayPlayers.Toggles do
    FeatureMgr.AddFeature(doomsdayPlayers.Toggles[i]):SetBoolValue((i == 1) and true or false)
    FeatureMgr.AddFeature(doomsdayPlayers.Cuts[i])
end

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Cuts.Apply, function(f)
    local cuts = {}

    for i = 1, #doomsdayPlayers.Toggles do
        local ftr = FeatureMgr.GetFeature(doomsdayPlayers.Toggles[i])
        I(cuts, (ftr:IsToggled()) and FeatureMgr.GetFeature(doomsdayPlayers.Cuts[i]):GetIntValue() or 0)
    end

    eFeature.Heist.Doomsday.Cuts.Apply.func(cuts)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.File)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Load, function(f)
    local ftr  = eFeature.Heist.Doomsday.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.Doomsday.Presets.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Remove, function(f)
    local ftr  = eFeature.Heist.Doomsday.Presets.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Heist.Doomsday.Presets.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Refresh)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Name)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Save, function(f)
    local file = FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Presets.Name):GetStringValue()

    if file == "" then
        SilentLogger.LogError("[Save (Doomsday)] Failed to save preset. File name is empty.")
        return
    end

    local preps = {
        act         = FeatureMgr.GetFeatureListIndex(eFeature.Heist.Doomsday.Preps.Act),
        solo_launch = FeatureMgr.GetFeatureBool(eFeature.Heist.Doomsday.Launch.Solo),
        presets     = FeatureMgr.GetFeatureListIndex(eFeature.Heist.Doomsday.Cuts.Presets),

        player1 = {
            enabled = FeatureMgr.GetFeatureBool(doomsdayPlayers.Toggles[1]),
            cut     = FeatureMgr.GetFeatureInt(doomsdayPlayers.Cuts[1])
        },

        player2 = {
            enabled = FeatureMgr.GetFeatureBool(doomsdayPlayers.Toggles[2]),
            cut     = FeatureMgr.GetFeatureInt(doomsdayPlayers.Cuts[2])
        },

        player3 = {
            enabled = FeatureMgr.GetFeatureBool(doomsdayPlayers.Toggles[3]),
            cut     = FeatureMgr.GetFeatureInt(doomsdayPlayers.Cuts[3])
        },

        player4 = {
            enabled = FeatureMgr.GetFeatureBool(doomsdayPlayers.Toggles[4]),
            cut     = FeatureMgr.GetFeatureInt(doomsdayPlayers.Cuts[4])
        }
    }

    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Presets.Name):SetStringValue("")
    eFeature.Heist.Doomsday.Presets.Save.func(file, preps)
end)

FeatureMgr.AddFeature(eFeature.Heist.Doomsday.Presets.Copy)

--#endregion

--#region Salvage Yard

for i = 1, 3 do
    FeatureMgr.AddFeature(salvageSlotsAvailable[i])

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

FeatureMgr.AddLoop(eFeature.Heist.SalvageYard.Preps.Free.Setup, nil, function(f)
    eFeature.Heist.SalvageYard.Preps.Free.Setup.func(f)
end)

FeatureMgr.AddLoop(eFeature.Heist.SalvageYard.Preps.Free.Claim, nil, function(f)
    eFeature.Heist.SalvageYard.Preps.Free.Claim.func(f)
end)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Board):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Finish)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Sell)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Force)

FeatureMgr.AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown)

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
