--#region SilentLogger

SilentLogger = {}

function SilentLogger.Log(color, str, toastPos)
    if CONFIG.logging == 0 then
        return
    elseif CONFIG.logging == 1 then
        Logger.Log(color, str)
    elseif CONFIG.logging == 2 or not CONFIG then
        Logger.Log(color, str)
        GUI.AddToast(str, toastPos)
    end
end

function SilentLogger.LogError(str, toastPos)
    if CONFIG.logging == 0 then
        return
    elseif CONFIG.logging == 1 then
        Logger.LogError(str)
    elseif CONFIG.logging == 2 or not CONFIG then
        Logger.LogError(str)
        GUI.AddToast(str, toastPos)
    end
end

function SilentLogger.LogInfo(str, toastPos)
    if CONFIG.logging == 0 then
        return
    elseif CONFIG.logging == 1 then
        Logger.LogInfo(str)
    elseif CONFIG.logging == 2 or not CONFIG then
        Logger.LogInfo(str)
        GUI.AddToast(str, toastPos)
    end
end

--#endregion