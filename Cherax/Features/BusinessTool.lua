--#region Business Tool

--#region Bunker

FeatureMgr.AddLoop(eFeature.Business.Bunker.Sale.Price, nil, function(f)
    eFeature.Business.Bunker.Sale.Price.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Sale.NoXp)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Sale.Sell, function(f)
    local bool = FeatureMgr.GetFeature(eFeature.Business.Bunker.Sale.NoXp):IsToggled()
    eFeature.Business.Bunker.Sale.Sell.func(bool)
end)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Supplies.Trigger)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Supplies.Supply)

FeatureMgr.AddLoop(eFeature.Business.Bunker.Supplies.Supplier, nil, function(f)
    eFeature.Business.Bunker.Supplies.Supplier.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Teleport.Laptop):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Open)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Stats.Refresh, function(f)
    local stats = eFeature.Business.Bunker.Stats
    FeatureMgr.GetFeature(stats.SellMade):SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Get())
    FeatureMgr.GetFeature(stats.SellUndertaken):SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Get())
    FeatureMgr.GetFeature(stats.Earnings):SetIntValue(eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Get())
end)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Stats.SellMade)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Stats.SellUndertaken)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Stats.Earnings)

for i = 1, #bunkerToggles do
    FeatureMgr.AddFeature(bunkerToggles[i])
end

FeatureMgr.AddFeature(eFeature.Business.Bunker.Stats.Apply, function(f)
    local params = {}

    for i = 1, #bunkerToggles do
        I(params, FeatureMgr.GetFeature(bunkerToggles[i]):IsToggled())
    end

    for i = 1, #bunkerStats do
        I(params, FeatureMgr.GetFeature(bunkerStats[i]):GetIntValue())
    end

    eFeature.Business.Bunker.Stats.Apply.func(U(params))
end)

--#endregion

--#region Hangar Cargo

FeatureMgr.AddLoop(eFeature.Business.Hangar.Sale.Price, nil, function(f)
    eFeature.Business.Hangar.Sale.Price.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Sale.NoXp)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Sale.Sell, function(f)
    local bool = FeatureMgr.GetFeature(eFeature.Business.Hangar.Sale.NoXp)
    eFeature.Business.Hangar.Sale.Sell.func(bool)
end)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.Supply)

FeatureMgr.AddLoop(eFeature.Business.Hangar.Supplies.Supplier, nil, function(f)
    eFeature.Business.Hangar.Supplies.Supplier.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.PocketDimension, function(f)
    eFeature.Business.Hangar.Supplies.PocketDimension.func(f)
    if SCRIPT_EDTN == eTable.Editions.Standard then return end

    if f:IsToggled() then
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Supply):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Supplier):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Supplier):Toggle(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StartStop):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomLimit):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomDelay):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomType):SetVisible(true)
    else
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Supply):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Supplier):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StartStop):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StartStop):Toggle(false)

        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomLimit):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StopAt)
            :SetVisible(false)
            :SetIntValue(eStat.MPX_HANGAR_CONTRABAND_TOTAL:Get() + 50)

        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomDelay):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Delay)
            :SetVisible(false)
            :SetFloatValue(1.0)

        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomType):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Type)
            :SetVisible(false)
            :SetListIndex(0)
    end
end)

FeatureMgr.AddLoop(eFeature.Business.Hangar.Supplies.StartStop, function(f)
    local limitToggled = not FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomLimit):IsVisible()
    local limit        = FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StopAt):GetIntValue()
    local type         = FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Type):GetListIndex()
    local delay        = FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Delay):GetFloatValue()
    eFeature.Business.Hangar.Supplies.StartStop.func(f, limitToggled, limit, type, delay)
end, function(f)
    eFeature.Business.Hangar.Supplies.StartStop.func(f, false, 0, 0, 0)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.CustomLimit, function(f)
    f:SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StopAt):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.StopAt):SetIntValue(eStat.MPX_HANGAR_CONTRABAND_TOTAL:Get() + 50)
    eFeature.Business.Hangar.Supplies.CustomLimit.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.StopAt, function(f)
    if f:GetIntValue() == 0 then
        f:SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomLimit):SetVisible(true)
    end

    eFeature.Business.Hangar.Supplies.StopAt.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.CustomType, function(f)
    f:SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Type):SetVisible(true)
    FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Type):SetListIndex(1)
    eFeature.Business.Hangar.Supplies.CustomType.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.Type, function(f)
    if f:GetListIndex() == 0 then
        f:SetVisible(false)
        f:SetListIndex(0)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomType):SetVisible(true)
    end

    eFeature.Business.Hangar.Supplies.Type.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.CustomDelay, function(f)
    f:SetVisible(false)
    FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.Delay):SetVisible(true)
    eFeature.Business.Hangar.Supplies.CustomDelay.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Supplies.Delay, function(f)
    if f:GetFloatValue() == 0.0 then
        f:SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Supplies.CustomDelay):SetVisible(true)
    end

    eFeature.Business.Hangar.Supplies.Delay.func(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Misc.Teleport.Laptop):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Misc.Open)

