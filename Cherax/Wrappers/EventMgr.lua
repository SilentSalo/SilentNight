--#region EventMgr

local onPresentEventId       = nil
local onUnloadEventId        = nil
local eventProtectionEnabled = false

function EventMgr.OnPresent()
    onPresentEventId = EventMgr.RegisterHandler(eLuaEvent.ON_PRESENT, function()
        if FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):IsToggled() then
            eventProtectionEnabled = true
        end

        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):Toggle(false)
    end)
end

function EventMgr.OnUnload()
    onUnloadEventId = EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
        EventMgr.RemoveHandler(onPresentEventId)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):Toggle(eventProtectionEnabled)
        SilentLogger.LogInfo(F("%s has unloaded ツ", SCRIPT_NAME))
    end)
end

EventMgr.OnUnload()
EventMgr.OnPresent()

--#endregion
