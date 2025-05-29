--#region Settings

methodKeys = {
    "agency",
    "apartment",
    "auto_shop",
    "cayo_perico",
    "diamond_casino",
    "doomsday"
}

delayKeys = {
    "_5k",
    "_50k",
    "_100k",
    "_180k",
    "_300k"
}

FeatureMgr.AddFeature(eFeature.Settings.Config.Logging):SetListIndex(CONFIG.logging)

FeatureMgr.AddFeature(eFeature.Settings.Config.Reset, function(f)
    eFeature.Settings.Config.Reset.func()

    FeatureMgr.GetFeature(eFeature.Settings.Config.Logging):SetListIndex(CONFIG.logging)
    FeatureMgr.GetFeature(eFeature.Settings.Collab.JinxScript.Toggle):Toggle(CONFIG.collab.jinxscript)
    FeatureMgr.GetFeature(eFeature.Settings.UnlockAllPoi.CayoPerico):Toggle(CONFIG.unlock_all_poi.cayo_perico)
    FeatureMgr.GetFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino):Toggle(CONFIG.unlock_all_poi.diamond_casino)
    FeatureMgr.GetFeature(eFeature.Settings.EasyMoney.Prevention):Toggle(CONFIG.easy_money.dummy_prevention)

    for i = 1, #settingsInstantFinishes do
        FeatureMgr.GetFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
    end

    for i = 1, #settingsEasyDelays do
        FeatureMgr.GetFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
    end
end)

FeatureMgr.AddFeature(eFeature.Settings.Config.Copy)

FeatureMgr.AddFeature(eFeature.Settings.Config.Discord)

FeatureMgr.AddFeature(eFeature.Settings.Collab.JinxScript.Toggle):Toggle(CONFIG.collab.jinxscript)

FeatureMgr.AddFeature(eFeature.Settings.Collab.JinxScript.Discord)

for i = 1, #settingsInstantFinishes do
    FeatureMgr.AddFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
end

FeatureMgr.AddFeature(eFeature.Settings.UnlockAllPoi.CayoPerico, nil, function(f)
    eFeature.Settings.UnlockAllPoi.CayoPerico.func(f)
end)
    :Toggle(CONFIG.unlock_all_poi.cayo_perico)

FeatureMgr.AddFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino, nil, function(f)
    eFeature.Settings.UnlockAllPoi.DiamondCasino.func(f)
end)
    :Toggle(CONFIG.unlock_all_poi.diamond_casino)

FeatureMgr.AddFeature(eFeature.Settings.EasyMoney.Prevention, nil, function(f)
    eFeature.Settings.EasyMoney.Prevention.func(f)
end)
    :Toggle(CONFIG.easy_money.dummy_prevention)

for i = 1, #settingsEasyDelays do
    FeatureMgr.AddFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
end

--#endregion
