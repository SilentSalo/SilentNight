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
    "_300k",
    "_680k"
}

FeatureMgr.AddFeature(eFeature.Settings.Config.Open):Toggle(CONFIG.autoopen)

FeatureMgr.AddFeature(eFeature.Settings.Config.Logging):SetListIndex(CONFIG.logging)

FeatureMgr.AddFeature(eFeature.Settings.Config.Reset, function(f)
    eFeature.Settings.Config.Reset.func()

    FeatureMgr.GetFeature(eFeature.Settings.Config.Open):Toggle(CONFIG.autoopen)
    FeatureMgr.GetFeature(eFeature.Settings.Config.Logging):SetListIndex(CONFIG.logging)
    FeatureMgr.GetFeature(eFeature.Settings.Translation.File):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Settings.Collab.JinxScript.Toggle):Toggle(CONFIG.collab.jinxscript.enabled)
    FeatureMgr.GetFeature(eFeature.Settings.Collab.JinxScript.Stop):Toggle(CONFIG.collab.jinxscript.autostop)
    FeatureMgr.GetFeature(eFeature.Settings.UnlockAllPoi.CayoPerico):Toggle(CONFIG.unlock_all_poi.cayo_perico)
    FeatureMgr.GetFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino):Toggle(CONFIG.unlock_all_poi.diamond_casino)
    FeatureMgr.GetFeature(eFeature.Settings.EasyMoney.Prevention):Toggle(CONFIG.easy_money.dummy_prevention)
    FeatureMgr.GetFeature(eFeature.Settings.EasyMoney.Allow300k):Toggle(CONFIG.easy_money.allow_300k_loop)

    for i = 1, #settingsInstantFinishes do
        FeatureMgr.GetFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
    end

    for i = 1, #settingsEasyDelays do
        FeatureMgr.GetFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
    end

    FeatureMgr.GetFeature(eFeature.Settings.Translation.Load):OnClick()
end)

FeatureMgr.AddFeature(eFeature.Settings.Config.Copy)

FeatureMgr.AddFeature(eFeature.Settings.Config.Discord)

FeatureMgr.AddFeature(eFeature.Settings.Translation.File)

FeatureMgr.AddFeature(eFeature.Settings.Translation.Load, function(f)
    local ftr  = eFeature.Settings.Translation.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Settings.Translation.Load.func(file)
end)

FeatureMgr.AddFeature(eFeature.Settings.Translation.Remove, function(f)
    local ftr  = eFeature.Settings.Translation.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Settings.Translation.Remove.func(file)
end)

FeatureMgr.AddFeature(eFeature.Settings.Translation.Refresh)

FeatureMgr.AddFeature(eFeature.Settings.Translation.Export, function(f)
    local ftr  = eFeature.Settings.Translation.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Settings.Translation.Export.func(file)
end)

FeatureMgr.AddFeature(eFeature.Settings.Translation.Copy)

FeatureMgr.AddFeature(eFeature.Settings.Collab.JinxScript.Toggle):Toggle(CONFIG.collab.jinxscript.enabled)

FeatureMgr.AddFeature(eFeature.Settings.Collab.JinxScript.Discord)

FeatureMgr.AddFeature(eFeature.Settings.Collab.JinxScript.Stop):Toggle(CONFIG.collab.jinxscript.autostop)

for i = 1, #settingsInstantFinishes do
    FeatureMgr.AddFeature(settingsInstantFinishes[i]):SetListIndex(CONFIG.instant_finish[methodKeys[i]])
end

FeatureMgr.AddFeature(eFeature.Settings.UnlockAllPoi.CayoPerico):Toggle(CONFIG.unlock_all_poi.cayo_perico)

FeatureMgr.AddFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino):Toggle(CONFIG.unlock_all_poi.diamond_casino)

FeatureMgr.AddFeature(eFeature.Settings.EasyMoney.Prevention):Toggle(CONFIG.easy_money.dummy_prevention)

FeatureMgr.AddFeature(eFeature.Settings.EasyMoney.Allow300k)
    :Toggle(CONFIG.easy_money.allow_300k_loop)
    :SetVisible(GTA_EDITION == "EE")

for i = 1, #settingsEasyDelays do
    FeatureMgr.AddFeature(settingsEasyDelays[i]):SetFloatValue((CONFIG.easy_money.delay[delayKeys[i]]))
end

--#endregion
