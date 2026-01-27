--#region Parser

Parser = {}

function Parser.ParseTunables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.tunable then
            local hash = 0

            if type(v.tunable) == "string" then
                hash = J(v.tunable)
            elseif type(v.tunable) == "number" and v.tunable == math.floor(v.tunable) then
                hash = v.tunable
            else
                SilentLogger.LogError(F("Bad tunable! %s", S(v.tunable)))
                break
            end

            local ptr = ScriptGlobal.GetTunableByHash(hash)

            if ptr == 0 then
                SilentLogger.LogError(F("Bad tunable ptr! %s %s", S(v.tunable), S(ptr)))
                break
            end

            v.ptr = ptr

            v.Get = function(self)
                if self.type == "int" then
                    return Memory.ReadInt(self.ptr)
                elseif self.type == "float" then
                    return Memory.ReadFloat(self.ptr)
                end

                SilentLogger.LogError(F("No type for tunable! %s", S(self.tunable)))
                return nil
            end

            v.Set = function(self, value)
                if self.type == "int" then
                    Memory.WriteInt(self.ptr, value)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.ptr, value)
                else
                    SilentLogger.LogError(F("No type for tunable! %s", S(self.tunable)))
                end
            end

            v.Reset = function(self)
                if self.type == "int" then
                    Memory.WriteInt(self.ptr, self.defaultValue)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.ptr, self.defaultValue)
                else
                    SilentLogger.LogError(F("No type for tunable! %s", S(self.tunable)))
                end
            end
        elseif type(v) == "table" then
            Parser.ParseTunables(v)
        end
    end

    tbl.HAS_PARSED = true
end

