--#region Dev Tool

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Type, function(f)
    local examples = {
        [0] = { global = "262145 + 9415", value = "100" },
        [1] = { global = "262145 + 1",    value = "1.0" },
        [2] = { global = "262145 + 4413", value = "0"   }
    }

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global)
        :SetName(examples[f:GetListIndex()].global)
        :SetStringValue("")

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value)
        :SetName(examples[f:GetListIndex()].value)
        :SetStringValue("")
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Global)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Read, function(f)
    local globalString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()

    if globalString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("")
        return
    end

    if not globalString:match("^[%d%s%+%-*/%%%(%)]+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        return
    end

    local global = N(load(F("return %s", globalString))())

    if not global then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        return
    end

    local GetValue = {
        ["int"]   = ScriptGlobal.GetInt,
        ["float"] = ScriptGlobal.GetFloat,
        ["bool"]  = ScriptGlobal.GetBool
    }

    local ftr   = eFeature.Dev.Editor.Globals.Type
    local type  = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    local value = GetValue[type](global)

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue(S(value))
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Write, function(f)
    local ftr  = eFeature.Dev.Editor.Globals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local global = load(F("return %s", FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()))()
    local value  = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):GetStringValue()

    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end

    value = N(value)

    local GetValue = {
        ["int"]   = ScriptGlobal.GetInt,
        ["float"] = ScriptGlobal.GetFloat,
        ["bool"]  = ScriptGlobal.GetBool
    }

    TEMP_GLOBAL = GetValue[type](global)
    eFeature.Dev.Editor.Globals.Write.func(type, global, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Revert, function(f)
    local ftr    = eFeature.Dev.Editor.Globals.Type
    local type   = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    local global = load(F("return %s", FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()))()

    if TEMP_GLOBAL ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue(S(TEMP_GLOBAL))
    end

    eFeature.Dev.Editor.Globals.Revert.func(type, global)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Type, function(f)
    local examples = {
        [0] = { script = "am_mp_nightclub",            vLocal = "202 + 32 + 1", value = "0"    },
        [1] = { script = "fm_mission_controller_2020", vLocal = "31049 + 3",    value = "99.9" }
    }

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script)
        :SetName(examples[f:GetListIndex()].script)
        :SetStringValue("")

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local)
        :SetName(examples[f:GetListIndex()].vLocal)
        :SetStringValue("")

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value)
        :SetName(examples[f:GetListIndex()].value)
        :SetStringValue("")
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Script)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Local)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Read, function(f)
    local scriptString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local localString  = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()

    if scriptString == "" or localString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("")
        return
    end

    if scriptString:match("^[%w%-]+$") or not localString:match("^[%d%s%+%-*/%%%(%)]+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        return
    end

    local vLocal = N(load(F("return %s", localString))())

    if not vLocal then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        return
    end

    local GetValue = {
        ["int"]   = ScriptLocal.GetInt,
        ["float"] = ScriptLocal.GetFloat
    }

    local ftr  = eFeature.Dev.Editor.Locals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local script = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local value  = GetValue[type](J(script), vLocal)

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue(S(value))
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Write, function(f)
    local ftr    = eFeature.Dev.Editor.Locals.Type
    local type   = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local script = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local vLocal = load(F("return %s", FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()))()
    local value  = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):GetStringValue())

    local GetValue = {
        ["int"]   = ScriptLocal.GetInt,
        ["float"] = ScriptLocal.GetFloat
    }

    TEMP_LOCAL = GetValue[type](J(script), vLocal)
    eFeature.Dev.Editor.Locals.Write.func(type, J(script), vLocal, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Revert, function(f)
    local ftr    = eFeature.Dev.Editor.Locals.Type
    local type   = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local script = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local vLocal = load(F("return %s", FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()))()

    if TEMP_LOCAL ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue(S(TEMP_LOCAL))
    end

    eFeature.Dev.Editor.Locals.Revert.func(type, J(script), vLocal)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.From, function(f)
    for i = 1, #devStatsDefault do
        FeatureMgr.GetFeature(devStatsDefault[i]):SetVisible((not f:IsToggled()) and true or false)
    end
    for i = 1, #devStatsFromFile do
        FeatureMgr.GetFeature(devStatsFromFile[i]):SetVisible((f:IsToggled()) and true or false)
    end
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Type, function(f)
    local examples = {
        [0] = { stat = "MPX_KILLS",               value = "7777" },
        [1] = { stat = "MPX_PLAYER_MENTAL_STATE", value = "99.9" },
        [2] = { stat = "MPPLY_CHAR_IS_BADSPORT",  value = "1"    }
    }

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat)
        :SetName(examples[f:GetListIndex()].stat)
        :SetStringValue("")

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value)
        :SetName(examples[f:GetListIndex()].value)
        :SetStringValue("")
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Stat)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Read, function(f)
    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()

    if statString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("")
        return
    end

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    end

    if statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    end

    local GetValue = {
        ["int"]   = Stats.GetInt,
        ["float"] = Stats.GetFloat,
        ["bool"]  = Stats.GetBool
    }

    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local success, value = GetValue[type](hash)

    if not success then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("invalid")
        return
    end

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue(S(value))
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Write, function(f)
    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()
    local value      = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):GetStringValue()

    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end

    value = N(value)

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    end

    if statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    end

    local GetValue = {
        ["int"]   = Stats.GetInt,
        ["float"] = Stats.GetFloat,
        ["bool"]  = Stats.GetBool
    }

    local success, tempValue = GetValue[type](hash)
    TEMP_STAT = tempValue

    eFeature.Dev.Editor.Stats.Write.func(type, hash, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Revert, function(f)
    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    end

    if statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    end

    if TEMP_STAT ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue(S(TEMP_STAT))
    end

    eFeature.Dev.Editor.Stats.Revert.func(type, hash)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.File):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.WriteAll, function(f)
    local ftr  = eFeature.Dev.Editor.Stats.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Dev.Editor.Stats.WriteAll.func(file)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Remove, function(f)
    local ftr  = eFeature.Dev.Editor.Stats.File
    local file = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name
    eFeature.Dev.Editor.Stats.Remove.func(file)
