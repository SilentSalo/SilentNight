--#region Logger

_Log = Logger.Log

function Logger.Log(color, str)
    _Log(color, SCRIPT_NAME, str)
end

function Logger.LogError(str)
    _Log(eLogColor.LIGHTRED, F("%s (Error)", SCRIPT_NAME), str)
end

function Logger.LogInfo(str)
    _Log(eLogColor.LIGHTGREEN, F("%s (Info)", SCRIPT_NAME), str)
end

--#endregion
