function ParseTunables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.tunable then
            local joaat = 0
            if type(v.tunable) == "string" then
                joaat = Utils.sJoaat(v.tunable)
            elseif type(v.tunable) == "number" and v.tunable == math.floor(v.tunable) then
                joaat = v.tunable
            else
                Logger.Log(eLogColor.RED, "Silent Night", "Bad tunable! " .. v.tunable)
                break
            end
            local pointer = ScriptGlobal.GetTunableByHash(joaat)
            if pointer == 0 then
                Logger.Log(eLogColor.RED, "Silent Night", "Bad tunable pointer! " .. v.tunable .. " " .. pointer)
                break
            end
            v.pointer = pointer
            v.Get = function(self)
                if self.type == "int" then
                    return Memory.ReadInt(self.pointer)
                elseif self.type == "float" then
                    return Memory.ReadFloat(self.pointer)
                end
                Logger.Log(eLogColor.RED, "Silent Night", "No type for tunable! " .. self.tunable)
                return nil
            end
            v.Set = function(self, value)
                if self.type == "int" then
                    Memory.WriteInt(self.pointer, value)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.pointer, value)
                else
                    Logger.Log(eLogColor.RED, "Silent Night", eLogColor.RED, "Silent Night", "No type for tunable! " .. self.tunable)
                end
            end
            v.Reset = function(self)
                if self.type == "int" then
                    Memory.WriteInt(self.pointer, self.defaultValue)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.pointer, self.defaultValue)
                else
                    Logger.Log(eLogColor.RED, "Silent Night", eLogColor.RED, "Silent Night", "No type for tunable! " .. self.tunable)
                end
            end
        elseif type(v) == "table" then
            ParseTunables(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseGlobals(tbl)
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
                Logger.Log(eLogColor.RED, "Silent Night", eLogColor.RED, "Silent Night", "No type for global! " .. self.global)
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
                    Logger.Log(eLogColor.RED, "Silent Night", "No type for global! " .. self.global)
                end
            end
        elseif type(v) == "table" then
            ParseGlobals(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseLocals(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.vLocal then
            v.Get = function(self)
                local scriptHash = Utils.sJoaat(self.script)
                if self.type == "int" then
                    return ScriptLocal.GetInt(scriptHash, self.vLocal)
                elseif self.type == "float" then
                    return ScriptLocal.GetFloat(scriptHash, self.vLocal)
                end
                Logger.Log(eLogColor.RED, "Silent Night", "No type for local! ", self.vLocal)
                return nil
            end
            v.Set = function(self, value)
                local scriptHash = Utils.sJoaat(self.script)
                if self.type == "int" then
                    ScriptLocal.SetInt(scriptHash, self.vLocal, value)
                elseif self.type == "float" then
                    ScriptLocal.SetFloat(scriptHash, self.vLocal, value)
                else
                    Logger.Log(eLogColor.RED, "Silent Night", "No type for local! " .. self.vLocal)
                end
            end
        elseif type(v) == "table" then
            ParseLocals(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseStats(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.stat then
            local function IsStoryStat()
                return v.stat:find("SP0") or v.stat:find("SP1") or v.stat:find("SP2")
            end
            local hash = 0
            if not v.stat:find("MPPLY") and not IsStoryStat() then
                local _, charSlot = Stats.GetInt(Utils.sJoaat("MPPLY_LAST_MP_CHAR"))
                hash = Utils.sJoaat(string.format("MP%d_", charSlot) .. v.stat)
            elseif v.stat:find("MPPLY") or IsStoryStat() then
                hash = Utils.sJoaat(v.stat)
            else
                Logger.Log(eLogColor.RED, "Silent Night", "Bad stat! " .. v.stat)
                break
            end
            v.hash = hash
            v.Get = function(self)
                if self.type == "int" then
                    local _, statValue = Stats.GetInt(self.hash)
                    return statValue
                elseif self.type == "float" then
                    local _, statValue = Stats.GetFloat(self.hash)
                    return statValue
                elseif self.type == "bool" then
                    local _, statValue = Stats.GetBool(self.hash)
                    return statValue
                end
                Logger.Log(eLogColor.RED, "Silent Night", "No type for stat! " .. self.stat)
                return nil
            end
            v.Set = function(self, value)
                if self.type == "int" then
                    Stats.SetInt(self.hash, value)
                elseif self.type == "float" then
                    Stats.SetFloat(self.hash, value)
                elseif self.type == "bool" then
                    Stats.SetBool(self.hash, value)
                else
                    Logger.Log(eLogColor.RED, "Silent Night", "No type for stat! " .. self.stat)
                end
            end
        elseif type(v) == "table" then
            ParseStats(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParsePackedBools(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v[1] then
            v.Set = function(self, value)
                local _, charSlot = Stats.GetInt(Utils.sJoaat("MPPLY_LAST_MP_CHAR"))
                if v[2] then
                    for i = v[1], v[2] do
                        eNative.STATS.SET_PACKED_STAT_BOOL_CODE(i, value, charSlot)
                    end
                else
                    eNative.STATS.SET_PACKED_STAT_BOOL_CODE(v[1], value, charSlot)
                end
            end
        elseif type(v) == "table" then
            ParsePackedBools(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseTables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and #v > 0 and type(v[1]) == "table" then
            v.GetNames = function(self)
                local names = {}
                for _, item in ipairs(v) do
                    table.insert(names, item.name)
                end
                return names
            end
            v.GetNamesRange = function(self, start, finish)
                local names = {}
                for i = start, finish do
                    if v[i] then
                        table.insert(names, v[i].name)
                    end
                end
                return names
            end
            v.GetIndexes = function(self)
                local indexes = {}
                for _, item in ipairs(v) do
                    table.insert(indexes, item.index)
                end
                return indexes
            end
        elseif type(v) == "table" then
            ParseTables(v)
        end
    end
    tbl.HAS_PARSED = true
end

function FillDynamicTbls()
    for i = #eTable.Business.Supplies, 1, -1 do
        table.remove(eTable.Business.Supplies, i)
    end
    local businesses = {
        { name = "Cash Factory",   ids = { 4,  9, 14, 19 } },
        { name = "Cocaine Lock.",  ids = { 3,  8, 13, 18 } },
        { name = "Weed Farm",      ids = { 2,  7, 12, 17 } },
        { name = "Meth Lab",       ids = { 1,  6, 11, 16 } },
        { name = "Document For.", ids = { 5, 10, 15, 20 } }
    }
    for i = 0, 4 do
        local slot = eStat["MPX_FACTORYSLOT" .. i]:Get()
        if slot > 0 then
            for _, business in ipairs(businesses) do
                for _, id in ipairs(business.ids) do
                    if slot == id then
                        table.insert(eTable.Business.Supplies, { name = business.name, index = i })
                        break
                    end
                end
            end
        end
    end
    if eStat.MPX_FACTORYSLOT5:Get() > 0 then
        table.insert(eTable.Business.Supplies, { name = "Bunker", index = 5 })
    end
    if eStat.MPX_XM22_LAB_OWNED:Get() ~= -1 and eStat.MPX_XM22_LAB_OWNED:Get() ~= 0 then
        table.insert(eTable.Business.Supplies, { name = "Acid Lab", index = 6 })
    end
    if #eTable.Business.Supplies == 0 then
        table.insert(eTable.Business.Supplies, { name = "None", index = -1 })
    else
        table.insert(eTable.Business.Supplies, 1, { name = "All", index = 7 })
    end
end

ParseTunables(eTunable)
ParseGlobals(eGlobal)
ParseLocals(eLocal)
ParseStats(eStat)
ParsePackedBools(ePackedBool)
FillDynamicTbls()
ParseTables(eTable)

Script.QueueJob(function()
    while not eTunable.HAS_PARSED and eGlobal.HAS_PARSED and eLocal.HAS_PARSED and eStat.HAS_PARSED and ePackedBool.HAS_PARSED and eTable.HAS_PARSED do
        Script.Yield(1)
    end
    Logger.Log(eLogColor.GREEN, "Silent Night", "Script has started")
    GUI.AddToast("Silent Night", "Script has started", 5000, eToastPos.TOP_RIGHT)
end)
