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

                delay = {
                    _5k   = 1.5,
                    _50k  = 0.333,
                    _100k = 0.333,
                    _180k = 0.333,
                    _300k = 1.0
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
        SilentLogger.LogError("Config is missing something. Config reset ツ")
        return
    end

    local required         = { "autoopen", "logging", "language", "collab", "instant_finish", "unlock_all_poi", "easy_money" }
    local required_collab  = { "jinxscript" }
    local required_jinx    = { "enabled", "autostop" }
    local required_instant = { "agency", "apartment", "auto_shop", "cayo_perico", "diamond_casino", "doomsday" }
    local required_unlock  = { "cayo_perico", "diamond_casino" }
    local required_easy    = { "dummy_prevention", "delay" }
    local required_delay   = { "_5k", "_50k", "_100k", "_180k", "_300k" }

    local function HasKeys(tbl, keys)
        if type(tbl) ~= "table" then return false end

        for _, k in ipairs(keys) do
            if not tbl or tbl[k] == nil then return false end
        end

        return true
    end

    local missing = false

    if not HasKeys(CONFIG, required) then
        missing = true
    end

    if not HasKeys(CONFIG.collab, required_collab) then
        missing = true
    end

    if not HasKeys(CONFIG.collab.jinxscript, required_jinx) then
        missing = true
    end

    if not HasKeys(CONFIG.instant_finish, required_instant) then
        missing = true
    end

    if not HasKeys(CONFIG.unlock_all_poi, required_unlock) then
        missing = true
    end

    if not HasKeys(CONFIG.easy_money, required_easy) then
        missing = true
    end

    if not HasKeys(CONFIG.easy_money.delay, required_delay) then
        missing = true
    end

    if missing then
        FileMgr.ResetConfig()
        CONFIG = Json.DecodeFromFile(CONFIG_PATH)
        SilentLogger.LogError("Config is missing something. Config reset ツ")
    end
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
