--#region Script

function Script.LoadDefaultTranslation()
    local path = F("%s\\EN.json", TRANS_DIR)

    if FileMgr.DoesFileExist(path) then
        Script.Translate(path)
        SilentLogger.LogInfo(F("[Load (Settings)] Default translation should've been loaded ツ", file))
        return
    end

    SilentLogger.LogError("[Load (Settings)] Default translation doesn't exist ツ")
    SilentLogger.LogInfo("[Load (Settings)] Restart Silent Night to create default translation ツ")
end

function Script.LoadTranslation()
    local path = F("%s\\%s.json", TRANS_DIR, CONFIG.language)

    Helper.RefreshFiles()

    if FileMgr.DoesFileExist(path) then
        Script.Translate(path)

        local ftr = eFeature.Settings.Translation.File
        FeatureMgr.GetFeature(ftr):SetListIndex(ftr.list:GetIndex(CONFIG.language))
    else
        SilentLogger.LogError(F("[Load (Settings)] Translation «%s» doesn't exist ツ", CONFIG.language))
        Script.LoadDefaultTranslation()

        CONFIG.language = "EN"
        FeatureMgr.GetFeature(eFeature.Settings.Translation.File):SetListIndex(0)
        Json.EncodeToFile(CONFIG_PATH, CONFIG)
        CONFIG = Json.DecodeFromFile(CONFIG_PATH)
    end
end

function Script.LoadSubscribedScript(scriptName, stop)
    local ftr   = FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.SubscribedScripts)
    local list  = ftr:GetList()
    local found = false

    for i, name in ipairs(list) do
        if name == scriptName then
            ftr:SetListIndex(i - 1)
            found = true
            break
        end
    end

    if not found then
        SilentLogger.LogError(F("[%s (Settings)] Failed to find «%s» in subscribed scripts ツ", scriptName, scriptName))
        return
    end

    Script.Yield(1000)

    if not stop then
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.RunScript):OnClick()
    else
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.StopScript):OnClick()
    end
end

function Script.OpenLuaTab()
    if CONFIG.autoopen then
        Script.QueueJob(function()
            if GUI.GetMode() == eGuiMode.ClickGUI then
                ClickGUI.SetActiveMenuTab(ClickTab.LuaTab)
            else
                local scriptTabName = F("%s v%s %s", SCRIPT_NAME, SCRIPT_VER, GTA_EDITION)
                local scriptTab     = ListGUI.GetRootTab():GetSubTab(scriptTabName)

                while not scriptTab do
                    Script.Yield()
                    scriptTab = ListGUI.GetRootTab():GetSubTab(scriptTabName)
                end

                ListGUI.SetCurrentTab(scriptTab)
            end
        end)
    end
end

function Script.Translate(path)
    local translations = Json.DecodeFromFile(path)

    for hashStr, data in pairs(translations) do
        local hash    = N(hashStr)
        local feature = FeatureMgr.GetFeatureByHash(hash)

        if feature then
            if data.name then
                feature:SetName(data.name)
            end

            if data.desc then
                feature:SetDesc(data.desc)
            end

            if data.list and type(data.list) == "table" and feature.SetList then
                feature:SetList(data.list)
            end
        end
    end
end

