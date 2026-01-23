--#region EventMgr

local onPresentEventId       = nil
local onUnloadEventId        = nil
local friendsWhitelisted     = true
local teamWhitelisted        = true
local eventProtectionEnabled = false

function EventMgr.OnPresent()
    onPresentEventId = EventMgr.RegisterHandler(eLuaEvent.ON_PRESENT, function()
        if not FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):IsListIndexToggled(0) then
            friendsWhitelisted = false
        end

        if not FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):IsListIndexToggled(1) then
            teamWhitelisted = false
        end

        if FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):IsToggled() then
            eventProtectionEnabled = true
        end

        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):ToggleListIndex(0, true)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):ToggleListIndex(1, true)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):Toggle(false)
    end)
end

function EventMgr.OnUnload()
    onUnloadEventId = EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
        EventMgr.RemoveHandler(onPresentEventId)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):ToggleListIndex(0, friendsWhitelisted)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ProtectionWhitelist):ToggleListIndex(1, teamWhitelisted)
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.EventProtection):Toggle(eventProtectionEnabled)
        SilentLogger.LogInfo(F("%s has unloaded ツ", SCRIPT_NAME))

        local rootTab = ListGUI.GetRootTab()
        if not rootTab then return end

        local scriptTab = rootTab:GetSubTab(F("%s v%s %s", SCRIPT_NAME, SCRIPT_VER, GTA_EDITION))
        if not scriptTab then return end

        rootTab:RemoveSubTab(scriptTab)
    end)
end

EventMgr.OnUnload()
EventMgr.OnPresent()

--#endregion