end)
    :SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Refresh):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Copy):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Generate):SetVisible(false)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Range, function(f)
    local examples = {
        [0] = { index = { "22050", "22050-22087" }, value = "5" },
        [1] = { index = { "27087", "27087-27092" }, value = "0" }
    }

    if f:IsToggled() then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Write)
            :SetName("Write Range")
            :SetDesc("Writes the selected value to the entered packed stats range.")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Read):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Revert):SetVisible(false)

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            :SetName(examples[FeatureMgr.GetFeatureListIndex(eFeature.Dev.Editor.PackedStats.Type)].index[2])
            :SetDesc("Input your packed stats range here.")
            :SetStringValue("")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value)
            :SetName("1")
            :SetStringValue("")
    else
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Write)
            :SetName("Write")
            :SetDesc("Writes the selected value to the entered packed stat.")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Read):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Revert):SetVisible(true)

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            :SetName(examples[FeatureMgr.GetFeatureListIndex(eFeature.Dev.Editor.PackedStats.Type)].index[1])
            :SetDesc("Input your packed stat here.")
            :SetStringValue("")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value)
            :SetName(examples[FeatureMgr.GetFeatureListIndex(eFeature.Dev.Editor.PackedStats.Type)].value)
            :SetStringValue("")
    end
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Type, function(f)
    local examples = {
        [0] = { index = { "22050", "22050-22087" }, value = "5" },
        [1] = { index = { "27087", "27087-27092" }, value = "0" }
    }

    if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Range):IsToggled() then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            :SetName(examples[f:GetListIndex()].index[2])
            :SetStringValue("")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value)
            :SetName("1")
            :SetStringValue("")
    else
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            :SetName(examples[f:GetListIndex()].index[1])
            :SetStringValue("")

        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value)
            :SetName(examples[f:GetListIndex()].value)
            :SetStringValue("")
    end
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.PackedStat)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Read, function(f)
    local packedStatString = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

    if packedStatString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
        return
    end

    if not packedStatString:match("^%d+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
        return
    end

    local packedStat = N(packedStatString)

    local GetValue = {
        ["int"]  = eNative.STATS.GET_PACKED_STAT_INT_CODE,
        ["bool"] = eNative.STATS.GET_PACKED_STAT_BOOL_CODE
    }

    local ftr  = eFeature.Dev.Editor.PackedStats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = GetValue[type](packedStat, eStat.MPPLY_LAST_MP_CHAR:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue(S(value))
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Write, function(f)
    local firstPStat = nil
    local lastPStat  = nil

    if not FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Range):IsToggled() then
        firstPStat = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue())
    end

    local ftr  = eFeature.Dev.Editor.PackedStats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):GetStringValue()

    if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Range):IsToggled() then
        local packedStats = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

        if packedStats == "" then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
            return
        end

        if not packedStats:match("^%d+%-%d+$") then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
            return
        end

        firstPStat, lastPStat = packedStats:match("^(%d+)%-(%d+)$")
        firstPStat = N(firstPStat)
        lastPStat  = N(lastPStat)
    end

    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end

    value = N(value)

    local GetValue = {
        ["int"]  = eNative.STATS.GET_PACKED_STAT_INT_CODE,
        ["bool"] = eNative.STATS.GET_PACKED_STAT_BOOL_CODE
    }

    TEMP_PSTAT = GetValue[type](firstPStat, eStat.MPPLY_LAST_MP_CHAR:Get())
    eFeature.Dev.Editor.PackedStats.Write.func(type, firstPStat, lastPStat, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Revert, function(f)
    local ftr  = eFeature.Dev.Editor.PackedStats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local packedStat = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue())

    if TEMP_PSTAT ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue(S(TEMP_PSTAT))
    end

    eFeature.Dev.Editor.PackedStats.Revert.func(type, packedStat)
end)

--#endregion
