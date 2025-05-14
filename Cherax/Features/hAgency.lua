FeatureMgr.AddFeature(agencyContract.hash, agencyContract.name, agencyContract.type, agencyContract.desc, function(f)
end)
    :SetList(agencyContract.list:GetNames())

FeatureMgr.AddFeature(agencyComplete.hash, agencyComplete.name, agencyComplete.type, agencyComplete.desc, function(f)
    local contract = agencyContract.list[FeatureMgr.GetFeatureListIndex(agencyContract.hash) + 1].index
    agencyComplete.func(contract)
end)

FeatureMgr.AddFeature(agencyCooldown.hash, agencyCooldown.name, agencyCooldown.type, agencyCooldown.desc, function(f)
    agencyCooldown.func()
end)

FeatureMgr.AddFeature(agencyFinish.hash, agencyFinish.name, agencyFinish.type, agencyFinish.desc, function(f)
    agencyFinish.func()
end)

FeatureMgr.AddFeature(agencySelect.hash, agencySelect.name, agencySelect.type, agencySelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, 3000000)
    :SetStepSize(100000)
    :Reset()

FeatureMgr.AddFeature(agencyMax.hash, agencyMax.name, agencyMax.type, agencyMax.desc, function(f)
    local feature = FeatureMgr.GetFeature(agencySelect.hash)
    feature:SetIntValue(feature:GetIntMaxValue())
end)

FeatureMgr.AddFeature(agencyApply.hash, agencyApply.name, agencyApply.type, agencyApply.desc, function(f)
    local payout = FeatureMgr.GetFeature(agencySelect.hash):GetIntValue()
    agencyApply.func(payout)
end)
