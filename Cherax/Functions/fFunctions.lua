function TeleportXYZ(x, y, z)
    local playerPed     = GTA.GetLocalPed()
    local playerVehicle = GTA.GetLocalVehicle()
    eNative.ENTITY.SET_ENTITY_COORDS_NO_OFFSET((playerVehicle ~= nil) and playerVehicle or playerPed, x, y, z, false, false, false)
end

function SimulatePlayerControl(action)
    eNative.PAD.ENABLE_CONTROL_ACTION(0, action, true)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, action, 1.0)
    Script.Yield(25)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, action, 1.0)
end

function SimulateFrontendControl(action)
    eNative.PAD.ENABLE_CONTROL_ACTION(2, action, true)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, action, 1.0)
    Script.Yield(25)
    eNative.PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, action, 0.0)
end

function IsInSession()
    return eNative.NETWORK.NETWORK_IS_SESSION_STARTED() and eNative.NETWORK.NETWORK_IS_SESSION_ACTIVE()
end

function IsInSessionAlone()
    return eNative.PLAYER.GET_NUMBER_OF_PLAYERS() == 1
end

function EmptySession()
    FeatureMgr.GetFeatureByName("Bail From Session"):OnClick()
end

function StartSession(sessionType)
    FeatureMgr.GetFeatureByName("Session Type"):SetListIndex(sessionType)
    FeatureMgr.GetFeatureByName("Start Session"):OnClick()
end

function IsScriptRunning(scriptName)
    return eNative.SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(Utils.Joaat(scriptName)) > 0
end

function StartScript(scriptName, stackSize)
    if not eNative.SCRIPT.DOES_SCRIPT_EXIST(scriptName) then
        return false
    end
    if IsScriptRunning(scriptName) then
        return true
    end
    eNative.SCRIPT.REQUEST_SCRIPT(scriptName)
    while not eNative.SCRIPT.HAS_SCRIPT_LOADED(scriptName) do
        Script.Yield(1)
    end
    eNative.SYSTEM.START_NEW_SCRIPT(scriptName, stackSize or 0)
    eNative.SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(scriptName)
    return true
end

function ForceScriptHost(scriptName)
    GTA.ForceScriptHost(Utils.Joaat(scriptName))
    FeatureMgr.GetFeatureByName("Force Script Host"):OnClick()
end

function SetApartmentMaxPayout(bool)
    local team       = apartmentTeam.list[FeatureMgr.GetFeatureListIndex(apartmentTeam.hash) + 1].index
    local heist      = eGlobal.Heist.Apartment.Heist.Type:Get()
    local difficulty = eGlobal.Heist.Apartment.Heist.Difficulty:Get() + 1
    local payouts    = {
        [eTable.Heist.Apartment.Heists.FleecaJob]   = { 106215, 201250,  250250  },
        [eTable.Heist.Apartment.Heists.PrisonBreak] = { 350000, 700000,  875000  },
        [eTable.Heist.Apartment.Heists.HumaneLabs]  = { 472500, 945000,  1181500 },
        [eTable.Heist.Apartment.Heists.SeriesA]     = { 353500, 707000,  883750  },
        [eTable.Heist.Apartment.Heists.PacificJob]  = { 750000, 1500000, 1875000 }
    }
    local maxPayout = 3000000
    local cuts      = {}
    for heistType, payout in pairs(payouts) do
        cuts[heistType] = {
            math.floor(maxPayout / (payout[1] / 100)),
            math.floor(maxPayout / (payout[2] / 100)),
            math.floor(maxPayout / (payout[3] / 100))
        }
    end
    if cuts[heist] == nil then
        return
    end
    for i = 1, team do
        FeatureMgr.GetFeature(apartmentPlayers[i].hash):SetIntValue(math.floor(cuts[heist][difficulty] / ((bool) and 2 or 1)))
    end
end

function SetDiamondMaxPayout()
    local team       = diamondTeam.list[FeatureMgr.GetFeatureListIndex(diamondTeam.hash) + 1].index
    local target     = eStat.MPX_H3OPT_TARGET:Get()
    local difficulty = (eStat.MPX_H3OPT_APPROACH:Get() == eStat.MPX_H3_HARD_APPROACH:Get()) and 2 or 1
    local payouts    = {
        [0] = { 2115000, 2326500 },
        [2] = { 2350000, 2585000 },
        [1] = { 2585000, 2843500 },
        [3] = { 3290000, 3619000 }
    }
    local maxPayout = 3619000
    local cuts      = {}
    for targetType, payout in pairs(payouts) do
        cuts[targetType] = {
            math.floor(maxPayout / (payout[1] / 100)),
            math.floor(maxPayout / (payout[2] / 100))
        }
    end
    if cuts[target] == nil then
        return
    end
    for i = 1, team do
        FeatureMgr.GetFeature(diamondPlayers[i].hash):SetIntValue(cuts[target][difficulty])
    end
end