function Parser.ParseGlobals(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.global then
            v.Get = function(self)
                if self.type == "int" then
                    return ScriptGlobal.GetInt(self.global)
                elseif self.type == "float" then
                    return ScriptGlobal.GetFloat(self.global)
                elseif self.type == "bool" then
                    return ScriptGlobal.GetBool(self.global)
                end
                SilentLogger.LogError(F("No type for global! %s", S(self.global)))
                return nil
            end

            v.Set = function(self, value)
                if self.type == "int" then
                    ScriptGlobal.SetInt(self.global, value)
                elseif self.type == "float" then
                    ScriptGlobal.SetFloat(self.global, value)
                elseif self.type == "bool" then
                    ScriptGlobal.SetBool(self.global, value)
                else
                    SilentLogger.LogError(F("No type for global! %s", S(self.global)))
                end
            end
        elseif type(v) == "table" then
            Parser.ParseGlobals(v)
        end
    end

    tbl.HAS_PARSED = true
end

function Parser.ParseLocals(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.vLocal then
            v.Get = function(self)
                local hash = J(self.script)

                if self.type == "int" then
                    return ScriptLocal.GetInt(hash, self.vLocal)
                elseif self.type == "float" then
                    return ScriptLocal.GetFloat(hash, self.vLocal)
                end

                SilentLogger.LogError(F("No type for local! %s", S(self.vLocal)))
                return nil
            end

            v.Set = function(self, value)
                local hash = J(self.script)

                if self.type == "int" then
                    ScriptLocal.SetInt(hash, self.vLocal, value)
                elseif self.type == "float" then
                    ScriptLocal.SetFloat(hash, self.vLocal, value)
                else
                    SilentLogger.LogError(F("No type for local! %s", S(self.vLocal)))
                end
            end
        elseif type(v) == "table" then
            Parser.ParseLocals(v)
        end
    end

    tbl.HAS_PARSED = true
end

function Parser.ParseStats(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.stat then
            local function IsStoryStat()
                return v.stat:find("SP0") or v.stat:find("SP1") or v.stat:find("SP2")
            end

            local hash = 0

            if not v.stat:find("MPPLY") and not IsStoryStat() and v.stat:sub(1, 3) ~= "MP_" then
                local _, charSlot = Stats.GetInt(J("MPPLY_LAST_MP_CHAR"))
                hash = J(F("MP%d_%s", charSlot, v.stat))
            elseif v.stat:find("MPPLY") or IsStoryStat() or v.stat:sub(1, 3) == "MP_" then
                hash = J(v.stat)
            else
                SilentLogger.LogError(F("Bad stat! %s", S(v.stat)))
                break
            end

            v.hash = hash

            v.Get = function(self)
                if self.type == "int" then
                    local _, value = Stats.GetInt(self.hash)
                    return value
                elseif self.type == "float" then
                    local _, value = Stats.GetFloat(self.hash)
                    return value
                elseif self.type == "bool" then
                    local _, value = Stats.GetBool(self.hash)
                    return value == 1
                elseif self.type == "string" then
                    local _, value = Stats.GetString(self.hash)
                    return value
                elseif self.type == "date" then
                    local _, value = Stats.GetDate(self.hash)
                    return value
                end

                SilentLogger.LogError(F("No type for stat! %s", S(self.stat)))
                return nil
            end

            v.Set = function(self, value)
                if self.type == "int" then
                    Stats.SetInt(self.hash, value)
                elseif self.type == "float" then
                    Stats.SetFloat(self.hash, value)
                elseif self.type == "bool" then
                    Stats.SetBool(self.hash, (value) and 1 or 0)
                elseif self.type == "string" then
                    Stats.SetString(self.hash, value)
                elseif self.type == "date" then
                    Stats.SetDate(self.hash, value)
                else
                    SilentLogger.LogError(F("No type for stat! %s", S(self.stat)))
                end
            end
        elseif type(v) == "table" then
            Parser.ParseStats(v)
        end
    end

    tbl.HAS_PARSED = true
end

function Parser.ParsePackedStats(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.index then
            if type(v.index) == "number" then
                v.index = { v.index }
            end

            v.Get = function(self)
                if self.index[2] then
                    return false
                end

                local _, charSlot = Stats.GetInt(J("MPPLY_LAST_MP_CHAR"))

                if self.type == "int" then
                    return eNative.STATS.GET_PACKED_STAT_INT_CODE(self.index[1], charSlot)
                elseif self.type == "bool" then
                    return eNative.STATS.GET_PACKED_STAT_BOOL_CODE(self.index[1], charSlot)
                else
                    SilentLogger.LogError(F("No type for packed stat! %s", S(self.index[1])))
                    return nil
                end
            end

            v.Set = function(self, value)
                local _, charSlot = Stats.GetInt(J("MPPLY_LAST_MP_CHAR"))

                if self.index[2] then
                    for i = self.index[1], self.index[2] do
                        if self.type == "int" then
                            eNative.STATS.SET_PACKED_STAT_INT_CODE(i, value, charSlot)
                        elseif self.type == "bool" then
                            eNative.STATS.SET_PACKED_STAT_BOOL_CODE(i, value, charSlot)
                        else
                            SilentLogger.LogError(F("No type for packed stat! %s", S(i)))
                            return nil
                        end
                    end
                else
                    if self.type == "int" then
                        eNative.STATS.SET_PACKED_STAT_INT_CODE(self.index[1], value, charSlot)
                    elseif self.type == "bool" then
                        eNative.STATS.SET_PACKED_STAT_BOOL_CODE(self.index[1], value, charSlot)
                    else
                        SilentLogger.LogError(F("No type for packed stat! %s", S(self.index[1])))
                        return nil
                    end
                end
            end
        elseif type(v) == "table" then
            Parser.ParsePackedStats(v)
        end
    end

    tbl.HAS_PARSED = true
end

function Parser.ParseTables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and #v > 0 and type(v[1]) == "table" then
            v.GetName = function(self, index)
                for _, item in ipairs(v) do
                    if item.index == index then
                        return item.name
                    end
                end
            end

            v.GetNames = function(self)
                local names = {}

                for _, item in ipairs(v) do
                    I(names, item.name)
                end

                return names
            end

            v.GetNamesRange = function(self, start, finish)
                local names = {}

                for i = start, finish do
                    if v[i] then
                        I(names, v[i].name)
                    end
                end

                return names
            end

            v.GetIndex = function(self, name)
                for _, item in ipairs(v) do
                    if item.name:lower() == name:lower() then
                        return item.index
                    end
                end
            end

            v.GetIndexes = function(self)
                local indexes = {}

                for _, item in ipairs(v) do
                    I(indexes, item.index)
                end

                return indexes
            end
        elseif type(v) == "table" then
            Parser.ParseTables(v)
        end
    end

    tbl.HAS_PARSED = true
end

Parser.ParseTunables(eTunable)
Parser.ParseGlobals(eGlobal)
Parser.ParseLocals(eLocal)
Parser.ParseStats(eStat)
Parser.ParsePackedStats(ePackedStat)
Utils.FillDynamicTables()
Parser.ParseTables(eTable)

Script.QueueJob(function()
    while not eTunable.HAS_PARSED and eGlobal.HAS_PARSED and eLocal.HAS_PARSED and eStat.HAS_PARSED and ePackedStat.HAS_PARSED and eTable.HAS_PARSED do
        Script.Yield()
    end

    SilentLogger.LogInfo(F("%s has started ツ", SCRIPT_NAME))
end)

--#endregion
