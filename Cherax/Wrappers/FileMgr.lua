--#region FileMgr

function FileMgr.CreateConfig()
    if not FileMgr.DoesFileExist(CONFIG_DIR) then
        FileMgr.CreateDir(CONFIG_DIR)
        Logger.LogInfo("Created config directory.")
    end

    local path = F("%s\\config.json", CONFIG_DIR)

    if not FileMgr.DoesFileExist(path) then
        local config = {
            instant_finish = {
                agency         = 1,
                apartment      = 0,
                auto_shop      = 1,
                cayo_perico    = 1,
                diamond_casino = 0,
                doomsday       = 1
            },

            easy_money = {
                dummy_prevention = true,

                delay = {
                    _5k   = 1.5,
                    _50k  = 0.333,
                    _100k = 0.333,
                    _180k = 0.333,
                    _300k = 1.0
                }
            }
        }

        Json.EncodeToFile(path, config)
        return
    end
end

function FileMgr.SaveConfig(config)
    Json.EncodeToFile(F("%s\\config.json", CONFIG_DIR), config)
end

function FileMgr.ResetConfig()
    local path = F("%s\\config.json", CONFIG_DIR)

    if FileMgr.DoesFileExist(path) then
        FileMgr.DeleteFile(path)
    end

    FileMgr.CreateConfig()
end

function FileMgr.CreateHeistPresetsDirs()
    if not FileMgr.DoesFileExist(CAYO_DIR) then
        FileMgr.CreateDir(CAYO_DIR)
    end

    if not FileMgr.DoesFileExist(DIAMOND_DIR) then
        FileMgr.CreateDir(DIAMOND_DIR)
    end
end

function FileMgr.CreateStatsDir(generateExample)
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

FileMgr.CreateConfig()

CONFIG = Json.DecodeFromFile(F("%s\\config.json", CONFIG_DIR))

--#endregion