function Script.ReAssign()
    PLAYER_ID = GTA.GetLocalPlayerId()

    if GTA_EDITION == "EE" then
        eGlobal.Business.Nightclub.Safe.Value  = { type = "int", global = 1845299 + 1 + (PLAYER_ID * 883) + 260 + 364 + 5 }
        eGlobal.Heist.Apartment.Cooldown       = { type = "int", global = 1877303 + 1 + (PLAYER_ID * 77) + 76             }
        eGlobal.World.Kosatka.Status           = { type = "int", global = 2658294 + 1 + (PLAYER_ID * 468) + 325 + 4       }

        eGlobal.Player.Organization = {
            CEO  = { type = "int", global = 1892798 + 1 + (PLAYER_ID * 615) + 10       },
            Type = { type = "int", global = 1892798 + 1 + (PLAYER_ID * 615) + 10 + 433 }
        }

        eGlobal.Player.RP = { type = "int", global = 1845299 + 1 + (PLAYER_ID * 883) + 198 + 1 }

        eLocal.World.Casino.Poker.CurrentTable = { type = "int", vLocal = 773 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" }

        eLocal.World.Casino.Blackjack = {
            Dealer = {
                FirstCard  = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1, script = "blackjack" },
                SecondCard = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2, script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3, script = "blackjack" }
            },

            CurrentTable = { type = "int", vLocal = 1800 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
        }
    else
        eGlobal.Business.Nightclub.Safe.Value  = { type = "int", global = 1845250 + 1 + (PLAYER_ID * 880) + 260 + 364 + 5 }
        eGlobal.Heist.Apartment.Cooldown       = { type = "int", global = 1877158 + 1 + (PLAYER_ID * 77) + 76             }
        eGlobal.World.Kosatka.Status           = { type = "int", global = 2658291 + 1 + (PLAYER_ID * 468) + 325 + 4       }

        eGlobal.Player.Organization = {
            CEO  = { type = "int", global = 1892653 + 1 + (PLAYER_ID * 615) + 10       },
            Type = { type = "int", global = 1892653 + 1 + (PLAYER_ID * 615) + 10 + 433 }
        }

        eGlobal.Player.RP = { type = "int", global = 1845250 + 1 + (PLAYER_ID * 880) + 198 + 1 }

        eLocal.World.Casino.Poker.CurrentTable = { type = "int", vLocal = 771 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" }

        eLocal.World.Casino.Blackjack = {
            Dealer = {
                FirstCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                SecondCard = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
            },

            CurrentTable = { type = "int", vLocal = 1798 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
        }
    end
end

function Script.ReloadFeatures()
    local temp     = CONFIG.logging
    CONFIG.logging = 0

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
        :SetFloatValue(eTunable.Heist.SalvageYard.Vehicle.SalvageValueMultiplier:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
        :SetIntValue(eTunable.Heist.SalvageYard.Vehicle.Slot1.Value:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
        :SetIntValue(eTunable.Heist.SalvageYard.Vehicle.Slot2.Value:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
        :SetIntValue(eTunable.Heist.SalvageYard.Vehicle.Slot3.Value:Get())

    FeatureMgr.GetFeature(eFeature.Business.Bunker.Stats.SellMade)
        :SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Get())

    FeatureMgr.GetFeature(eFeature.Business.Bunker.Stats.SellUndertaken)
        :SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Get())

    FeatureMgr.GetFeature(eFeature.Business.Bunker.Stats.Earnings)
        :SetIntValue(eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Get())

    FeatureMgr.GetFeature(eFeature.Business.Hangar.Stats.BuyMade)
        :SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Get())

    FeatureMgr.GetFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)
        :SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Get())

    FeatureMgr.GetFeature(eFeature.Business.Hangar.Stats.SellMade)
        :SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Get())

    FeatureMgr.GetFeature(eFeature.Business.Hangar.Stats.SellUndertaken)
        :SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get())

    FeatureMgr.GetFeature(eFeature.Business.Hangar.Stats.Earnings)
        :SetIntValue(eStat.MPX_LFETIME_HANGAR_EARNINGS:Get())

    FeatureMgr.GetFeature(eFeature.Business.Nightclub.Stats.SellMade)
        :SetIntValue(eStat.MPX_HUB_SALES_COMPLETED:Get())

    FeatureMgr.GetFeature(eFeature.Business.Nightclub.Stats.Earnings)
        :SetIntValue(eStat.MPX_HUB_EARNINGS:Get())

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)
        :SetIntValue(eStat.MPX_LIFETIME_BUY_COMPLETE:Get())

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)
        :SetIntValue(eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Get())

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)
        :SetIntValue(eStat.MPX_LIFETIME_SELL_COMPLETE:Get())

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)
        :SetIntValue(eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Get())

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)
        :SetIntValue(eStat.MPX_LIFETIME_CONTRA_EARNINGS:Get())

    FeatureMgr.GetFeature(eFeature.Business.Misc.Supplies.Business)
        :SetList(eFeature.Business.Misc.Supplies.Business.list:GetNames())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Time)
        :SetListIndex(0)

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Date)
        :SetListIndex(0)

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Wins)
        :SetIntValue(eStat.MPPLY_TOTAL_RACES_WON:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Losses)
        :SetIntValue(eStat.MPPLY_TOTAL_RACES_LOST:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Kills)
        :SetIntValue(eStat.MPPLY_KILLS_PLAYERS:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Deaths)
        :SetIntValue(eStat.MPPLY_DEATHS_PLAYER:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Dances)
        :SetIntValue(eStat.MPX_LAP_DANCED_BOUGHT:Get())

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Acts)
        :SetIntValue(eStat.MPX_PROSTITUTES_FREQUENTED:Get())

    CONFIG.logging = temp
