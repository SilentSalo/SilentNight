FeatureMgr.AddFeature(devGlobalsType.hash, devGlobalsType.name, devGlobalsType.type, devGlobalsType.desc, function(f)
    local examples = {
        [0] = { global = "262145 + 9415", value = "100" },
        [1] = { global = "262145 + 1",    value = "1.0" },
        [2] = { global = "262145 + 4413", value = "0"   }
    }
    FeatureMgr.GetFeature(devGlobalsGlobal.hash):SetName(examples[f:GetListIndex()].global):SetStringValue("")
    FeatureMgr.GetFeature(devGlobalsValue.hash):SetName(examples[f:GetListIndex()].value):SetStringValue("")
end)
    :SetList(devGlobalsType.list:GetNames())

FeatureMgr.AddFeature(devGlobalsGlobal.hash, devGlobalsGlobal.name, devGlobalsGlobal.type, devGlobalsGlobal.desc, function(f)
end)

FeatureMgr.AddFeature(devGlobalsValue.hash, devGlobalsValue.name, devGlobalsValue.type, devGlobalsValue.desc, function(f)
end)

FeatureMgr.AddFeature(devGlobalsRead.hash, devGlobalsRead.name, devGlobalsRead.type, devGlobalsRead.desc, function(f)
    local globalString = FeatureMgr.GetFeature(devGlobalsGlobal.hash):GetStringValue()
    if globalString == "" then
        FeatureMgr.GetFeature(devGlobalsValue.hash):SetStringValue("")
        return
    end
    if not globalString:match("^[%d%s%+%-*/%%%(%)]+$") then
        FeatureMgr.GetFeature(devGlobalsValue.hash):SetStringValue("invalid")
        return
    end
    local global = tonumber(load(string.format("return %s", globalString))())
    if not global then
        FeatureMgr.GetFeature(devGlobalsValue.hash):SetStringValue("invalid")
        return
    end
    local GetValue = {
        ["int"]   = ScriptGlobal.GetInt,
        ["float"] = ScriptGlobal.GetFloat,
        ["bool"]  = ScriptGlobal.GetBool
    }
    local type  = devGlobalsType.list[FeatureMgr.GetFeatureListIndex(devGlobalsType.hash) + 1].name
    local value = GetValue[type](global)
    FeatureMgr.GetFeature(devGlobalsValue.hash):SetStringValue(tostring(value))
end)

FeatureMgr.AddFeature(devGlobalsWrite.hash, devGlobalsWrite.name, devGlobalsWrite.type, devGlobalsWrite.desc, function(f)
    local type   = devGlobalsType.list[FeatureMgr.GetFeatureListIndex(devGlobalsType.hash) + 1].name
    local global = load(string.format("return %s", FeatureMgr.GetFeature(devGlobalsGlobal.hash):GetStringValue()))()
    local value  = FeatureMgr.GetFeature(devGlobalsValue.hash):GetStringValue()
    local boolValue
    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end
    value = tonumber(value)
    devGlobalsWrite.func(type, global, value)
end)

FeatureMgr.AddFeature(devGlobalsRevert.hash, devGlobalsRevert.name, devGlobalsRevert.type, devGlobalsRevert.desc, function(f)
    local type   = devGlobalsType.list[FeatureMgr.GetFeatureListIndex(devGlobalsType.hash) + 1].name
    local global = load(string.format("return %s", FeatureMgr.GetFeature(devGlobalsGlobal.hash):GetStringValue()))()
    devGlobalsRevert.func(type, global)
end)

FeatureMgr.AddFeature(devStatsType.hash, devStatsType.name, devStatsType.type, devStatsType.desc, function(f)
    local examples = {
        [0] = { stat = "MPX_KILLS",               value = "7777" },
        [1] = { stat = "MPX_PLAYER_MENTAL_STATE", value = "99.9" },
        [2] = { stat = "MPPLY_CHAR_IS_BADSPORT",  value = "1"    }
    }
    FeatureMgr.GetFeature(devStatsStat.hash):SetName(examples[f:GetListIndex()].stat):SetStringValue("")
    FeatureMgr.GetFeature(devStatsValue.hash):SetName(examples[f:GetListIndex()].value):SetStringValue("")
end)
    :SetList(devStatsType.list:GetNames())

