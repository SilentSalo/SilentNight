FeatureMgr.AddFeature(miscEditSelect.hash, miscEditSelect.name, miscEditSelect.type, miscEditSelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

FeatureMgr.AddFeature(miscEditDeposit.hash, miscEditDeposit.name, miscEditDeposit.type, miscEditDeposit.desc, function(f)
    local amount = FeatureMgr.GetFeature(miscEditSelect.hash):GetIntValue()
    miscEditDeposit.func(amount)
end)

FeatureMgr.AddFeature(miscEditWithdraw.hash, miscEditWithdraw.name, miscEditWithdraw.type, miscEditWithdraw.desc, function(f)
    local amount = FeatureMgr.GetFeature(miscEditSelect.hash):GetIntValue()
    miscEditWithdraw.func(amount)
end)

FeatureMgr.AddFeature(miscEditRemove.hash, miscEditRemove.name, miscEditRemove.type, miscEditRemove.desc, function(f)
    local amount = FeatureMgr.GetFeature(miscEditSelect.hash):GetIntValue()
    miscEditRemove.func(amount)
end)

FeatureMgr.AddFeature(miscEditDepositAll.hash, miscEditDepositAll.name, miscEditDepositAll.type, miscEditDepositAll.desc, function(f)
    miscEditDepositAll.func()
end)

FeatureMgr.AddFeature(miscEditWithdrawAll.hash, miscEditWithdrawAll.name, miscEditWithdrawAll.type, miscEditWithdrawAll.desc, function(f)
    miscEditWithdrawAll.func()
end)

FeatureMgr.AddFeature(miscStorySelect.hash, miscStorySelect.name, miscStorySelect.type, miscStorySelect.desc, function(f)
end)
    :SetDefaultValue(eStat.SP0_TOTAL_CASH:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

FeatureMgr.AddFeature(miscStoryCharacter.hash, miscStoryCharacter.name, miscStoryCharacter.type, miscStoryCharacter.desc, function(f)
    local characterIndex = miscStoryCharacter.list[f:GetListIndex() + 1].index
    FeatureMgr.GetFeature(miscStorySelect.hash):SetIntValue(eStat["SP" .. characterIndex .. "_TOTAL_CASH"]:Get())
end)
    :SetList(miscStoryCharacter.list:GetNames())

FeatureMgr.AddFeature(miscStoryApply.hash, miscStoryApply.name, miscStoryApply.type, miscStoryApply.desc, function(f)
    local characterIndex = miscStoryCharacter.list[FeatureMgr.GetFeatureListIndex(miscStoryCharacter.hash) + 1].index
    local amount         = FeatureMgr.GetFeature(miscStorySelect.hash):GetIntValue()
    miscStoryApply.func(characterIndex, amount)
end)

FeatureMgr.AddFeature(miscStatsSelect.hash, miscStatsSelect.name, miscStatsSelect.type, miscStatsSelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

FeatureMgr.AddFeature(miscStatsEarned.hash, miscStatsEarned.name, miscStatsEarned.type, miscStatsEarned.desc, function(f)
    local earnedStat = miscStatsEarned.list[FeatureMgr.GetFeatureListIndex(miscStatsEarned.hash) + 1].index
    FeatureMgr.GetFeature(miscStatsSelect.hash):SetIntValue((earnedStat ~= 0) and earnedStat:Get() or 0)
    if f:GetListIndex() > 0 then
        FeatureMgr.GetFeature(miscStatsSpent.hash):SetListIndex(0)
    end
end)
    :SetList(miscStatsEarned.list:GetNames())

FeatureMgr.AddFeature(miscStatsSpent.hash, miscStatsSpent.name, miscStatsSpent.type, miscStatsSpent.desc, function(f)
    local spentStat = miscStatsSpent.list[FeatureMgr.GetFeatureListIndex(miscStatsSpent.hash) + 1].index
    FeatureMgr.GetFeature(miscStatsSelect.hash):SetIntValue((spentStat ~= 0) and spentStat:Get() or 0)
    if f:GetListIndex() > 0 then
        FeatureMgr.GetFeature(miscStatsEarned.hash):SetListIndex(0)
    end
end)
    :SetList(miscStatsSpent.list:GetNames())

FeatureMgr.AddFeature(miscStatsApply.hash, miscStatsApply.name, miscStatsApply.type, miscStatsApply.desc, function(f)
    local earnedStat = miscStatsEarned.list[FeatureMgr.GetFeatureListIndex(miscStatsEarned.hash) + 1].index
    local spentStat  = miscStatsSpent.list[FeatureMgr.GetFeatureListIndex(miscStatsSpent.hash) + 1].index
    local amount     = FeatureMgr.GetFeature(miscStatsSelect.hash):GetIntValue()
    miscStatsApply.func(earnedStat, spentStat, amount)
end)
