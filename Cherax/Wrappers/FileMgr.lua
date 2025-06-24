--#region FileMgr

function FileMgr.CreateConfig()
    if not FileMgr.DoesFileExist(CONFIG_DIR) then
        FileMgr.CreateDir(CONFIG_DIR)
    end

    if not FileMgr.DoesFileExist(CONFIG_PATH) then
        local config = {
            autoopen = false,
            logging  = 2,
            language = "EN",

            collab = {
                jinxscript = {
                    enabled  = true,
                    autostop = false
                }
            },

            instant_finish = {
                agency         = 1,
                apartment      = 0,
                auto_shop      = 1,
                cayo_perico    = 1,
                diamond_casino = 0,
                doomsday       = 1
            },

            unlock_all_poi = {
                cayo_perico    = true,
                diamond_casino = true
            },

            easy_money = {
                dummy_prevention = true,
                allow_300k_loop  = GTA_EDITION == "EE",

                delay = {
                    _5k   = 1.5,
                    _50k  = 0.333,
                    _100k = 0.333,
                    _180k = 0.333,
                    _300k = (GTA_EDITION == "EE") and 1.0 or 1.5,
                    _680k = 0.333,
                }
            }
        }

        Json.EncodeToFile(CONFIG_PATH, config)
    end
end

function FileMgr.SaveConfig(config)
    Json.EncodeToFile(CONFIG_PATH, config)
end

function FileMgr.ResetConfig()
    if FileMgr.DoesFileExist(CONFIG_PATH) then
        FileMgr.DeleteFile(CONFIG_PATH)
    end

    FileMgr.CreateConfig()
end

function FileMgr.EnsureConfigKeys()
    if not CONFIG then
        FileMgr.ResetConfig()
        CONFIG = Json.DecodeFromFile(CONFIG_PATH)
        SilentLogger.LogError("Config is missing. Config created ツ")
        return
    end

    local function DeepMergeDefaults(tbl, defaults)
        for k, v in pairs(defaults) do
            if type(v) == "table" then
                if type(tbl[k]) ~= "table" then
                    tbl[k] = {}
                end

                DeepMergeDefaults(tbl[k], v)
            elseif tbl[k] == nil then
                tbl[k] = v
            end
        end
    end

    local defaultConfig = {
        autoopen = false,
        logging  = 2,
        language = "EN",

        collab = {
            jinxscript = {
                enabled  = true,
                autostop = false
            }
        },

        instant_finish = {
            agency         = 1,
            apartment      = 0,
            auto_shop      = 1,
            cayo_perico    = 1,
            diamond_casino = 0,
            doomsday       = 1
        },

        unlock_all_poi = {
            cayo_perico    = true,
            diamond_casino = true
        },

        easy_money = {
            dummy_prevention = true,
            allow_300k_loop  = GTA_EDITION == "EE",
            delay = {
                _5k   = 1.5,
                _50k  = 0.333,
                _100k = 0.333,
                _180k = 0.333,
                _300k = (GTA_EDITION == "EE") and 1.0 or 1.5,
                _680k = 0.333,
            }
        }
    }

    DeepMergeDefaults(CONFIG, defaultConfig)
    FileMgr.SaveConfig(CONFIG)
end

function FileMgr.ExportTranslation(file)
    if not FileMgr.DoesFileExist(TRANS_DIR) then
        FileMgr.CreateDir(TRANS_DIR)
    end

    local path = F("%s\\%s.json", TRANS_DIR, file)

    if FileMgr.DoesFileExist(path) then
        FileMgr.DeleteFile(path)
    end

    local features = {}

    for _, hash in pairs(featureHashes) do
        local feature = FeatureMgr.GetFeatureByHash(hash)

        if feature then
            local name = feature:GetName(false)
            local desc = feature:GetDesc(false)

            if name and desc then
                local entry = {
                    name = name,
                    desc = desc
                }

                if feature:GetType() == eFeatureType.Combo then
                    local list = feature:GetList()
                    entry.list = {}

                    for _, item in ipairs(list) do
                        I(entry.list, item)
                    end
                end

                features[S(hash)] = entry
            end
        end
    end

    Json.EncodeToFile(path, features)
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

        local path = F("%s\\example.json", STATS_DIR)

        Json.EncodeToFile(path, stats)
    end
end

FileMgr.CreateConfig()

CONFIG = Json.DecodeFromFile(CONFIG_PATH)

FileMgr.EnsureConfigKeys()

--#endregion
