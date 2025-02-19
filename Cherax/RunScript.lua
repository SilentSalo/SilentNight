local folders = { "Features", "Functions", "Tables", "Variables" }
local files   = {
    "vVariables",
    "eNative",
    "eTunable",
    "eGlobal",
    "eLocal",
    "eScript",
    "eStat",
    "ePackedBool",
    "eTable",
    "eFeature",
    "fParse",
    "vFeatures",
    "hGeneric",
    "hAgency",
    "hApartment",
    "hAutoShop",
    "hCayoPerico",
    "hDiamondCasino",
    "hDoomsday",
    "hSalvageYard",
    "mBunker",
    "mCasino",
    "mHangar",
    "mNightclub",
    "mSpecialCargo",
    "mEasyMoney",
    "mMisc",
    "fFunctions",
    "fRegisterLooped",
    "fEvents",
    "fRender"
}

local function RunScript()
    local root = string.format("%s\\Lua\\SilentNight", FileMgr.GetMenuRootPath())
    for _, file in ipairs(files) do
        local found = false
        for _, folder in ipairs(folders) do
            local filePath = string.format("%s\\%s\\%s.lua", root, folder, file)
            local fileHandle = io.open(filePath, "r")
            if fileHandle then
                fileHandle:close()
                dofile(filePath)
                found = true
                break
            end
        end
        if not found then
            Logger.Log(eLogColor.RED, "Silent Night", string.format("File not found: %s", file))
        end
    end
end

RunScript()
