--#region GTA

_ForceScriptHost = GTA.ForceScriptHost

function GTA.TeleportXYZ(x, y, z, heading)
    local ped = GTA.GetLocalPed()
    local veh = GTA.GetLocalVehicle()

    eNative.ENTITY.SET_ENTITY_COORDS_NO_OFFSET(GTA.PointerToHandle(veh or ped), x, y, z, false, false, false)

    if heading then
        eNative.ENTITY.SET_ENTITY_HEADING(GTA.PointerToHandle(veh or ped), heading)
    end
end

function GTA.TeleportToBlip(blipSprite, heading, inside)
    local inside = inside or false
    local entity = GTA.PointerToHandle(GTA.GetLocalPed())

    eNative.ENTITY.FREEZE_ENTITY_POSITION(entity, true)

    if not inside and GTA.IsInInterior() then
        local x, y, z = U(eTable.Teleports.MazeBank)
        eNative.ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, x, y, z, false, false, false)
    end

    while eNative.HUD.GET_CLOSEST_BLIP_INFO_ID(blipSprite) == 0 do
        Script.Yield()
    end

    local x, y, z = eNative.HUD.GET_BLIP_COORDS(eNative.HUD.GET_CLOSEST_BLIP_INFO_ID(blipSprite))

    eNative.ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, x, y, z + 1.0, false, false, false)

    if heading then
        eNative.ENTITY.SET_ENTITY_HEADING(entity, heading)
    end

    eNative.ENTITY.FREEZE_ENTITY_POSITION(entity, false)
end

function GTA.SimulatePlayerControl(action)
    eNative.PAD.ENABLE_CONTROL_ACTION(0, action, true)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, action, 1.0)
    Script.Yield(25)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, action, 1.0)
end

function GTA.SimulateFrontendControl(action)
    eNative.PAD.ENABLE_CONTROL_ACTION(2, action, true)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, action, 1.0)
    Script.Yield(25)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, action, 0.0)
end

function GTA.IsInSession()
    return eNative.NETWORK.NETWORK_IS_SESSION_STARTED() and eNative.NETWORK.NETWORK_IS_SESSION_ACTIVE()
end

function GTA.IsInSessionAlone()
    return eNative.PLAYER.GET_NUMBER_OF_PLAYERS() == 1
end

function GTA.EmptySession()
    FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.BailFromSession):OnClick()
end

function GTA.StartSession(sessionType)
    FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.SessionType):SetListIndex(sessionType)
    Script.Yield(25)
    FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.StartSession):OnClick()
end

function GTA.IsInInterior()
    return eNative.INTERIOR.GET_INTERIOR_FROM_ENTITY(GTA.PointerToHandle(GTA.GetLocalPed())) ~= 0
end

function GTA.IsScriptRunning(script)
    return eNative.SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(script.hash) > 0
end

function GTA.StartScript(script)
    if not eNative.SCRIPT.DOES_SCRIPT_EXIST(script.name) then
        return false
    end

    if GTA.IsScriptRunning(script) then
        return true
    end

    eNative.SCRIPT.REQUEST_SCRIPT(script.name)

    while not eNative.SCRIPT.HAS_SCRIPT_LOADED(script.name) do
        Script.Yield()
    end

    eNative.SYSTEM.START_NEW_SCRIPT(script.name, script.stack)
    eNative.SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(script.name)

    return true
end

function GTA.ForceScriptHost(script)
    _ForceScriptHost(script.hash)
    FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.ForceScriptHost):OnClick()
end

function GTA.TriggerTransaction(hash)
    if eNative.NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
        eNative.NETSHOPPING.NET_GAMESERVER_BASKET_END()
    end

    local price = eNative.NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, 0x57DE404E, true)
    local valid, id = GTA.BeginService(-1135378931, 0x57DE404E, hash, 0x562592BB, price, 2)

    if valid then
        GTA.CheckoutStart(id)
    end
end

--#endregion
