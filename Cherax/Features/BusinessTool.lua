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

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Open)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Supply)

FeatureMgr.AddFeature(eFeature.Business.Bunker.Misc.Trigger)

FeatureMgr.AddLoop(eFeature.Business.Bunker.Misc.Supplier, nil, function(f)
    eFeature.Business.Bunker.Misc.Supplier.func(f)
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

FeatureMgr.AddFeature(eFeature.Business.Hangar.Misc.Open)

FeatureMgr.AddFeature(eFeature.Business.Hangar.Misc.Supply)

FeatureMgr.AddLoop(eFeature.Business.Hangar.Misc.Supplier, nil, function(f)
    eFeature.Business.Hangar.Misc.Supplier.func(f)
end)

FeatureMgr.AddLoop(eFeature.Business.Hangar.Misc.Cooldown, nil, function(f)
    eFeature.Business.Hangar.Misc.Cooldown.func(f)
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

--#region Nightclub

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Sale.Price, nil, function(f)
    eFeature.Business.Nightclub.Sale.Price.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Open)

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Misc.Cooldown, nil, function(f)
    eFeature.Business.Nightclub.Misc.Cooldown.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Misc.Setup)

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

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Popularity.Max)

FeatureMgr.AddFeature(eFeature.Business.Nightclub.Popularity.Min)

FeatureMgr.AddLoop(eFeature.Business.Nightclub.Popularity.Lock, nil, function(f)
    eFeature.Business.Nightclub.Popularity.Lock.func(f)
end)

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

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Supply)

FeatureMgr.AddLoop(eFeature.Business.CrateWarehouse.Misc.Supplier, nil, function(f)
    eFeature.Business.CrateWarehouse.Misc.Supplier.func(f)
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Select)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Max, function(f)
    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Select):SetIntValue(111)
    eFeature.Business.CrateWarehouse.Misc.Max.func()
end)

FeatureMgr.AddFeature(eFeature.Business.CrateWarehouse.Misc.Buy, function(f)
    local amount = FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Select):GetIntValue()
    eFeature.Business.CrateWarehouse.Misc.Buy.func(amount)
end)

FeatureMgr.AddLoop(eFeature.Business.CrateWarehouse.Misc.Cooldown, nil, function(f)
    eFeature.Business.CrateWarehouse.Misc.Cooldown.func(f)
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

FeatureMgr.AddFeature(eFeature.Business.Misc.Supplies.Business)

FeatureMgr.AddFeature(eFeature.Business.Misc.Supplies.Resupply, function(f)
    local ftr      = eFeature.Business.Misc.Supplies.Business
    local business = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Business.Misc.Supplies.Resupply.func(business)
end)

FeatureMgr.AddFeature(eFeature.Business.Misc.Garment.Unbrick)

--#endregion

--#endregion
