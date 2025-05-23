--#region FeatureMgr

_GetFeature          = FeatureMgr.GetFeature
_GetFeatureListIndex = FeatureMgr.GetFeatureListIndex
_AddFeature          = FeatureMgr.AddFeature

function FeatureMgr.GetFeature(feature)
    return _GetFeature(feature.hash)
end

function FeatureMgr.GetFeatureListIndex(feature)
    return _GetFeatureListIndex(feature.hash)
end

function FeatureMgr.AddFeature(feature, callback)
    _AddFeature(feature.hash, feature.name, feature.type, feature.desc, function(f)
        if callback then
            callback(f)
        elseif feature.func then
            feature.func(f)
        end
    end)

    if feature.list then
        FeatureMgr.GetFeature(feature):SetList(feature.list:GetNames())
    end

    if feature.defv then
        FeatureMgr.GetFeature(feature):SetDefaultValue(feature.defv)
    end

    if feature.lims then
        FeatureMgr.GetFeature(feature):SetLimitValues(U(feature.lims))
    end

    if feature.step then
        FeatureMgr.GetFeature(feature):SetStepSize(feature.step)
    end

    if feature.defv or feature.lims or feature.step then
        FeatureMgr.GetFeature(feature):Reset()
    end

    return FeatureMgr.GetFeature(feature)
end

function FeatureMgr.AddLoop(feature, onEnable, onDisable)
    local state = false

    FeatureMgr.AddFeature(feature, function(f)
        if f:IsToggled() then
            if not state then
                state = true

                Script.RegisterLooped(function()
                    if ShouldUnload() or not f:IsToggled() then
                        return
                    end

                    if onEnable then
                        onEnable(f)
                    elseif feature.func then
                        feature.func(f)
                    end
                end)
            end
        elseif onDisable and state then
            onDisable(f)
            state = false
        end
    end)

    return FeatureMgr.GetFeature(feature)
end

--#endregion
