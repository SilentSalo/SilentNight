--#region FileMgr

function FileMgr.CreateHeistPresetsDirs()
    if not FileMgr.DoesFileExist(CAYO_DIR) then
        FileMgr.CreateDir(CAYO_DIR)
    end

    if not FileMgr.DoesFileExist(DIAMOND_DIR) then
        FileMgr.CreateDir(DIAMOND_DIR)
    end
end

function FileMgr.CreateStatsPresetsDir(generateExample)
    if not FileMgr.DoesFileExist(STATS_DIR) then
        FileMgr.CreateDir(STATS_DIR)
    end

    if generateExample then
        local stats = {
            comment = "Example stats file.",

            stats = {
                MPX_H3OPT_APPROACH = 2,
                MPX_PLAYER_MENTAL_STATE = 99.9,
                MPPLY_CHAR_IS_BADSPORT = false
            }
        }

        local path = F("%s\\%s", STATS_DIR, "example.json")

        Json.EncodeToFile(path, stats)
    end
end

--#endregion
