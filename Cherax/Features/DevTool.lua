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

    eFeature.Dev.Editor.Globals.Type.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Global)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Read, function(f)
    local globalString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()

    if globalString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("")
        SilentLogger.LogError("[Read (Editor)] Failed to read global. Global is empty ツ")
        return
    end

    if not globalString:match("^[%d%s%+%-*/%%%(%)]+$") or globalString:match("%d+%s+%d+") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read global. Global is invalid ツ")
        return
    end

    local global = load(F("return %s", globalString))()

    if not global then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read global. Global is invalid ツ")
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
    eFeature.Dev.Editor.Globals.Read.func()
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Globals.Write, function(f)
    local globalString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()

    if globalString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("")
        SilentLogger.LogError("[Write (Editor)] Failed to write global. Global is empty ツ")
        return
    end

    if not globalString:match("^[%d%s%+%-*/%%%(%)]+$") or globalString:match("%d+%s+%d+") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Write (Editor)] Failed to write global. Global is invalid ツ")
        return
    end

    local global = N(load(F("return %s", globalString))())

    if not global then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Write (Editor)] Failed to write global. Global is invalid ツ")
        return
    end

    local value = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):GetStringValue()

    local ftr  = eFeature.Dev.Editor.Globals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

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
    local globalString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Global):GetStringValue()

    if globalString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert global. Global is empty ツ")
        return
    end

    if not globalString:match("^[%d%s%+%-*/%%%(%)]+$") or globalString:match("%d+%s+%d+") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert global. Global is invalid ツ")
        return
    end

    local global = N(load(F("return %s", globalString))())

    if not global then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert global. Global is invalid ツ")
        return
    end

    if TEMP_GLOBAL ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Globals.Value):SetStringValue(S(TEMP_GLOBAL))
    end

    local ftr  = eFeature.Dev.Editor.Globals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

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

    eFeature.Dev.Editor.Locals.Type.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Script)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Local)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Read, function(f)
    local scriptString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local localString  = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()

    if scriptString == "" or localString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("")
        SilentLogger.LogError("[Read (Editor)] Failed to read local. Script or local is empty ツ")
        return
    end

    if not scriptString:match("^[A-Za-z_]+$") or not localString:match("^[%d%s%+%-*/%%%(%)]+$") or localString:match("%d+%s+%d+") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read local. Script or local is invalid ツ")
        return
    end

    local vLocal = N(load(F("return %s", localString))())

    if not vLocal then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read local. Local is invalid ツ")
        return
    end

    local GetValue = {
        ["int"]   = ScriptLocal.GetInt,
        ["float"] = ScriptLocal.GetFloat
    }

    local ftr  = eFeature.Dev.Editor.Locals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = GetValue[type](J(scriptString), vLocal)

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue(S(value))
    eFeature.Dev.Editor.Locals.Read.func()
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Write, function(f)
    local scriptString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local localString  = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()

    if scriptString == "" or localString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("")
        SilentLogger.LogError("[Write (Editor)] Failed to write local. Script or local is empty ツ")
        return
    end

    if not scriptString:match("^[A-Za-z_]+$") or not localString:match("^[%d%s%+%-*/%%%(%)]+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Write (Editor)] Failed to write local. Script or local is invalid ツ")
        return
    end

    local vLocal = N(load(F("return %s", localString))())

    if not vLocal then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Write (Editor)] Failed to write local. Local is invalid ツ")
        return
    end

    local GetValue = {
        ["int"]   = ScriptLocal.GetInt,
        ["float"] = ScriptLocal.GetFloat
    }

    local ftr  = eFeature.Dev.Editor.Locals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):GetStringValue())

    TEMP_LOCAL = GetValue[type](J(scriptString), vLocal)
    eFeature.Dev.Editor.Locals.Write.func(type, J(scriptString), vLocal, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Locals.Revert, function(f)
    local scriptString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Script):GetStringValue()
    local localString  = FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Local):GetStringValue()

    if scriptString == "" or localString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert local. Script or local is empty ツ")
        return
    end

    if not scriptString:match("^[A-Za-z_]+$") or not localString:match("^[%d%s%+%-*/%%%(%)]+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert local. Script or local is invalid ツ")
        return
    end

    local vLocal = N(load(F("return %s", localString))())

    if not vLocal then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert local. Local is invalid ツ")
        return
    end

    local GetValue = {
        ["int"]   = ScriptLocal.GetInt,
        ["float"] = ScriptLocal.GetFloat
    }

    if TEMP_LOCAL ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Locals.Value):SetStringValue(S(TEMP_LOCAL))
    end

    local ftr  = eFeature.Dev.Editor.Locals.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    eFeature.Dev.Editor.Locals.Revert.func(type, J(scriptString), vLocal)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.From, function(f)
    for i = 1, #devStatsDefault do
        FeatureMgr.GetFeature(devStatsDefault[i]):SetVisible((not f:IsToggled()) and true or false)
    end
    for i = 1, #devStatsFromFile do
        FeatureMgr.GetFeature(devStatsFromFile[i]):SetVisible((f:IsToggled()) and true or false)
    end
    eFeature.Dev.Editor.Stats.From.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Type, function(f)
    local examples = {
        [0] = { stat = "MPX_KILLS",                    value = "7777" },
        [1] = { stat = "MPX_PLAYER_MENTAL_STATE",      value = "99.9" },
        [2] = { stat = "MPPLY_CHAR_IS_BADSPORT",       value = "1"    },
        [3] = { stat = "MPX_HEIST_MISSION_RCONT_ID_1", value = "1"    }
    }

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat)
        :SetName(examples[f:GetListIndex()].stat)
        :SetStringValue("")

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value)
        :SetName(examples[f:GetListIndex()].value)
        :SetStringValue("")

    eFeature.Dev.Editor.Stats.Type.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Stat)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Read, function(f)
    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()

    if statString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("")
        SilentLogger.LogError("[Read (Editor)] Failed to read stat. Stat is empty ツ")
        return
    end

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    elseif statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    else
        hash = J(statString)
    end

    local GetValue = {
        ["int"]    = Stats.GetInt,
        ["float"]  = Stats.GetFloat,
        ["bool"]   = Stats.GetBool,
        ["string"] = Stats.GetString
    }

    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local success, value = GetValue[type](hash)

    if not success then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read stat. Stat isn't found ツ")
        return
    end

    if type == "bool" then
        value = (value == 1) and "true" or "false"
    end

    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue(S(value))
    eFeature.Dev.Editor.Stats.Read.func()
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Write, function(f)
    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()

    if statString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("")
        SilentLogger.LogError("[Write (Editor)] Failed to write stat. Stat is empty ツ")
        return
    end

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    elseif statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    else
        hash = J(statString)
    end

    local GetValue = {
        ["int"]    = Stats.GetInt,
        ["float"]  = Stats.GetFloat,
        ["bool"]   = Stats.GetBool,
        ["string"] = Stats.GetString
    }

    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):GetStringValue()

    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end

    value = N(value)

    local success, tempValue = GetValue[type](hash)

    if not success then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Write (Editor)] Failed to write stat. Stat isn't found ツ")
        return
    end

    TEMP_STAT = tempValue
    eFeature.Dev.Editor.Stats.Write.func(type, hash, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.Revert, function(f)
    local statString = FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Stat):GetStringValue()

    if statString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert stat. Stat is empty ツ")
        return
    end

    local function IsStoryStat()
        return statString:find("SP0") or statString:find("SP1") or statString:find("SP2")
    end

    local hash = 0

    if statString:sub(1, 3) == "MPX" then
        statString = statString:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
        hash       = J(statString)
    elseif statString:find("MPPLY") or IsStoryStat() then
        hash = J(statString)
    else
        hash = J(statString)
    end

    local GetValue = {
        ["int"]    = Stats.GetInt,
        ["float"]  = Stats.GetFloat,
        ["bool"]   = Stats.GetBool,
        ["string"] = Stats.GetString
    }

    local ftr  = eFeature.Dev.Editor.Stats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local success, value = GetValue[type](hash)

    if not success then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert stat. Stat isn't found ツ")
        return
    end

    if TEMP_STAT ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Value):SetStringValue(S(TEMP_STAT))
    end

    eFeature.Dev.Editor.Stats.Revert.func(type, hash)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.Stats.File, function(f)
    local ftr  = eFeature.Dev.Editor.Stats.File
    local file = ftr.list[f:GetListIndex() + 1].name
    eFeature.Dev.Editor.Stats.File.func(f)

    if file == "" then
        f:SetDesc("Select the desired stat file.")
        return
    end

    local json = Json.DecodeFromFile(F("%s\\%s.json", STATS_DIR, file))
    f:SetDesc(json.comment)
