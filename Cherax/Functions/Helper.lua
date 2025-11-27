--#region Helper

Helper = {}

function Helper.NewInstantFinishHeist()
    if GTA.IsScriptRunning(eScript.Heist.Old) then
        GTA.ForceScriptHost(eScript.Heist.Old)
        Script.Yield(1000)

        eLocal.Heist.Generic.Finish.Old.Step1:Set(5)
        eLocal.Heist.Generic.Finish.Old.Step2:Set(999999)

        local value = Bits.SetBits(eLocal.Heist.Generic.Finish.Old.Step3:Get(), { 9, 16 })
        eLocal.Heist.Generic.Finish.Old.Step3:Set(value)
    elseif GTA.IsScriptRunning(eScript.Heist.New) then
        GTA.ForceScriptHost(eScript.Heist.New)
        Script.Yield(1000)

        eLocal.Heist.Generic.Finish.New.Step1:Set(5)
        eLocal.Heist.Generic.Finish.New.Step2:Set(999999)

        local value = Bits.SetBits(eLocal.Heist.Generic.Finish.New.Step3:Get(), { 9, 16 })
        eLocal.Heist.Generic.Finish.New.Step3:Set(value)
    end
end

function Helper.SetApartmentMaxPayout(bool)
    local heist      = eStat.HEIST_MISSION_RCONT_ID_1:Get()
    local difficulty = eGlobal.Heist.Generic.Difficulty:Get() + 1

    local payouts = {
        [eTable.Heist.Apartment.Heists.FleecaJob]   = { 100625, 201250,  251563  },
        [eTable.Heist.Apartment.Heists.PrisonBreak] = { 350000, 700000,  875000  },
        [eTable.Heist.Apartment.Heists.HumaneLabs]  = { 472500, 945000,  1181250 },
        [eTable.Heist.Apartment.Heists.SeriesA]     = { 353500, 707000,  883750  },
        [eTable.Heist.Apartment.Heists.PacificJob]  = { 750000, 1500000, 1875000 }
    }

    if payouts[heist] == nil then return end

    local payout    = payouts[heist][difficulty]
    local maxPayout = 3000000
    local cut       = math.floor(maxPayout / (payout / 100) / ((bool) and 2 or 1))

    for i = 1, #apartmentPlayers.Cuts do
        FeatureMgr.GetFeature(apartmentPlayers.Cuts[i]):SetIntValue(cut)
    end
end

function Helper.SetCayoMaxPayout()
    local target     = eStat.MPX_H4CNF_TARGET:Get()
    local difficulty = (eStat.MPX_H4_PROGRESS:Get() == eTable.Heist.CayoPerico.Difficulties[2].index) and 2 or 1

    local payouts = {
        [0] = { 630000,  693000  },
        [1] = { 700000,  770000  },
        [2] = { 770000,  847000  },
        [3] = { 1300000, 1430000 },
        [4] = { 1100000, 1210000 },
        [5] = { 1900000, 2090000 }
    }

    if payouts[target] == nil then return end

    local payout      = payouts[target][difficulty]
    local maxPayout   = 2550000
    local cut         = math.floor(maxPayout / (payout / 100))
    local finalPayout = math.floor(payout * (cut / 100))
    local difference  = 1000
    local pavelCut    = 0.02
    local fencingCut  = 0.1
    local foundCut    = false

    while not foundCut do
        local pavelFee   = math.floor(finalPayout * pavelCut)
        local fencingFee = math.floor(finalPayout * fencingCut)
        local feePayout  = finalPayout - (pavelFee + fencingFee)

        if feePayout >= maxPayout - difference and feePayout <= maxPayout then
            foundCut = true
        else
            cut = cut + 1
            finalPayout = math.floor(payout * (cut / 100))

            if cut > 500 then
                cut         = math.floor(maxPayout / (payout / 100))
                finalPayout = math.floor(payout * (cut / 100))
                difference  = difference + 1000
            end
        end
    end

    for i = 1, #cayoPlayers.Cuts do
        FeatureMgr.GetFeature(cayoPlayers.Cuts[i]):SetIntValue(cut)
    end
end

