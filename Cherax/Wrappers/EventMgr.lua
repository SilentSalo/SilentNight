--#region EventMgr

function EventMgr.OnUnload()
    EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
        SilentLogger.LogInfo(F("%s has unloaded ツ", SCRIPT_NAME))
    end)
end

EventMgr.OnUnload()

--#endregion
