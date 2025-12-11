--#region Run Script

local folders = { "Features", "Functions", "Tables", "Variables", "Wrappers" }

local files = {
    "Startup",
    "Shortcuts",
    "Generic",
    "SilentLogger",
    "Natives",
    "Stats",
    "eTunable",
    "eGlobal",
    "eLocal",
    "eStat",
    "ePackedStat",
    "eTable",
    "eNative",
    "eScript",
    "Utils",
    "Parser",
    "Helper",
    "eFeature",
    "Features",
    "ClickGUI",
    "Tab",
    "EventMgr",
    "FeatureMgr",
    "Bits",
    "Json",
    "FileMgr",
    "GTA",
    "ImGui",
    "HeistTool",
    "BusinessTool",
    "MoneyTool",
    "DevTool",
    "Settings",
    "Script",
    "Renderer"
}

local function RunScript()
    local root = string.format("%s\\Lua\\SilentNight", FileMgr.GetMenuRootPath())
    local missingFiles = {}
    local filePaths = {}

    for _, file in ipairs(files) do
        local found = false

        for _, folder in ipairs(folders) do
            local filePath = string.format("%s\\%s\\%s.lua", root, folder, file)

            if FileMgr.DoesFileExist(filePath) then
                found = true
                filePaths[#filePaths + 1] = filePath
                break
            end
        end

        if not found then
            missingFiles[#missingFiles + 1] = file
        end
    end

    if #missingFiles > 0 then
        Logger.Log(eLogColor.LIGHTRED, "Silent Night", "Couldn't start Silent Night. Some files are missing ツ")

        for _, file in ipairs(missingFiles) do
            Logger.Log(eLogColor.LIGHTRED, "Silent Night", string.format("File not found: %s.lua", file))
        end

        GUI.AddToast("Silent Night", "Couldn't start Silent Night. Some files are missing.", 5000, eToastPos.TOP_RIGHT)

        if FileMgr.DoesFileExist(string.format("%s\\sha.txt", root)) then
            FileMgr.DeleteFile(string.format("%s\\sha.txt", root))
            Logger.Log(eLogColor.LIGHTGREEN, "Silent Night", "Restart Silent Night to start redownloading process ツ")
            GUI.AddToast("Silent Night", "Restart Silent Night to start redownloading process.", 5000, eToastPos.TOP_RIGHT)
        end

        SetShouldUnload()
        return
    end

    for _, filePath in ipairs(filePaths) do
        dofile(filePath)
    end
end

RunScript()

--#endregion
