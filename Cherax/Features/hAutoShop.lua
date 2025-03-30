FeatureMgr.AddFeature(autoContract.hash, autoContract.name, autoContract.type, autoContract.desc, function(f)
end)
    :SetList(autoContract.list:GetNames())

FeatureMgr.AddFeature(autoComplete.hash, autoComplete.name, autoComplete.type, autoComplete.desc, function(f)
    local contract = autoContract.list[FeatureMgr.GetFeatureListIndex(autoContract.hash) + 1].index
    autoComplete.func(contract)
end)

FeatureMgr.AddFeature(autoReload.hash, autoReload.name, autoReload.type, autoReload.desc, function(f)
    autoReload.func()
end)

FeatureMgr.AddFeature(autoFinish.hash, autoFinish.name, autoFinish.type, autoFinish.desc, function(f)
    autoFinish.func()
end)

FeatureMgr.AddFeature(autoCooldown.hash, autoCooldown.name, autoCooldown.type, autoCooldown.desc, function(f)
    autoCooldown.func()
end)

FeatureMgr.AddFeature(autoSelect.hash, autoSelect.name, autoSelect.type, autoSelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, 2000000)
    :SetStepSize(100000)
    :Reset()

FeatureMgr.AddFeature(autoApply.hash, autoApply.name, autoApply.type, autoApply.desc, function(f)
    local payout = FeatureMgr.GetFeature(autoSelect.hash):GetIntValue()
    autoApply.func(payout)
end)