FeatureMgr.AddFeature(devStatsStat.hash, devStatsStat.name, devStatsStat.type, devStatsStat.desc, function(f)
end)

FeatureMgr.AddFeature(devStatsValue.hash, devStatsValue.name, devStatsValue.type, devStatsValue.desc, function(f)
end)

FeatureMgr.AddFeature(devStatsRead.hash, devStatsRead.name, devStatsRead.type, devStatsRead.desc, function(f)
    local stat = FeatureMgr.GetFeature(devStatsStat.hash):GetStringValue()
    if stat == "" then
        FeatureMgr.GetFeature(devStatsValue.hash):SetStringValue("")
        return
    end
    local hash = 0
    local function IsStoryStat()
        return stat:find("SP0") or stat:find("SP1") or stat:find("SP2")
    end
    if stat:sub(1, 3) == "MPX" then
        stat = stat:gsub("MPX", string.format("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash = Utils.sJoaat(stat)
    end
    if stat:find("MPPLY") or IsStoryStat() then
        hash = Utils.sJoaat(stat)
    end
    local GetValue = {
        ["int"]   = Stats.GetInt,
        ["float"] = Stats.GetFloat,
        ["bool"]  = Stats.GetBool
    }
    local type  = devStatsType.list[FeatureMgr.GetFeatureListIndex(devStatsType.hash) + 1].name
    local success, value = GetValue[type](hash)
    if not success then
        FeatureMgr.GetFeature(devStatsValue.hash):SetStringValue("invalid")
        return
    end
    FeatureMgr.GetFeature(devStatsValue.hash):SetStringValue(tostring(value))
end)

FeatureMgr.AddFeature(devStatsWrite.hash, devStatsWrite.name, devStatsWrite.type, devStatsWrite.desc, function(f)
    local type  = devStatsType.list[FeatureMgr.GetFeatureListIndex(devStatsType.hash) + 1].name
    local stat  = FeatureMgr.GetFeature(devStatsStat.hash):GetStringValue()
    local value = FeatureMgr.GetFeature(devStatsValue.hash):GetStringValue()
    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end
    value = tonumber(value)
    devStatsWrite.func(type, stat, value)
end)

FeatureMgr.AddFeature(devStatsRevert.hash, devStatsRevert.name, devStatsRevert.type, devStatsRevert.desc, function(f)
    local type = devStatsType.list[FeatureMgr.GetFeatureListIndex(devStatsType.hash) + 1].name
    local stat = FeatureMgr.GetFeature(devStatsStat.hash):GetStringValue()
    devStatsRevert.func(type, stat)
end)

FeatureMgr.AddFeature(devPackedStatsRange.hash, devPackedStatsRange.name, devPackedStatsRange.type, devPackedStatsRange.desc, function(f)
    local examples = {
        [0] = { index = { "22050", "22050-22087" }, value = "5" },
        [1] = { index = { "27087", "27087-27092" }, value = "0" }
    }
    if f:IsToggled() then
        FeatureMgr.GetFeature(devPackedStatsWrite.hash):SetName("Write Range"):SetDesc("Writes the selected value to the entered packed stats range.")
        FeatureMgr.GetFeature(devPackedStatsRead.hash):SetVisible(false)
        FeatureMgr.GetFeature(devPackedStatsRevert.hash):SetVisible(false)
        FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):SetName(examples[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash)].index[2]):SetStringValue("")
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetName("1"):SetStringValue("")
    else
        FeatureMgr.GetFeature(devPackedStatsWrite.hash):SetName("Write"):SetDesc("Writes the selected value to the entered packed stat.")
        FeatureMgr.GetFeature(devPackedStatsRead.hash):SetVisible(true)
        FeatureMgr.GetFeature(devPackedStatsRevert.hash):SetVisible(true)
        FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):SetName(examples[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash)].index[1]):SetStringValue("")
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetName(examples[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash)].value):SetStringValue("")
    end
end)

