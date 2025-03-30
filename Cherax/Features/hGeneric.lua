
FeatureMgr.AddFeature(genericCutscene.hash, genericCutscene.name, genericCutscene.type, genericCutscene.desc, function(f)
    genericCutscene.func()
end)

FeatureMgr.AddFeature(genericLaunch.hash, genericLaunch.name, genericLaunch.type, genericLaunch.desc, function(f)
    genericLaunch.func()
end)

FeatureMgr.AddFeature(genericCut.hash, genericCut.name, genericCut.type, genericCut.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, 999)
    :SetStepSize(1)
    :Reset()

FeatureMgr.AddFeature(genericApply.hash, genericApply.name, genericApply.type, genericApply.desc, function(f)
    local cut = FeatureMgr.GetFeature(genericCut.hash):GetIntValue()
    genericApply.func(cut)
end)
