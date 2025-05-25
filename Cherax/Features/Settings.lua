--#region Settings

local methodKeys = {
    "agency",
    "apartment",
    "auto_shop",
    "cayo_perico",
    "diamond_casino",
    "doomsday"
}

local delayKeys = {
    "_5k",
    "_50k",
    "_100k",
    "_180k",
    "_300k"
}

FeatureMgr.AddFeature(eFeature.Settings.Config.Reset, function(f)
    eFeature.Settings.Config.Reset.func()

    for i = 1, #settingsInstantFinishes do
        FeatureMgr.GetFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
    end

    FeatureMgr.GetFeature(eFeature.Settings.EasyMoney.Prevention):Toggle(CONFIG.easy_money.dummy_prevention)

    for i = 1, #settingsEasyDelays do
        FeatureMgr.GetFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
    end
end)

FeatureMgr.AddFeature(eFeature.Settings.Config.Copy)

FeatureMgr.AddFeature(eFeature.Settings.Discord.Copy)

for i = 1, #settingsInstantFinishes do
    FeatureMgr.AddFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
end

FeatureMgr.AddFeature(eFeature.Settings.EasyMoney.Prevention):Toggle(CONFIG.easy_money.dummy_prevention)

for i = 1, #settingsEasyDelays do
    FeatureMgr.AddFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
end

--#endregion