function Helper.SetDiamondMaxPayout()
    eTunable.Heist.DiamondCasino.Buyer.Low:Set(1.0)
    eTunable.Heist.DiamondCasino.Buyer.Mid:Set(1.0)
    eTunable.Heist.DiamondCasino.Buyer.High:Set(1.0)

    local difficulty = (eStat.MPX_H3OPT_APPROACH:Get() == eStat.MPX_H3_HARD_APPROACH:Get()) and 2 or 1
    local target     = eStat.MPX_H3OPT_TARGET:Get()

    local payouts = {
        [0] = { 2115000, 2326500 },
        [2] = { 2350000, 2585000 },
        [1] = { 2585000, 2843500 },
        [3] = { 3290000, 3619000 }
    }

    if payouts[target] == nil then return end

    local payout    = payouts[target][difficulty] + 819000
    local maxPayout = 3619000
    local cut       = math.floor(maxPayout / (payout / 100))

    FeatureMgr.GetFeature(diamondPlayers.Cuts[1]):SetIntValue(cut)

    local gunman    = eStat.MPX_H3OPT_CREWWEAP:Get()
    local driver    = eStat.MPX_H3OPT_CREWDRIVER:Get()
    local hacker    = eStat.MPX_H3OPT_CREWHACKER:Get()
    local buyerFee  = 0.1
    local lesterCut = 0.05

    local gunmanCuts = {
        [1] = 0.05,
        [3] = 0.07,
        [5] = 0.08,
        [2] = 0.09,
        [4] = 0.1
    }

    local driverCuts = {
        [1] = 0.05,
        [4] = 0.06,
        [2] = 0.07,
        [3] = 0.09,
        [5] = 0.1
    }

    local hackerCuts = {
        [1] = 0.03,
        [3] = 0.05,
        [2] = 0.07,
        [5] = 0.09,
        [4] = 0.1
    }

    local feePayout    = payout - (payout * buyerFee)
    local lesterPayout = feePayout * lesterCut
    local gunmanPayout = feePayout * gunmanCuts[gunman]
    local driverPayout = feePayout * driverCuts[driver]
    local hackerPayout = feePayout * hackerCuts[hacker]
    local crewPayout   = lesterPayout + gunmanPayout + driverPayout + hackerPayout
    local cut          = math.floor(maxPayout / ((feePayout - crewPayout) / 100))

    for i = 2, #diamondPlayers.Cuts do
        FeatureMgr.GetFeature(diamondPlayers.Cuts[i]):SetIntValue(cut)
    end
end

function Helper.SetDoomsdayMaxPayout()
    local heist      = eStat.MPX_GANGOPS_FLOW_MISSION_PROG:Get()
    local difficulty = eGlobal.Heist.Generic.Difficulty:Get()

    local payouts = {
        [eTable.Heist.Doomsday.Heists.Data]     = { 975000,  1218750 },
        [eTable.Heist.Doomsday.Heists.Bogdan]   = { 1425000, 1771250 },
        [eTable.Heist.Doomsday.Heists.Doomsday] = { 1800000, 2250000 }
    }

    if payouts[heist] == nil then return end
    if difficulty == 0 then difficulty = 1 end

    local payout    = payouts[heist][difficulty]
    local maxPayout = 2550000
    local cut       = math.floor(maxPayout / (payout / 100))

    for i = 1, #doomsdayPlayers.Cuts do
        FeatureMgr.GetFeature(doomsdayPlayers.Cuts[i]):SetIntValue(cut)
    end
end

function Helper.ApplyApartmentPreset(preps)
    local temp     = CONFIG.logging
    CONFIG.logging = 0

    FeatureMgr.GetFeature(eFeature.Heist.Generic.Launch):Toggle(preps.solo_launch or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Bonus):Toggle(preps.bonus_12mil or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Double):Toggle(preps.double_rewards_week or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Presets):SetListIndex(preps.presets or 0):OnClick()
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player1.Toggle):Toggle(preps.player1.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player2.Toggle):Toggle(preps.player2.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player3.Toggle):Toggle(preps.player3.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player4.Toggle):Toggle(preps.player4.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player1.Cut):SetIntValue(preps.player1.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player2.Cut):SetIntValue(preps.player2.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player3.Cut):SetIntValue(preps.player3.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Player4.Cut):SetIntValue(preps.player4.cut or 0)

    Script.Yield(500)
    CONFIG.logging = temp
end

function Helper.ApplyCayoPreset(preps)
    local temp     = CONFIG.logging
    CONFIG.logging = 0

    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Difficulty):SetListIndex(preps.difficulty or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Approach):SetListIndex(preps.approach or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Loadout):SetListIndex(preps.loadout or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary):SetListIndex(preps.primary_target or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound):SetListIndex(preps.compound_target or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound):SetListIndex(preps.compound_amount or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts):SetListIndex(preps.arts_amount or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island):SetListIndex(preps.island_target or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island):SetListIndex(preps.island_amount or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Advanced):Toggle(preps.advanced or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash):SetIntValue(preps.cash_value or 83250)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed):SetIntValue(preps.weed_value or 135000)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke):SetIntValue(preps.coke_value or 202500)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold):SetIntValue(preps.gold_value or 333333)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts):SetIntValue(preps.arts_value or 180000)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Misc.Bag):Toggle(preps.womans_bag or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Crew):Toggle(preps.remove_crew_cuts or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Presets):SetListIndex(preps.presets or 0):OnClick()
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Toggle):Toggle(preps.player1.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Toggle):Toggle(preps.player2.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Toggle):Toggle(preps.player3.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Toggle):Toggle(preps.player4.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Cut):SetIntValue(preps.player1.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Cut):SetIntValue(preps.player2.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Cut):SetIntValue(preps.player3.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Cut):SetIntValue(preps.player4.cut or 0)

    Script.Yield(500)
    CONFIG.logging = temp
end

