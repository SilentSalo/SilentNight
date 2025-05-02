function SoloLauncher()
    if FeatureMgr.GetFeature(genericLaunch.hash):IsToggled() then
        genericLaunch.func()
    end
end

function ApartmentSetter()
    if FeatureMgr.GetFeature(apartmentCooldown.hash):IsToggled() then
        apartmentCooldown.func()
    end
    if FeatureMgr.GetFeatureListIndex(apartmentPresets.hash) == 3 then
        apartmentPresets.func(FeatureMgr.GetFeature(apartmentDouble.hash):IsToggled())
    end
    apartmentBonus.func(FeatureMgr.GetFeature(apartmentBonus.hash):IsToggled())
end

function DiamondSetter()
    if FeatureMgr.GetFeature(diamondAutograbber.hash):IsToggled() then
        diamondAutograbber.func()
    end
    if FeatureMgr.GetFeatureListIndex(diamondPresets.hash) == 3 then
        FeatureMgr.GetFeature(diamondCrew.hash):Toggle(true)
        diamondPresets.func()
    end
    diamondCrew.func(FeatureMgr.GetFeature(diamondCrew.hash):IsToggled())
end

function CayoSetter()
    if FeatureMgr.GetFeatureListIndex(cayoPresets.hash) == 3 then
        FeatureMgr.GetFeature(cayoCrew.hash):Toggle(false)
        cayoPresets.func()
    end
    cayoCrew.func(FeatureMgr.GetFeature(cayoCrew.hash):IsToggled())
end

function TurkishSupplier()
    if FeatureMgr.GetFeature(bunkerSupplier.hash):IsToggled() then
        bunkerSupplier.func()
    end
    if FeatureMgr.GetFeature(hangarSupplier.hash):IsToggled() then
        hangarSupplier.func()
    end
    if FeatureMgr.GetFeature(specialSupplier.hash):IsToggled() then
        specialSupplier.func()
    end
end

function CooldownKiller()
    hangarCooldown.func(FeatureMgr.GetFeature(hangarCooldown.hash):IsToggled())
    nightclubCooldown.func(FeatureMgr.GetFeature(nightclubCooldown.hash):IsToggled())
    specialCooldown.func(FeatureMgr.GetFeature(specialCooldown.hash):IsToggled())
end

function PriceMaximizer()
    bunkerPrice.func(FeatureMgr.GetFeature(bunkerPrice.hash):IsToggled())
    hangarPrice.func(FeatureMgr.GetFeature(hangarPrice.hash):IsToggled())
    nightclubPrice.func(FeatureMgr.GetFeature(nightclubPrice.hash):IsToggled())
    specialPrice.func(FeatureMgr.GetFeature(specialPrice.hash):IsToggled())
end

function EasyLooper()
    if FeatureMgr.GetFeature(easyLoop5k.hash):IsToggled() then
        FeatureMgr.GetFeature(easyLoop50k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop100k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop180k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop300k.hash):Toggle(false)
        easyLoop5k.func(FeatureMgr.GetFeature(easyLoop5kDelay.hash):GetFloatValue())
    end
    if FeatureMgr.GetFeature(easyLoop50k.hash):IsToggled() then
        FeatureMgr.GetFeature(easyLoop5k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop100k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop180k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop300k.hash):Toggle(false)
        easyLoop50k.func(FeatureMgr.GetFeature(easyLoop50kDelay.hash):GetFloatValue())
    end
    if FeatureMgr.GetFeature(easyLoop100k.hash):IsToggled() then
        FeatureMgr.GetFeature(easyLoop5k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop50k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop180k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop300k.hash):Toggle(false)
        easyLoop100k.func(FeatureMgr.GetFeature(easyLoop100kDelay.hash):GetFloatValue())
    end
    if FeatureMgr.GetFeature(easyLoop180k.hash):IsToggled() then
        FeatureMgr.GetFeature(easyLoop5k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop50k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop100k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop300k.hash):Toggle(false)
        easyLoop180k.func(FeatureMgr.GetFeature(easyLoop180kDelay.hash):GetFloatValue())
    end
    if FeatureMgr.GetFeature(easyLoop300k.hash):IsToggled() then
        FeatureMgr.GetFeature(easyLoop5k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop50k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop100k.hash):Toggle(false)
        FeatureMgr.GetFeature(easyLoop180k.hash):Toggle(false)
        easyLoop300k.func(FeatureMgr.GetFeature(easyLoop300kDelay.hash):GetFloatValue())
    end
