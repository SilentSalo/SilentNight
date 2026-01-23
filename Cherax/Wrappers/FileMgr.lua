--#region FileMgr

DEFAULT_CONFIG = {
    autoopen           = false,
    compatibility_mode = true,
    logging            = 2,
    language           = "EN",

    collab = {
        jinxscript = {
            enabled  = false,
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

    register_as_boss = {
        autoregister = false,
        type         = 0
    },

    easy_money = {
        acknowledge      = false,
        autodeposit      = false,
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

function FileMgr.CreateConfig()
    if not FileMgr.DoesFileExist(CONFIG_DIR) then
        FileMgr.CreateDir(CONFIG_DIR)
    end

    if not FileMgr.DoesFileExist(CONFIG_PATH) then
        Json.EncodeToFile(CONFIG_PATH, DEFAULT_CONFIG)
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
    if type(CONFIG) ~= "table" then
        FileMgr.ResetConfig()

        local cfg, err = Json.DecodeFromFile(CONFIG_PATH)

        if type(cfg) ~= "table" then
            SilentLogger.LogError("Config is invalid. Default config loaded ツ")
            CONFIG = DEFAULT_CONFIG
            FileMgr.SaveConfig(CONFIG)
            return
        end

        CONFIG = cfg
        SilentLogger.LogError("Config is missing. Default config created ツ")
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

    DeepMergeDefaults(CONFIG, DEFAULT_CONFIG)
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

                if feature:GetType() == eFeatureType.Combo and hash ~= eTable.SilentNight.Features.Language then
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
    if not FileMgr.DoesFileExist(APART_DIR) then
        FileMgr.CreateDir(APART_DIR)
    end

    if not FileMgr.DoesFileExist(CAYO_DIR) then
        FileMgr.CreateDir(CAYO_DIR)
    end

    if not FileMgr.DoesFileExist(DIAMOND_DIR) then
        FileMgr.CreateDir(DIAMOND_DIR)
    end

    if not FileMgr.DoesFileExist(DDAY_DIR) then
        FileMgr.CreateDir(DDAY_DIR)
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

loggedAcknowledgment  = CONFIG.easy_money.acknowledge
loggedAutoOpen        = CONFIG.autoopen
loggedCompatibility   = CONFIG.compatibility_mode
loggedJinxScript      = CONFIG.collab.jinxscript.enabled
loggedJinxScriptStop  = CONFIG.collab.jinxscript.autostop
loggedUCayoPerico     = CONFIG.unlock_all_poi.cayo_perico
loggedUDiamondCasino  = CONFIG.unlock_all_poi.diamond_casino
loggedAutoRegister    = CONFIG.register_as_boss.autoregister
loggedAutoDeposit     = CONFIG.easy_money.autodeposit
loggedDummyPrevention = CONFIG.easy_money.dummy_prevention
loggedAllow300kLoop   = CONFIG.easy_money.allow_300k_loop

--#endregion
