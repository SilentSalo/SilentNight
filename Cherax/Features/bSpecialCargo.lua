FeatureMgr.AddFeature(specialPrice.hash, specialPrice.name, specialPrice.type, specialPrice.desc, function(f)
    specialPrice.func(f:IsToggled())
end)

for i = 1, #specialSaleToggles do
    FeatureMgr.AddFeature(specialSaleToggles[i].hash, specialSaleToggles[i].name, specialSaleToggles[i].type, specialSaleToggles[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(specialSell.hash, specialSell.name, specialSell.type, specialSell.desc, function(f)
    local bools = {}
    for i = 1, #specialSaleToggles do
        table.insert(bools, FeatureMgr.GetFeature(specialSaleToggles[i].hash):IsToggled())
    end
    specialSell.func(table.unpack(bools))
end)

FeatureMgr.AddFeature(specialOpen.hash, specialOpen.name, specialOpen.type, specialOpen.desc, function(f)
    specialOpen.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(specialSupply.hash, specialSupply.name, specialSupply.type, specialSupply.desc, function(f)
    specialSupply.func()
end)

FeatureMgr.AddFeature(specialSupplier.hash, specialSupplier.name, specialSupplier.type, specialSupplier.desc, function(f)
end)

FeatureMgr.AddFeature(specialSelect.hash, specialSelect.name, specialSelect.type, specialSelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, 111)
    :SetStepSize(1)
    :Reset()

FeatureMgr.AddFeature(specialBuy.hash, specialBuy.name, specialBuy.type, specialBuy.desc, function(f)
    local amount = FeatureMgr.GetFeature(specialSelect.hash):GetIntValue()
    specialBuy.func(amount)
end)

FeatureMgr.AddFeature(specialCooldown.hash, specialCooldown.name, specialCooldown.type, specialCooldown.desc, function(f)
    specialCooldown.func(f:IsToggled())
end)

FeatureMgr.AddFeature(specialBuyMade.hash, specialBuyMade.name, specialBuyMade.type, specialBuyMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_BUY_COMPLETE:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(specialBuyUndertaken.hash, specialBuyUndertaken.name, specialBuyUndertaken.type, specialBuyUndertaken.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(specialSellMade.hash, specialSellMade.name, specialSellMade.type, specialSellMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_SELL_COMPLETE:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(specialSellUndertaken.hash, specialSellUndertaken.name, specialSellUndertaken.type, specialSellUndertaken.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(specialEarnings.hash, specialEarnings.name, specialEarnings.type, specialEarnings.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_CONTRA_EARNINGS:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

for i = 1, #specialToggles do
    FeatureMgr.AddFeature(specialToggles[i].hash, specialToggles[i].name, specialToggles[i].type, specialToggles[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(specialApply.hash, specialApply.name, specialApply.type, specialApply.desc, function(f)
    local args = {}
    for i = 1, #specialToggles do
        table.insert(args, FeatureMgr.GetFeature(specialToggles[i].hash):IsToggled())
    end
    for i = 1, #specialStats do
        table.insert(args, FeatureMgr.GetFeature(specialStats[i].hash):GetIntValue())
    end
    specialApply.func(table.unpack(args))
end)