function SetCayoMaxPayout()
    local team       = cayoTeam.list[FeatureMgr.GetFeatureListIndex(cayoTeam.hash) + 1].index
    local target     = eStat.MPX_H4CNF_TARGET:Get()
    local difficulty = (eStat.MPX_H4_PROGRESS:Get() == eTable.Heist.CayoPerico.Difficulties[2].index) and 2 or 1
    local payouts    = {
        [0] = { 630000,  693000  },
        [1] = { 700000,  770000  },
        [2] = { 770000,  847000  },
        [3] = { 1300000, 1430000 },
        [4] = { 1100000, 1210000 },
        [5] = { 1900000, 2090000 }
    }
    local maxPayout = 2550000
    local cuts      = {}
    for targetType, payout in pairs(payouts) do
        cuts[targetType] = {
            math.floor(maxPayout / (payout[1] / 100)),
            math.floor(maxPayout / (payout[2] / 100))
        }
    end
    if cuts[target] == nil then
        return
    end
    for i = 1, team do
        FeatureMgr.GetFeature(cayoPlayers[i].hash):SetIntValue(cuts[target][difficulty])
    end
end

function GetCardName(index)
	if index == 0 then
		return "Rolling..."
	end
	local number = math.fmod(index, 13)
	local name = ""
	local suit = ""
	if number == 1 then
		name = "A"
	elseif number == 0 then
		name = "K"
	elseif number == 12 then
		name = "Q"
	elseif number == 11 then
		name = "J"
	else
		name = tostring(number)
	end
	if index >= 1 and index <= 13 then
		suit = "Clubs"
	elseif index >= 14 and index <= 26 then
		suit = "Diam."
	elseif index >= 27 and index <= 39 then
		suit = "Hearts"
	elseif index >= 40 and index <= 52 then
		suit = "Spades"
	end
	return name .. " " .. suit
end

function GetPokerPlayersCount()
    local currentTable = eLocal.World.Casino.Poker.CurrentTable:Get()
    local table        = eLocal.World.Casino.Poker.Table.vLocal
    local tableSize    = eLocal.World.Casino.Poker.TableSize.vLocal
    local players      = 0
	for i = 0, 31 do
		local playersTable = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, table + 1 + (i * tableSize) + 2)
		if PLAYER_ID ~= i and playersTable == currentTable then
			players = players + 1
		end
	end
    return players
end

function GetPokerCards(id)
    local currentTable  = eLocal.World.Casino.Poker.CurrentTable:Get()
    local cards         = eLocal.World.Casino.Poker.Cards.vLocal
    local currentDeck   = eLocal.World.Casino.Poker.CurrentDeck.vLocal
    local antiCheat     = eLocal.World.Casino.Poker.AntiCheat.vLocal
    local antiCheatDeck = eLocal.World.Casino.Poker.AntiCheatDeck.vLocal
    local deckSize      = eLocal.World.Casino.Poker.DeckSize.vLocal
    local card1         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 1 + (id * 3))
	local card2         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 2 + (id * 3))
	local card3         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 3 + (id * 3))
    return GetCardName(card1) .. ", " .. GetCardName(card2) .. ", " .. GetCardName(card3)
end

function SetPokerCards(id, card1, card2, card3)
    local currentTable  = eLocal.World.Casino.Poker.CurrentTable:Get()
    local cards         = eLocal.World.Casino.Poker.Cards.vLocal
    local currentDeck   = eLocal.World.Casino.Poker.CurrentDeck.vLocal
    local antiCheat     = eLocal.World.Casino.Poker.AntiCheat.vLocal
    local antiCheatDeck = eLocal.World.Casino.Poker.AntiCheatDeck.vLocal
    local deckSize      = eLocal.World.Casino.Poker.DeckSize.vLocal
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 1 + (id * 3), card1)
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 2 + (id * 3), card2)
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 3 + (id * 3), card3)
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, antiCheat + antiCheatDeck + 1 + 1 + (currentTable * deckSize) + 1 + (id * 3), card1)
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, antiCheat + antiCheatDeck + 1 + 1 + (currentTable * deckSize) + 2 + (id * 3), card2)
	ScriptLocal.SetInt(eScript.World.Casino.Poker.hash, antiCheat + antiCheatDeck + 1 + 1 + (currentTable * deckSize) + 3 + (id * 3), card3)
end

function TriggerTransaction(hash)
    if eNative.NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
        eNative.NETSHOPPING.NET_GAMESERVER_BASKET_END()
    end
    local price = eNative.NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, 0x57DE404E, true)
    local valid, id = GTA.BeginService(-1135378931, 0x57DE404E, hash, 0x562592BB, price, 2)
    if valid then
        GTA.CheckoutStart(id)
    end
end

function ImGui.BeginColumns(columns)
    if ImGui.BeginTable("main", columns, ImGuiTableFlags.SizingStretchSame) then
        ImGui.TableNextRow()
        ImGui.TableSetColumnIndex(0)
        return true
    end
    return false
end

function ImGui.EndColumns()
    ImGui.EndTable()
end

function Log(message, color)
    local color = color or eLogColor.YELLOW
    Logger.Log(color, "Silent Night", message)
    GUI.AddToast("Silent Night", message, 5000, eToastPos.TOP_RIGHT)
end
