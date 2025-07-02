--#region SilentLogger

SilentLogger = {}

function SilentLogger.Log(color, str, toastPos)
    if not CONFIG or CONFIG.logging == 2 then
        Logger.Log(color, SCRIPT_NAME, str)
        GUI.AddToast(SCRIPT_NAME, CleanToast(str), 5000, toastPos or eToastPos.TOP_RIGHT)
    elseif CONFIG.logging == 1 then
        Logger.Log(color, SCRIPT_NAME, str)
    end
end

function SilentLogger.LogError(str, toastPos)
    SilentLogger.Log(eLogColor.LIGHTRED, str, toastPos)
end

function SilentLogger.LogInfo(str, toastPos)
    SilentLogger.Log(eLogColor.LIGHTGREEN, str, toastPos)
end

function CleanToast(str)
    local cleaned = str:gsub("^%[.-%]%s*", "")
    cleaned = cleaned:gsub("%s*ツ", ".")
    cleaned = cleaned:gsub("%..$", ".")
    return cleaned
end

--#endregion
