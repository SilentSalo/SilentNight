--#region Utils

function Utils.ClearTable(tbl)
    for i = #tbl, 1, -1 do
        table.remove(tbl, i)
    end
end

function Utils.FillDynamicTables()
    -- eTable.Heist.CayoPerico.Files
    Utils.ClearTable(eTable.Heist.CayoPerico.Files)

    if FileMgr.DoesFileExist(CAYO_DIR) then
        local files = FileMgr.FindFiles(CAYO_DIR, ".json", true)

        for i, file in ipairs(files) do
            local fileName = string.match(file, "[^\\]+$"):gsub(".json", "")
            I(eTable.Heist.CayoPerico.Files, { name = fileName, index = i })
        end
    end

    if #eTable.Heist.CayoPerico.Files == 0 then
        I(eTable.Heist.CayoPerico.Files, { name = "", index = -1 })
    end

    -- eTable.Heist.DiamondCasino.Files
    Utils.ClearTable(eTable.Heist.DiamondCasino.Files)

    if FileMgr.DoesFileExist(DIAMOND_DIR) then
        local files = FileMgr.FindFiles(DIAMOND_DIR, ".json", true)

        for i, file in ipairs(files) do
            local fileName = string.match(file, "[^\\]+$"):gsub(".json", "")
            I(eTable.Heist.DiamondCasino.Files, { name = fileName, index = i })
        end
    end

    if #eTable.Heist.DiamondCasino.Files == 0 then
        I(eTable.Heist.DiamondCasino.Files, { name = "", index = -1 })
    end

    -- eTable.Editor.Stats.Files
    Utils.ClearTable(eTable.Editor.Stats.Files)

    if FileMgr.DoesFileExist(STATS_DIR) then
        local files = FileMgr.FindFiles(STATS_DIR, ".json", true)

        for i, file in ipairs(files) do
            local fileName = string.match(file, "[^\\]+$"):gsub(".json", "")
            I(eTable.Editor.Stats.Files, { name = fileName, index = i })
        end
    end
    if #eTable.Editor.Stats.Files == 0 then
        I(eTable.Editor.Stats.Files, { name = "", index = -1 })
    end

    -- eTable.Business.Supplies
    Utils.ClearTable(eTable.Business.Supplies)

    local businesses = {
        { name = "Cash Factory",  ids = { 4,  9, 14, 19 } },
        { name = "Cocaine Lock.", ids = { 3,  8, 13, 18 } },
        { name = "Weed Farm",     ids = { 2,  7, 12, 17 } },
        { name = "Meth Lab",      ids = { 1,  6, 11, 16 } },
        { name = "Document For.", ids = { 5, 10, 15, 20 } }
    }

    for i = 0, 4 do
        local slot = eStat["MPX_FACTORYSLOT" .. i]:Get()

        if slot > 0 then
            for _, business in ipairs(businesses) do
                for _, id in ipairs(business.ids) do
                    if slot == id then
                        I(eTable.Business.Supplies, { name = business.name, index = i })
                        break
                    end
                end
            end
        end
    end

    if eStat.MPX_FACTORYSLOT5:Get() > 0 then
        I(eTable.Business.Supplies, { name = "Bunker", index = 5 })
    end

    if eStat.MPX_XM22_LAB_OWNED:Get() ~= -1 and eStat.MPX_XM22_LAB_OWNED:Get() ~= 0 then
        I(eTable.Business.Supplies, { name = "Acid Lab", index = 6 })
    end

    if #eTable.Business.Supplies == 0 then
        I(eTable.Business.Supplies, { name = "None", index = -1 })
    else
        I(eTable.Business.Supplies, 1, { name = "All", index = 7 })
    end
end

--#endregion