FeatureMgr.AddLoop(eFeature.Business.Hangar.Misc.Cooldown, nil, function(f)
    eFeature.Business.Hangar.Misc.Cooldown.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.Refresh, function(f)
    local stats = eFeature.Business.Hangar.Stats
    FeatureMgr.GetFeature(stats.BuyMade):SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Get())
    FeatureMgr.GetFeature(stats.BuyUndertaken):SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Get())
    FeatureMgr.GetFeature(stats.SellMade):SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Get())
    FeatureMgr.GetFeature(stats.SellUndertaken):SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get())
    FeatureMgr.GetFeature(stats.Earnings):SetIntValue(eStat.MPX_LFETIME_HANGAR_EARNINGS:Get())
end)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.BuyMade)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.SellMade)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.SellUndertaken)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.Earnings)

for i = 1, #hangarToggles do
    FeatureMgr.AddFeature(hangarToggles[i])
end

FeatureMgr.AddFeature(eFeature.Business.Hangar.Stats.Apply, function(f)
    local params = {}

    for i = 1, #hangarToggles do
        I(params, FeatureMgr.GetFeature(hangarToggles[i]):IsToggled())
    end

    for i = 1, #hangarStats do
        I(params, FeatureMgr.GetFeature(hangarStats[i]):GetIntValue())
    end

    eFeature.Business.Hangar.Stats.Apply.func(U(params))
end)

--#endregion

--#region Money Fronts

for i = 1, #moneyFrontsBusinesses do
    FeatureMgr.AddFeature(moneyFrontsBusinesses[i].Teleport.Entrance):SetVisible(false)

    FeatureMgr.AddFeature(moneyFrontsBusinesses[i].Teleport.Laptop):SetVisible(false)

    FeatureMgr.AddLoop(moneyFrontsBusinesses[i].Heat.Lock, nil, function(f)
        moneyFrontsBusinesses[i].Heat.Lock.func(f)
    end)

    FeatureMgr.AddFeature(moneyFrontsBusinesses[i].Heat.Max)

    FeatureMgr.AddFeature(moneyFrontsBusinesses[i].Heat.Min)

    FeatureMgr.AddFeature(moneyFrontsBusinesses[i].Heat.Select)
end

FeatureMgr.AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Collect):SetVisible(GTA_EDITION == "EE")

FeatureMgr.AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Lock, function(f)
    for i = 1, #moneyFrontsBusinesses do
        FeatureMgr.GetFeature(moneyFrontsBusinesses[i].Heat.Lock):Toggle(f:IsToggled())
    end
end)

FeatureMgr.AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Max, function(f)
    for i = 1, #moneyFrontsBusinesses do
        moneyFrontsBusinesses[i].Heat.Max.func()
    end
end)

FeatureMgr.AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Min, function(f)
    for i = 1, #moneyFrontsBusinesses do
        moneyFrontsBusinesses[i].Heat.Min.func()
    end
end)

FeatureMgr.AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Select)

--#endregion

--#region Nightclub

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Sale.Price, nil, function(f)
    eFeature.Business.Nightclub.Sale.Price.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Setup):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Teleport.Computer):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Open)

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Misc.Cooldown, nil, function(f)
    eFeature.Business.Nightclub.Misc.Cooldown.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Stats.Refresh, function(f)
    local stats = eFeature.Business.Nightclub.Stats
    FeatureMgr.GetFeature(stats.SellMade):SetIntValue(eStat.MPX_HUB_SALES_COMPLETED:Get())
    FeatureMgr.GetFeature(stats.Earnings):SetIntValue(eStat.MPX_HUB_EARNINGS:Get())
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Stats.SellMade)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Stats.Earnings)

for i = 1, #nightclubToggles do
    FeatureMgr.AddFeature(nightclubToggles[i])