function Helper.ApplyDiamondPreset(preps)
    local temp     = CONFIG.logging
    CONFIG.logging = 0

    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty):SetListIndex(preps.difficulty or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Approach):SetListIndex(preps.approach or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Gunman):SetListIndex(preps.gunman or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Loadout):SetListIndex(preps.loadout or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Driver):SetListIndex(preps.driver or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles):SetListIndex(preps.vehicles or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Hacker):SetListIndex(preps.hacker or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Masks):SetListIndex(preps.masks or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Guards):SetListIndex(preps.guards or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Keycards):SetListIndex(preps.keycards or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Preps.Target):SetListIndex(preps.target or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Generic.Launch):Toggle(preps.solo_launch or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Autograbber):Toggle(preps.autograbber or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Presets):SetListIndex(preps.presets or 0):OnClick()
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Toggle):Toggle(preps.player1.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Toggle):Toggle(preps.player2.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Toggle):Toggle(preps.player3.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Toggle):Toggle(preps.player4.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Cut):SetIntValue(preps.player1.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Cut):SetIntValue(preps.player2.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Cut):SetIntValue(preps.player3.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Cut):SetIntValue(preps.player4.cut or 0)

    Script.Yield(500)
    CONFIG.logging = temp
end

function Helper.ApplyDoomsdayPreset(preps)
    local temp     = CONFIG.logging
    CONFIG.logging = 0

    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Preps.Act):SetListIndex(preps.act or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Generic.Launch):Toggle(preps.solo_launch or false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Presets):SetListIndex(preps.presets or 0):OnClick()
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player1.Toggle):Toggle(preps.player1.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player2.Toggle):Toggle(preps.player2.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player3.Toggle):Toggle(preps.player3.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player4.Toggle):Toggle(preps.player4.enabled or false)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player1.Cut):SetIntValue(preps.player1.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player2.Cut):SetIntValue(preps.player2.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player3.Cut):SetIntValue(preps.player3.cut or 0)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Cuts.Player4.Cut):SetIntValue(preps.player4.cut or 0)

    Script.Yield(500)
    CONFIG.logging = temp
end

function Helper.RefreshFiles()
    Utils.FillDynamicTables()
    Parser.ParseTables(eTable)
    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Presets.File):SetList(eFeature.Heist.Apartment.Presets.File.list:GetNames()):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Presets.File):SetList(eFeature.Heist.CayoPerico.Presets.File.list:GetNames()):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Presets.File):SetList(eFeature.Heist.DiamondCasino.Presets.File.list:GetNames()):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Presets.File):SetList(eFeature.Heist.Doomsday.Presets.File.list:GetNames()):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Settings.Translation.File):SetList(eFeature.Settings.Translation.File.list:GetNames()):SetListIndex(0)
    FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.File)
        :SetList(eFeature.Dev.Editor.Stats.File.list:GetNames())
        :SetDesc("Select the desired stat file.")
        :SetListIndex(0)
end

function Helper.GetCardName(index)
	if index == 0 then
		return "Rolling..."
	end

	local number = math.fmod(index, 13)
	local name   = ""
	local suit   = ""

	if number == 1 then
		name = "A"
	elseif number == 0 then
		name = "K"
	elseif number == 12 then
		name = "Q"
	elseif number == 11 then
		name = "J"
	else
		name = S(number)
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

function Helper.GetPokerPlayersCount()
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

function Helper.GetPokerCards(id)
    local currentTable  = eLocal.World.Casino.Poker.CurrentTable:Get()
    local cards         = eLocal.World.Casino.Poker.Cards.vLocal
    local currentDeck   = eLocal.World.Casino.Poker.CurrentDeck.vLocal
    local antiCheat     = eLocal.World.Casino.Poker.AntiCheat.vLocal
    local antiCheatDeck = eLocal.World.Casino.Poker.AntiCheatDeck.vLocal
    local deckSize      = eLocal.World.Casino.Poker.DeckSize.vLocal
    local card1         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 1 + (id * 3))
	local card2         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 2 + (id * 3))
	local card3         = ScriptLocal.GetInt(eScript.World.Casino.Poker.hash, cards + currentDeck + 1 + (currentTable * deckSize) + 2 + 3 + (id * 3))
    return Helper.GetCardName(card1) .. ", " .. Helper.GetCardName(card2) .. ", " .. Helper.GetCardName(card3)
end

function Helper.SetPokerCards(id, card1, card2, card3)
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

function Helper.IsPropertyOwned(property)
    if not GTA.IsInSession() then
        return false
    end

    if property == eTable.Properties.Warehouse then
        for i = 0, 4 do
            if eStat[F("MPX_WARHOUSESLOT%d", i)]:Get() ~= 0 then
                return true
            end

            return false
        end
    end

    return property:Get() ~= 0
end

function Helper.RegisterAsBoss()
    if not CONFIG.register_as_boss.autoregister then return end

    if eGlobal.Player.Organization.CEO:Get() == -1 then
        eGlobal.Player.Organization.CEO:Set(PLAYER_ID)
    end

    if eGlobal.Player.Organization.Type:Get() ~= CONFIG.register_as_boss.type then
        eGlobal.Player.Organization.Type:Set(CONFIG.register_as_boss.type)
    end
end

--#endregion
