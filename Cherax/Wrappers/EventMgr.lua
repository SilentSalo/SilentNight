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

        local root = ListGUI.GetRootTab()
        if not root then return end

        local luaTab = root:GetSubTab("Lua")
        if not luaTab then return end

        local scriptTab = luaTab:GetSubTab(F("%s v%s %s", SCRIPT_NAME, SCRIPT_VER, GTA_EDITION))
        if not scriptTab then return end

        luaTab:RemoveSubTab(scriptTab)
    end)
end

EventMgr.OnUnload()
EventMgr.OnPresent()

--#endregion
