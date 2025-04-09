local folders = { "Features", "Functions", "Tables", "Variables" }
local files   = {
    "vVariables",
    "eNative",
    "eTunable",
    "eGlobal_EE",
    "eGlobal_LE",
    "eLocal_EE",
    "eLocal_LE",
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
    "dEditor",
    "sSettings",
    "fFunctions",
    "fRegisterLooped_EE",
    "fRegisterLooped_LE",
    "fEvents",
    "fRender"
}

local function RunScript()
    local root       = string.format("%s\\Lua\\SilentNight", FileMgr.GetMenuRootPath())
    local gtaEdition = Cherax.GetEdition()
    
    for _, file in ipairs(files) do
        local found   = false
        local skipped = false

        for _, folder in ipairs(folders) do
            if (gtaEdition == "EE" and file:find("_LE")) or (gtaEdition == "LE" and file:find("_EE")) then
                skipped = true
                break
            end

            local filePath   = string.format("%s\\%s\\%s.lua", root, folder, file)
            local fileHandle = io.open(filePath, "r")
            if fileHandle then
                fileHandle:close()
                dofile(filePath)
                found = true
                break
            end
        end

        if not found and not skipped then
            Logger.Log(eLogColor.RED, "Silent Night", string.format("File not found: %s", file))
        end
    end
end

RunScript()