end

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Stats.Apply, function(f)
    local params = {}

    for i = 1, #nightclubToggles do
        I(params, FeatureMgr.GetFeature(nightclubToggles[i]):IsToggled())
    end

    for i = 1, #nightclubStats do
        I(params, FeatureMgr.GetFeature(nightclubStats[i]):GetIntValue())
    end

    eFeature.Business.Nightclub.Stats.Apply.func(U(params))
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Safe.Fill)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Safe.Collect)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Safe.Unbrick)

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Popularity.Lock, nil, function(f)
    eFeature.Business.Nightclub.Popularity.Lock.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Popularity.Max)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Popularity.Min)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Popularity.Select)

--#endregion

--#region Special Cargo

FeatureMgr.AddLoop(eFeature.Business.CrateWarehouse.Sale.Price, nil, function(f)
    eFeature.Business.CrateWarehouse.Sale.Price.func(f)
end)

for i = 1, #specialSaleToggles do
    FeatureMgr.AddFeature(specialSaleToggles[i])
end

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Sale.Sell, function(f)
    local bools = {}

    for i = 1, #specialSaleToggles do
        I(bools, FeatureMgr.GetFeature(specialSaleToggles[i]))
    end

    eFeature.Business.CrateWarehouse.Sale.Sell.func(U(bools))
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Supplies.Supply)

FeatureMgr.AddLoop(eFeature.Business.CrateWarehouse.Supplies.Supplier, nil, function(f)
    eFeature.Business.CrateWarehouse.Supplies.Supplier.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Supplies.Select)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Supplies.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Supplies.Select):SetIntValue(111)
    eFeature.Business.CrateWarehouse.Supplies.Max.func()
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Supplies.Buy, function(f)
    local amount = FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Supplies.Select):GetIntValue()
    eFeature.Business.CrateWarehouse.Supplies.Buy.func(amount)
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Office):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Warehouse):SetVisible(false)

FeatureMgr.AddLoop(eFeature.Business.CrateWarehouse.Misc.Cooldown, nil, function(f)
    eFeature.Business.CrateWarehouse.Misc.Cooldown.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.Refresh, function(f)
    local stats = eFeature.Business.CrateWarehouse.Stats
    FeatureMgr.GetFeature(stats.BuyMade):SetIntValue(eStat.MPX_LIFETIME_BUY_COMPLETE:Get())
    FeatureMgr.GetFeature(stats.BuyUndertaken):SetIntValue(eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Get())
    FeatureMgr.GetFeature(stats.SellMade):SetIntValue(eStat.MPX_LIFETIME_SELL_COMPLETE:Get())
    FeatureMgr.GetFeature(stats.SellUndertaken):SetIntValue(eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Get())
    FeatureMgr.GetFeature(stats.Earnings):SetIntValue(eStat.MPX_LIFETIME_CONTRA_EARNINGS:Get())
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)

for i = 1, #specialToggles do
    FeatureMgr.AddFeature(specialToggles[i])
end

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Stats.Apply, function(f)
    local params = {}

    for i = 1, #specialToggles do
        I(params, FeatureMgr.GetFeature(specialToggles[i]):IsToggled())
    end

    for i = 1, #specialStats do
        I(params, FeatureMgr.GetFeature(specialStats[i]):GetIntValue())
    end

    eFeature.Business.CrateWarehouse.Stats.Apply.func(U(params))
end)

--#endregion

--#region Misc

FeatureMgr.AddFeature(eFeature.Business.Misc.Safes.Business)

FeatureMgr.AddFeature(eFeature.Business.Misc.Safes.Collect, function(f)
    local ftr      = eFeature.Business.Misc.Safes.Business
    local business = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Business.Misc.Safes.Collect.func(business)
end)

FeatureMgr.AddFeature(eFeature.Business.Misc.Safes.Refresh)

FeatureMgr.AddFeature(eFeature.Business.Misc.Supplies.Business)

FeatureMgr.AddFeature(eFeature.Business.Misc.Supplies.Resupply, function(f)
    local ftr      = eFeature.Business.Misc.Supplies.Business
    local business = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Business.Misc.Supplies.Resupply.func(business)
end)

FeatureMgr.AddFeature(eFeature.Business.Misc.Supplies.Refresh)

FeatureMgr.AddFeature(eFeature.Business.Misc.BailOffice.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Misc.BailOffice.Teleport.Computer):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Misc.BailOffice.Collect):SetVisible(GTA_EDITION == "EE")

FeatureMgr.AddFeature(eFeature.Business.Misc.Garment.Teleport.Entrance):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Misc.Garment.Teleport.Computer):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Business.Misc.Garment.Unbrick)

FeatureMgr.AddFeature(eFeature.Business.Misc.Garment.Collect):SetVisible(GTA_EDITION == "EE")

--#endregion

--#endregion
