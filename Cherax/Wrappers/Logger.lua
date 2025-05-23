--#region Logger

_Log = Logger.Log

function Logger.Log(color, str)
    _Log(color, SCRIPT_NAME, str)
end

function Logger.LogError(str)
    _Log(eLogColor.LIGHTRED, F("%s %s", SCRIPT_NAME, "(Error)"), str)
end

function Logger.LogInfo(str)
    _Log(eLogColor.LIGHTGREEN, F("%s %s", SCRIPT_NAME, "(Info)"), str)
end

--#endregion