end

HAS_PARSED         = false
LAST_SESSION_STATE = false

function Script.ReParse()
    if not GTA.IsInSession() then
        if HAS_PARSED then
            HAS_PARSED = false
        end

        Script.Yield(5000)
    else
        if not HAS_PARSED or LAST_SESSION_STATE ~= GTA.IsInSession() then
            Script.Yield(5000)
            Parser.ParseTunables(eTunable)
            Parser.ParseStats(eStat)
            Utils.FillDynamicTables()
            Parser.ParseTables(eTable)
            Script.ReAssign()
            Parser.ParseGlobals(eGlobal)
            Script.ReloadFeatures()
            Parser.ParseLocals(eLocal)
            Parser.ParsePackedStats(ePackedStat)

            while not (
                eTunable.HAS_PARSED
                and eGlobal.HAS_PARSED
                and eLocal.HAS_PARSED
                and eStat.HAS_PARSED
                and ePackedStat.HAS_PARSED
                and eTable.HAS_PARSED
            ) do
                Script.Yield()
            end

            HAS_PARSED = true
        end
    end

    LAST_SESSION_STATE = GTA.IsInSession()
end

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    Script.ReParse()
    Script.Yield()
end)

GLOBAL_XP_SYNCED = false
KD_RATIO         = 0.0
NEW_KD_RATIO     = 0.0
RACES_WINS       = 0
RACES_LOSSES     = 0
CURRENT_TIME     = 0
NEW_TIME         = 0
CURRENT_DATE     = nil
NEW_DATE         = nil
PRIVATE_DANCES   = 0
SEX_ACTS         = 0

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local function IsInApartmentInterior()
        return GTA.IsInInterior()
            and not GTA.IsScriptRunning(eScript.Kosatka.Interior)
            and not GTA.IsScriptRunning(eScript.Arcade.Interior)
            and not GTA.IsScriptRunning(eScript.Facility.Interior)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Agency) then
        FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Entrance):SetVisible(true)

        if GTA.IsScriptRunning(eScript.Agency.Interior) then
            FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Computer):SetVisible(true)

            if eNative.HUD.GET_CLOSEST_BLIP_INFO_ID(eTable.BlipSprites.Franklin) ~= 0 then
                FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Mission):SetVisible(true)
            else
                FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Mission):SetVisible(false)
            end
        else
            FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Computer):SetVisible(false)
            FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Mission):SetVisible(false)
        end
    else
        FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Computer):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.Agency.Misc.Teleport.Mission):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Apartment) then
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Entrance):SetVisible(true)

        if IsInApartmentInterior() then
            if eNative.HUD.GET_CLOSEST_BLIP_INFO_ID(eTable.BlipSprites.Heist) ~= 0 then
                FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Board):SetVisible(true)
            else
                FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Board):SetVisible(false)
            end
        else
            FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Board):SetVisible(false)
        end
    else
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Misc.Teleport.Board):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.AutoShop) then
        FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Misc.Teleport.Board):SetVisible(GTA.IsScriptRunning(eScript.AutoShop.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.AutoShop.Misc.Teleport.Board):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Kosatka) then
        FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Misc.Teleport):SetVisible(true)
    else
        FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Misc.Teleport):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Arcade) then
        FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Board):SetVisible(GTA.IsScriptRunning(eScript.Arcade.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Board):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Facility) then
        FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Misc.Teleport.Screen):SetVisible(GTA.IsScriptRunning(eScript.Facility.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.Doomsday.Misc.Teleport.Screen):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.SalvageYard) then
        FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Board):SetVisible(GTA.IsScriptRunning(eScript.SalvageYard.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Board):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Bunker) then
        FeatureMgr.GetFeature(eFeature.Business.Bunker.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Bunker.Misc.Teleport.Laptop):SetVisible(GTA.IsScriptRunning(eScript.Bunker.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Business.Bunker.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Bunker.Misc.Teleport.Laptop):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Hangar) then
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Misc.Teleport.Laptop):SetVisible(GTA.IsScriptRunning(eScript.Hangar.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Hangar.Misc.Teleport.Laptop):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.CarWash) then
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Laptop):SetVisible(GTA.IsScriptRunning(eScript.CarWash.Interior))
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Select):SetIntValue(ePackedStat.Business.Heat.HandsOnCarWash:Get())

        if Helper.IsPropertyOwned(eTable.Properties.WeedShop) then
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Entrance):SetVisible(true)
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Laptop):SetVisible(GTA.IsScriptRunning(eScript.WeedShop.Interior))
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Select):SetIntValue(ePackedStat.Business.Heat.SmokeOnTheWater:Get())
        end

        if Helper.IsPropertyOwned(eTable.Properties.TourCompany) then
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Entrance):SetVisible(true)
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Laptop):SetVisible(GTA.IsScriptRunning(eScript.TourCompany.Interior))
            FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Select):SetIntValue(ePackedStat.Business.Heat.HigginsHelitours:Get())
        end

        local business = ePackedStat.Business.Heat
        local heat     = math.max(business.HandsOnCarWash:Get(), business.SmokeOnTheWater:Get(), business.HigginsHelitours:Get())
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.OverallHeat.Select):SetIntValue(heat)
    else
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Laptop):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Select):SetIntValue(0)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Laptop):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Select):SetIntValue(0)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Laptop):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Select):SetIntValue(0)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Nightclub) then
        FeatureMgr.GetFeature(eFeature.Business.Nightclub.Misc.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Nightclub.Misc.Teleport.Computer):SetVisible(GTA.IsScriptRunning(eScript.Nightclub.Interior))
        FeatureMgr.GetFeature(eFeature.Business.Nightclub.Popularity.Select):SetIntValue(eStat.MPX_CLUB_POPULARITY:Get() / 10)
    else
        FeatureMgr.GetFeature(eFeature.Business.Nightclub.Misc.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Nightclub.Misc.Teleport.Computer):SetVisible(false)
    end

    if Helper.IsPropertyOwned(eTable.Properties.Office) then
        FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Office):SetVisible(true)

        if eNative.HUD.GET_CLOSEST_BLIP_INFO_ID(eTable.BlipSprites.Laptop) ~= 0 then
            FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer):SetVisible(GTA.IsScriptRunning(eScript.Office.Interior))
        else
            FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer):SetVisible(false)
        end
    else
        FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Office):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer):SetVisible(false)
    end

    FeatureMgr.GetFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Warehouse):SetVisible(Helper.IsPropertyOwned(eTable.Properties.Warehouse))

    if Helper.IsPropertyOwned(eTable.Properties.Garment) then
        FeatureMgr.GetFeature(eFeature.Business.Misc.Garment.Teleport.Entrance):SetVisible(true)
        FeatureMgr.GetFeature(eFeature.Business.Misc.Garment.Teleport.Computer):SetVisible(GTA.IsScriptRunning(eScript.Garment.Interior))
    else
        FeatureMgr.GetFeature(eFeature.Business.Misc.Garment.Teleport.Entrance):SetVisible(false)
        FeatureMgr.GetFeature(eFeature.Business.Misc.Garment.Teleport.Computer):SetVisible(false)
    end

    FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Bonus):SetVisible(eStat.HEIST_MISSION_RCONT_ID_1:Get() == eTable.Heist.Apartment.Heists.PacificJob)
    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Misc.Setup):SetVisible(not ePackedStat.Business.Arcade.Setup:Get())
    FeatureMgr.GetFeature(eFeature.Business.Nightclub.Misc.Setup):SetVisible(not ePackedStat.Business.Nightclub.Setup.DJ:Get())

    if FeatureMgr.GetFeatureListIndex(eFeature.Heist.Apartment.Cuts.Presets) == 3 then
        local ftr = eFeature.Heist.Apartment.Cuts.Double
        eFeature.Heist.Apartment.Cuts.Presets.func(FeatureMgr.GetFeature(ftr):IsToggled())
    end

    if FeatureMgr.GetFeatureListIndex(eFeature.Heist.CayoPerico.Cuts.Presets) == 3 then
        FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Crew):Toggle(false):SetVisible(false)
        eFeature.Heist.CayoPerico.Cuts.Presets.func()
    end

    if FeatureMgr.GetFeatureListIndex(eFeature.Heist.DiamondCasino.Cuts.Presets) == 3 then
        FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Crew):Toggle(true):SetVisible(false)
        eFeature.Heist.DiamondCasino.Cuts.Presets.func()
    end

    if FeatureMgr.GetFeatureListIndex(eFeature.Heist.Doomsday.Cuts.Presets) == 3 then
        eFeature.Heist.Doomsday.Cuts.Presets.func()
    end

    local kills  = FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Kills):GetIntValue()
    local deaths = FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Deaths):GetIntValue()
    local wins   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Wins):GetIntValue()
    local losses = FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Losses):GetIntValue()
    local days   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Days):GetIntValue()
    local hours  = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Hours):GetIntValue()
    local mins   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Minutes):GetIntValue()
    local secs   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Seconds):GetIntValue()
    local year   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Year):GetIntValue()
    local month  = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Month):GetIntValue()
    local day    = FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Day):GetIntValue()
    local dances = FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Dances):GetIntValue()
    local acts   = FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Acts):GetIntValue()

    GLOBAL_XP_SYNCED = eStat.MPPLY_GLOBALXP:Get() == eGlobal.Player.RP:Get()
    KD_RATIO         = eStat.MPPLY_KILLS_PLAYERS:Get() / ((eStat.MPPLY_DEATHS_PLAYER:Get() == 0) and 1.0 or eStat.MPPLY_DEATHS_PLAYER:Get())
    NEW_KD_RATIO     = kills / ((deaths == 0) and 1.0 or deaths)
    RACES_WINS       = eStat.MPPLY_TOTAL_RACES_WON:Get()
    RACES_LOSSES     = eStat.MPPLY_TOTAL_RACES_LOST:Get()
    NEW_DATE         = F("%04d / %02d / %02d", year, month, day)
    NEW_TIME         = F("%dd %dh %dm %d", days, hours, mins, secs)
    PRIVATE_DANCES   = eStat.MPX_LAP_DANCED_BOUGHT:Get()
    SEX_ACTS         = eStat.MPX_PROSTITUTES_FREQUENTED:Get()

    if FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Time):GetListIndex() == 0 then
        CURRENT_TIME = NEW_TIME
    end

    if FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Date):GetListIndex() == 0 then
        CURRENT_DATE = NEW_DATE
    end

    FeatureMgr.GetFeature(eFeature.Dev.Stats.Global.Sync):SetVisible(not GLOBAL_XP_SYNCED)
    FeatureMgr.GetFeature(eFeature.Dev.Stats.KD.Apply):SetVisible(KD_RATIO ~= NEW_KD_RATIO)
    FeatureMgr.GetFeature(eFeature.Dev.Stats.Races.Apply):SetVisible(RACES_WINS ~= wins or RACES_LOSSES ~= losses)
    FeatureMgr.GetFeature(eFeature.Dev.Stats.Times.Apply):SetVisible(CURRENT_TIME ~= NEW_TIME)
    FeatureMgr.GetFeature(eFeature.Dev.Stats.Dates.Apply):SetVisible(CURRENT_DATE ~= NEW_DATE)
    FeatureMgr.GetFeature(eFeature.Dev.Stats.Prostitutes.Apply):SetVisible(PRIVATE_DANCES ~= dances or SEX_ACTS ~= acts)

    Helper.RegisterAsBoss()

    Script.Yield(100)