end)
    :SetVisible(false)

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

    eFeature.Dev.Editor.PackedStats.Range.func(f)
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

    eFeature.Dev.Editor.PackedStats.Type.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.PackedStat)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Value)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Read, function(f)
    local packedStatString = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

    if packedStatString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
        SilentLogger.LogError("[Read (Editor)] Failed to read packed stat. Packed stat is empty ツ")
        return
    end

    if not packedStatString:match("^%d+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Read (Editor)] Failed to read packed stat. Packed stat is invalid ツ")
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
    eFeature.Dev.Editor.PackedStats.Read.func()
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Write, function(f)
    local firstPStat = nil
    local lastPStat  = nil

    if not FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Range):IsToggled() then
        local packedStatString = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

        if packedStatString == "" then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
            SilentLogger.LogError("[Write (Editor)] Failed to write packed stat. Packed stat is empty ツ")
            return
        end

        if not packedStatString:match("^%d+$") then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
            SilentLogger.LogError("[Write (Editor)] Failed to write packed stat. Packed stat is invalid ツ")
            return
        end

        firstPStat = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue())
    else
        local packedStats = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

        if packedStats == "" then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
            SilentLogger.LogError("[Write (Editor)] Failed to write packed stats. Packed stats range is empty ツ")
            return
        end

        if not packedStats:match("^%d+%-%d+$") then
            FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
            SilentLogger.LogError("[Write (Editor)] Failed to write packed stats. Packed stats range is invalid ツ")
            return
        end

        firstPStat, lastPStat = packedStats:match("^(%d+)%-(%d+)$")
        firstPStat = N(firstPStat)
        lastPStat  = N(lastPStat)
    end

    local GetValue = {
        ["int"]  = eNative.STATS.GET_PACKED_STAT_INT_CODE,
        ["bool"] = eNative.STATS.GET_PACKED_STAT_BOOL_CODE
    }

    local ftr  = eFeature.Dev.Editor.PackedStats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local value = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):GetStringValue()

    if type == "bool" then
        if value == "true" or value == "1" then
            value = 1
        elseif value == "false" or value == "0" then
            value = 0
        end
    end

    value = N(value)

    TEMP_PSTAT = GetValue[type](firstPStat, eStat.MPPLY_LAST_MP_CHAR:Get())
    eFeature.Dev.Editor.PackedStats.Write.func(type, firstPStat, lastPStat, value)
