--#region EventMgr

logTransactions = false

function EventMgr.OnPresent()
    EventMgr.RegisterHandler(eLuaEvent.ON_PRESENT, function()
        if FeatureMgr.GetFeatureByName("Log Transactions") then
            if FeatureMgr.GetFeatureByName("Log Transactions"):IsToggled() then
                logTransactions = true
                SetShouldUnload()
            end
        end
    end)
end

function EventMgr.OnUnload()
    EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
        if logTransactions then
            Logger.LogError(F("Log Transactions is enabled. %s is unloading...", SCRIPT_NAME))
            GUI.AddToast(F("Log Transactions is enabled. %s is unloading...", SCRIPT_NAME))
        end

        Logger.LogInfo(F("%s has unloaded.", SCRIPT_NAME))
        GUI.AddToast(F("%s has unloaded.", SCRIPT_NAME))
    end)
end

EventMgr.OnPresent()

EventMgr.OnUnload()

--#endregion