end)

LAUNCH_STATES = { false, false, false }

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local toggled = nil

    for i, ftr in ipairs(soloLaunches) do
        local isOn = FeatureMgr.GetFeatureBool(ftr)

        if isOn and not LAUNCH_STATES[i] then
            toggled = i
        end

        LAUNCH_STATES[i] = isOn
    end

    if toggled then
        for i, ftr in ipairs(soloLaunches) do
            local temp     = CONFIG.logging
            CONFIG.logging = 0
            FeatureMgr.GetFeature(ftr):Toggle(i == toggled)
            CONFIG.logging = temp
        end
    end

    Script.Yield()
end)

LOOP_STATES = { false, false, false, false, false, false }

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    if not CONFIG.easy_money.dummy_prevention then
        Script.Yield()
        return
    end

    local toggled = nil

    for i, ftr in ipairs(easyLoops) do
        local isOn = FeatureMgr.GetFeatureBool(ftr)

        if isOn and not LOOP_STATES[i] then
            toggled = i
        end

        LOOP_STATES[i] = isOn
    end

    if toggled then
        for i, ftr in ipairs(easyLoops) do
            FeatureMgr.GetFeature(ftr):Toggle(i == toggled)
        end
    end

    Script.Yield()
end)

FileMgr.ExportTranslation("EN")

Script.LoadTranslation()

Script.OpenLuaTab()

--#endregion Script
