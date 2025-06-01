--#region EventMgr

logTransactions = false

function EventMgr.OnPresent()
    EventMgr.RegisterHandler(eLuaEvent.ON_PRESENT, function()
        if FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.LogTransactions) then
            if FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.LogTransactions):IsToggled() then
                logTransactions = true
                SetShouldUnload()
            end
        end
    end)
end

function EventMgr.OnUnload()
    EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
        if logTransactions then
            SilentLogger.LogError(F("«Log Transactions» is enabled. %s is unloading... ツ", SCRIPT_NAME))
        end

        SilentLogger.LogInfo(F("%s has unloaded ツ", SCRIPT_NAME))
    end)
end

EventMgr.OnPresent()

EventMgr.OnUnload()

--#endregion