FeatureMgr.AddFeature(devPackedStatsType.hash, devPackedStatsType.name, devPackedStatsType.type, devPackedStatsType.desc, function(f)
    local examples = {
        [0] = { index = { "22050", "22050-22087" }, value = "5" },
        [1] = { index = { "27087", "27087-27092" }, value = "0" }
    }
    if FeatureMgr.GetFeature(devPackedStatsRange.hash):IsToggled() then
        FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):SetName(examples[f:GetListIndex()].index[2]):SetStringValue("")
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetName("1"):SetStringValue("")
    else
        FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):SetName(examples[f:GetListIndex()].index[1]):SetStringValue("")
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetName(examples[f:GetListIndex()].value):SetStringValue("")
    end
end)
    :SetList(devPackedStatsType.list:GetNames())

FeatureMgr.AddFeature(devPackedStatsPackedStat.hash, devPackedStatsPackedStat.name, devPackedStatsPackedStat.type, devPackedStatsPackedStat.desc, function(f)
end)

FeatureMgr.AddFeature(devPackedStatsValue.hash, devPackedStatsValue.name, devPackedStatsValue.type, devPackedStatsValue.desc, function(f)
end)

FeatureMgr.AddFeature(devPackedStatsRead.hash, devPackedStatsRead.name, devPackedStatsRead.type, devPackedStatsRead.desc, function(f)
    local packedStatString = FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):GetStringValue()
    if packedStatString == "" then
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetStringValue("")
        return
    end
    if not packedStatString:match("^%d+$") then
        FeatureMgr.GetFeature(devPackedStatsValue.hash):SetStringValue("invalid")
        return
    end
    local packedStat = tonumber(packedStatString)
    local GetValue = {
        ["int"]  = eNative.STATS.GET_PACKED_STAT_INT_CODE,
        ["bool"] = eNative.STATS.GET_PACKED_STAT_BOOL_CODE
    }
    local type  = devPackedStatsType.list[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash) + 1].name
    local value = GetValue[type](packedStat, eStat.MPPLY_LAST_MP_CHAR:Get())
    FeatureMgr.GetFeature(devPackedStatsValue.hash):SetStringValue(tostring(value))
end)

FeatureMgr.AddFeature(devPackedStatsWrite.hash, devPackedStatsWrite.name, devPackedStatsWrite.type, devPackedStatsWrite.desc, function(f)
    local firstPStat = nil
    local lastPStat = nil
    if not FeatureMgr.GetFeature(devPackedStatsRange.hash):IsToggled() then
        firstPStat = tonumber(FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):GetStringValue())
    end
    local type  = devPackedStatsType.list[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash) + 1].name
    local value = FeatureMgr.GetFeature(devPackedStatsValue.hash):GetStringValue()
    if FeatureMgr.GetFeature(devPackedStatsRange.hash):IsToggled() then
        local packedStats = FeatureMgr.GetFeature(devPackedStatsPackedStat.hash):GetStringValue()
        if packedStats == "" then
            FeatureMgr.GetFeature(devPackedStatsValue.hash):SetStringValue("")
            return
        end
        if not packedStats:match("^%d+%-%d+$") then
            FeatureMgr.GetFeature(devPackedStatsValue.hash):SetStringValue("invalid")
            return
        end
        firstPStat, lastPStat = packedStats:match("^(%d+)%-(%d+)$")
        firstPStat = tonumber(firstPStat)
        lastPStat = tonumber(lastPStat)
    end
    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end
    value = tonumber(value)
    Logger.Log("firstPStat: " .. tostring(firstPStat) .. ", lastPStat: " .. tostring(lastPStat) .. ", value: " .. tostring(value))
    devPackedStatsWrite.func(type, firstPStat, lastPStat, value)
end)

FeatureMgr.AddFeature(devPackedStatsRevert.hash, devPackedStatsRevert.name, devPackedStatsRevert.type, devPackedStatsRevert.desc, function(f)
    local type       = devPackedStatsType.list[FeatureMgr.GetFeatureListIndex(devPackedStatsType.hash) + 1].name
    local packedStat = FeatureMgr.GetFeature(devPackedStatsGlobal.hash):GetStringValue()
    devPackedStatsRevert.func(type, packedStat)
end)