end

function NightclubSetter()
    nightclubLock.func(FeatureMgr.GetFeature(nightclubLock.hash):IsToggled())
end

function ReAssign()
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
                FirstCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                SecondCard = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
            },
            CurrentTable = { type = "int", vLocal = 1796 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
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
                FirstCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                SecondCard = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                ThirdCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
            },
            CurrentTable = { type = "int", vLocal = 1794 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
            VisibleCards = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
        }
    end
    FeatureMgr.GetFeature(bunkerMade.hash):SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Get())
    FeatureMgr.GetFeature(bunkerUndertaken.hash):SetIntValue(eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Get())
    FeatureMgr.GetFeature(bunkerEarnings.hash):SetIntValue(eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Get())
    FeatureMgr.GetFeature(hangarBuyMade.hash):SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Get())
    FeatureMgr.GetFeature(hangarBuyUndertaken.hash):SetIntValue(eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Get())
    FeatureMgr.GetFeature(hangarSellMade.hash):SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Get())
    FeatureMgr.GetFeature(hangarSellUndertaken.hash):SetIntValue(eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get())
    FeatureMgr.GetFeature(hangarEarnings.hash):SetIntValue(eStat.MPX_LFETIME_HANGAR_EARNINGS:Get())
    FeatureMgr.GetFeature(nightclubSellMade.hash):SetIntValue(eStat.MPX_HUB_SALES_COMPLETED:Get())
    FeatureMgr.GetFeature(nightclubEarnings.hash):SetIntValue(eStat.MPX_HUB_EARNINGS:Get())
    FeatureMgr.GetFeature(specialBuyMade.hash):SetIntValue(eStat.MPX_LIFETIME_BUY_COMPLETE:Get())
    FeatureMgr.GetFeature(specialBuyUndertaken.hash):SetIntValue(eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Get())
    FeatureMgr.GetFeature(specialSellMade.hash):SetIntValue(eStat.MPX_LIFETIME_SELL_COMPLETE:Get())
    FeatureMgr.GetFeature(specialSellUndertaken.hash):SetIntValue(eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Get())
    FeatureMgr.GetFeature(specialEarnings.hash):SetIntValue(eStat.MPX_LIFETIME_CONTRA_EARNINGS:Get())
    FeatureMgr.GetFeature(miscSuppliesBusiness.hash):SetList(miscSuppliesBusiness.list:GetNames())
end

local HAS_PARSED         = false
local LAST_SESSION_STATE = false

function ReParse()
    if not IsInSession() then
        if HAS_PARSED then
            HAS_PARSED = false
        end
        Script.Yield(5000)
    else
        if not HAS_PARSED or LAST_SESSION_STATE ~= IsInSession() then
            Script.Yield(5000)
            ParseTunables(eTunable)
            ParseStats(eStat)
            FillDynamicTbls()
            ParseTables(eTable)
            ReAssign()
            ParseGlobals(eGlobal)
            ParseLocals(eLocal)
            ParsePackedBools(ePackedBool)
            while not eTunable.HAS_PARSED and eGlobal.HAS_PARSED and eLocal.HAS_PARSED and eStat.HAS_PARSED and ePackedBool.HAS_PARSED and eTable.HAS_PARSED do
                Script.Yield(1)
            end
            HAS_PARSED = true
        end
    end
    LAST_SESSION_STATE = IsInSession()
end

Script.RegisterLooped(function()
    SoloLauncher()
    ApartmentSetter()
    DiamondSetter()
    CayoSetter()
    TurkishSupplier()
    CooldownKiller()
    PriceMaximizer()
    EasyLooper()
    NightclubSetter()
    ReParse()
    Script.Yield(1)
end)
