FeatureMgr.AddFeature(nightclubPrice.hash, nightclubPrice.name, nightclubPrice.type, nightclubPrice.desc, function(f)
end)

FeatureMgr.AddFeature(nightclubOpen.hash, nightclubOpen.name, nightclubOpen.type, nightclubOpen.desc, function(f)
    nightclubOpen.func()
end)

FeatureMgr.AddFeature(nightclubTrigger.hash, nightclubTrigger.name, nightclubTrigger.type, nightclubTrigger.desc, function(f)
    nightclubTrigger.func()
end)
    :SetVisible(false)

FeatureMgr.AddFeature(nightclubSupplier.hash, nightclubSupplier.name, nightclubSupplier.type, nightclubSupplier.desc, function(f)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(nightclubCooldown.hash, nightclubCooldown.name, nightclubCooldown.type, nightclubCooldown.desc, function(f)
    nightclubCooldown.func(f:IsToggled())
end)

FeatureMgr.AddFeature(nightclubSetup.hash, nightclubSetup.name, nightclubSetup.type, nightclubSetup.desc, function(f)
    nightclubSetup.func()
end)

FeatureMgr.AddFeature(nightclubSellMade.hash, nightclubSellMade.name, nightclubSellMade.type, nightclubSellMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_HUB_SALES_COMPLETED:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(nightclubEarnings.hash, nightclubEarnings.name, nightclubEarnings.type, nightclubEarnings.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_HUB_EARNINGS:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

for i = 1, 2 do
    FeatureMgr.AddFeature(nightclubToggles[i].hash, nightclubToggles[i].name, nightclubToggles[i].type, nightclubToggles[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(nightclubApply.hash, nightclubApply.name, nightclubApply.type, nightclubApply.desc, function(f)
    local args = {}
    for i = 1, 2 do
        table.insert(args, FeatureMgr.GetFeature(nightclubToggles[i].hash):IsToggled())
    end
    for i = 1, 2 do
        table.insert(args, FeatureMgr.GetFeature(nightclubStats[i].hash):GetIntValue())
    end
    nightclubApply.func(table.unpack(args))
end)

FeatureMgr.AddFeature(nightclubFill.hash, nightclubFill.name, nightclubFill.type, nightclubFill.desc, function(f)
    nightclubFill.func()
end)

FeatureMgr.AddFeature(nightclubCollect.hash, nightclubCollect.name, nightclubCollect.type, nightclubCollect.desc, function(f)
    nightclubCollect.func()
end)

FeatureMgr.AddFeature(nightclubMax.hash, nightclubMax.name, nightclubMax.type, nightclubMax.desc, function(f)
    nightclubMax.func()
end)

FeatureMgr.AddFeature(nightclubMin.hash, nightclubMin.name, nightclubMin.type, nightclubMin.desc, function(f)
    nightclubMin.func()
end)

FeatureMgr.AddFeature(nightclubLock.hash, nightclubLock.name, nightclubLock.type, nightclubLock.desc, function(f)
end)
