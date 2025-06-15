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
        SilentLogger.LogError(F("[%s (Settings)] Failed to find %s in subscribed scripts ツ", scriptName, scriptName))
        return
    end

    Script.Yield(1000)

    if not stop then
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.RunScript):OnClick()
    else
        FeatureMgr.GetFeatureByHash(eTable.Cherax.Features.StopScript):OnClick()
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
                if feature:GetHash() ~= eTable.SilentNight.Features.Language then
                    feature:SetList(data.list)
                end
            end
        end
    end
end

function Script.ReAssign()
    PLAYER_ID = GTA.GetLocalPlayerId()
    if GTA_EDITION == "EE" then
        eGlobal.Business.CrateWarehouse.Slot   = { type = "int", global = 1845270 + 1 + (PLAYER_ID * 892) + 268 + 120 + 1 + (0 * 3)  }
        eGlobal.Business.Nightclub.Safe.Value  = { type = "int", global = 1845270 + 1 + (PLAYER_ID * 892) + 268 + 360 + 5            }
        eGlobal.Heist.Apartment.Jobs           = { type = "int", global = 1877562 + 1 + (PLAYER_ID * 77 + 1) + 76                    }
        eGlobal.Heist.Apartment.Cooldown       = { type = "int", global = 1877562 + 1 + (PLAYER_ID * 77) + 76                        }
        eGlobal.Heist.Apartment.Heist.Type     = { type = "int", global = 1877562 + (PLAYER_ID * 77) + 24 + 2                        }
        eGlobal.Player.Property                = { type = "int", global = 2657994 + 1 + (PLAYER_ID * 465) + 322 + 8                  }
        eLocal.World.Casino.Poker.CurrentTable = { type = "int", vLocal = 769 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" }
        eLocal.World.Casino.Blackjack          = {
            Dealer = {
                FirstCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                SecondCard = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
            },
            CurrentTable = { type = "int", vLocal = 1796 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
        }
    else
        eGlobal.Business.CrateWarehouse.Slot   = { type = "int", global = 1845221 + 1 + (PLAYER_ID * 889) + 268 + 120 + 1 + (0 * 3)  }
        eGlobal.Business.Nightclub.Safe.Value  = { type = "int", global = 1845221 + 1 + (PLAYER_ID * 889) + 268 + 360 + 5            }
        eGlobal.Heist.Apartment.Jobs           = { type = "int", global = 1877417 + 1 + (PLAYER_ID * 77 + 1) + 76                    }
        eGlobal.Heist.Apartment.Cooldown       = { type = "int", global = 1877417 + 1 + (PLAYER_ID * 77) + 76                        }
        eGlobal.Heist.Apartment.Heist.Type     = { type = "int", global = 1877417 + (PLAYER_ID * 77) + 24 + 2                        }
        eGlobal.Player.Property                = { type = "int", global = 2657971 + 1 + (PLAYER_ID * 465) + 322 + 8                  }
        eLocal.World.Casino.Poker.CurrentTable = { type = "int", vLocal = 767 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" }
        eLocal.World.Casino.Blackjack          = {
            Dealer = {
                FirstCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                SecondCard = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
            },
            CurrentTable = { type = "int", vLocal = 1794 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
        }
    end
end

function Script.ReloadFeatures()
    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
        :SetFloatValue(eGlobal.Heist.SalvageYard.Vehicle.SalvageValueMultiplier:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
        :SetIntValue(eGlobal.Heist.SalvageYard.Vehicle.Slot1.Value:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
        :SetIntValue(eGlobal.Heist.SalvageYard.Vehicle.Slot2.Value:Get())

    FeatureMgr.GetFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
        :SetIntValue(eGlobal.Heist.SalvageYard.Vehicle.Slot3.Value:Get())

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
            Parser.ParsePackedBools(ePackedBool)

            while not (
                eTunable.HAS_PARSED
                and eGlobal.HAS_PARSED
                and eLocal.HAS_PARSED
                and eStat.HAS_PARSED
                and ePackedBool.HAS_PARSED
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

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local heist = eGlobal.Heist.Apartment.Heist.Type:Get()

    if heist ~= eTable.Heist.Apartment.Heists.PacificJob then
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Bonus):SetVisible(false)
    else
        FeatureMgr.GetFeature(eFeature.Heist.Apartment.Cuts.Bonus):SetVisible(true)
    end

    Script.Yield()
end)

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local ftr = eFeature.Heist.Apartment.Cuts.Presets

    if FeatureMgr.GetFeatureListIndex(ftr) ~= 3 then
        Script.Yield()
        return
    end

    local ftr = eFeature.Heist.Apartment.Cuts.Double
    eFeature.Heist.Apartment.Cuts.Presets.func(FeatureMgr.GetFeature(ftr):IsToggled())
    Script.Yield()
end)

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local ftr = eFeature.Heist.CayoPerico.Cuts.Presets

    if FeatureMgr.GetFeatureListIndex(ftr) ~= 3 then
        Script.Yield()
        return
    end

    FeatureMgr.GetFeature(eFeature.Heist.CayoPerico.Cuts.Crew):Toggle(false)
    eFeature.Heist.CayoPerico.Cuts.Presets.func()
    Script.Yield()
end)

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local ftr = eFeature.Heist.DiamondCasino.Cuts.Presets

    if FeatureMgr.GetFeatureListIndex(ftr) ~= 3 then
        Script.Yield()
        return
    end

    FeatureMgr.GetFeature(eFeature.Heist.DiamondCasino.Cuts.Crew):Toggle(true)
    eFeature.Heist.DiamondCasino.Cuts.Presets.func()
    Script.Yield()
end)

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    local ftr = eFeature.Heist.Doomsday.Cuts.Presets

    if FeatureMgr.GetFeatureListIndex(ftr) ~= 3 then
        Script.Yield()
        return
    end

    eFeature.Heist.Doomsday.Cuts.Presets.func()
    Script.Yield()
end)

lastStates = { false, false, false, false, false }

Script.RegisterLooped(function()
    if ShouldUnload() then return end

    if not CONFIG.easy_money.dummy_prevention then
        Script.Yield()
        return
    end

    local toggled = nil

    for i, ftr in ipairs(easyLoops) do
        local isOn = FeatureMgr.GetFeature(ftr):IsToggled()

        if isOn and not lastStates[i] then
            toggled = i
        end

        lastStates[i] = isOn
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

--#endregion Script