end)

FeatureMgr.AddFeature(eFeature.Dev.Editor.PackedStats.Revert, function(f)
    local packedStatString = FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue()

    if packedStatString == "" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert packed stat. Packed stat is empty ツ")
        return
    end

    if not packedStatString:match("^%d+$") then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue("invalid")
        SilentLogger.LogError("[Revert (Editor)] Failed to revert packed stat. Packed stat is invalid ツ")
        return
    end

    local ftr  = eFeature.Dev.Editor.PackedStats.Type
    local type = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].name

    local packedStat = N(FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.PackedStat):GetStringValue())

    if TEMP_PSTAT ~= "TEMP" then
        FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Value):SetStringValue(S(TEMP_PSTAT))
    end

    eFeature.Dev.Editor.PackedStats.Revert.func(type, packedStat)
end)

--#endregion

--#region Stats

FeatureMgr.AddFeature(eFeature.Dev.Stats.Global.Sync)
FeatureMgr.AddFeature(eFeature.Dev.Stats.KD.Kills)
FeatureMgr.AddFeature(eFeature.Dev.Stats.KD.Deaths)

FeatureMgr.AddFeature(eFeature.Dev.Stats.KD.Apply, function(f)
    local kills  = FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Kills):GetIntValue()
    local deaths = FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Deaths):GetIntValue()
    eFeature.Dev.Stats.KD.Apply.func(kills, deaths)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Races.Wins)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Races.Losses)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Races.Apply, function(f)
    local wins   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Wins):GetIntValue()
    local losses = FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Losses):GetIntValue()
    eFeature.Dev.Stats.Races.Apply.func(wins, losses)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Time, function(f)
    if f:GetListIndex() ~= 0 then
        local ftr       = eFeature.Dev.Stats.Times.Time
        local index     = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
        local totalSecs = math.floor(index:Get() / 1000)

        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Days):SetIntValue(math.floor(totalSecs / 86400))
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Hours):SetIntValue(math.floor((totalSecs % 86400) / 3600))
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Minutes):SetIntValue(math.floor((totalSecs % 3600) / 60))
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Seconds):SetIntValue(totalSecs % 60)
    else
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Days):SetIntValue(0)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Hours):SetIntValue(0)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Minutes):SetIntValue(0)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Seconds):SetIntValue(0)
    end

    eFeature.Dev.Stats.Times.Time.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Days)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Hours)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Minutes)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Seconds)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Times.Apply, function(f)
    local ftr      = eFeature.Dev.Stats.Times.Time
    local timeStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    local days     = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Days):GetIntValue()
    local hours    = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Hours):GetIntValue()
    local minutes  = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Minutes):GetIntValue()
    local seconds  = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Seconds):GetIntValue()
    eFeature.Dev.Stats.Times.Apply.func(timeStat, days, hours, minutes, seconds)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Dates.Date, function(f)
    if f:GetListIndex() ~= 0 then
        local ftr   = eFeature.Dev.Stats.Dates.Date
        local index = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
        local date  = index:Get()

        if not date then
            date = {
                year  = 2015,
                month = 1,
                day   = 1
            }
        end

        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Year):SetIntValue(date.year or 2015)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Month):SetIntValue(date.month or 1)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Day):SetIntValue(date.day or 1)
    else
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Year):SetIntValue(2015)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Month):SetIntValue(1)
        FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Day):SetIntValue(1)
    end

    eFeature.Dev.Stats.Dates.Date.func(f)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Dates.Year)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Dates.Month)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Dates.Day)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Dates.Apply, function(f)
    local ftr      = eFeature.Dev.Stats.Dates.Date
    local dateStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    local year     = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Year):GetIntValue()
    local month    = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Month):GetIntValue()
    local day      = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Day):GetIntValue()
    eFeature.Dev.Stats.Dates.Apply.func(dateStat, year, month, day)
end)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Prostitutes.Dances)
FeatureMgr.AddFeature(eFeature.Dev.Stats.Prostitutes.Acts)

FeatureMgr.AddFeature(eFeature.Dev.Stats.Prostitutes.Apply, function(f)
    local dances = FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Dances):GetIntValue()
    local acts   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Acts):GetIntValue()
    eFeature.Dev.Stats.Prostitutes.Apply.func(dances, acts)
end)

--#endregion
