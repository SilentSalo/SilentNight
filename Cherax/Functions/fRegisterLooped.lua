function DiamondAutograbber()
    if FeatureMgr.GetFeature(diamondAutograbber.hash):IsToggled() then
        diamondAutograbber.func()
    end
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

function PriceMaximizer()
    bunkerPrice.func(FeatureMgr.GetFeature(bunkerPrice.hash):IsToggled())
    hangarPrice.func(FeatureMgr.GetFeature(hangarPrice.hash):IsToggled())
    nightclubPrice.func(FeatureMgr.GetFeature(nightclubPrice.hash):IsToggled())
    specialPrice.func(FeatureMgr.GetFeature(specialPrice.hash):IsToggled())
end

function EasyLooper()
    if FeatureMgr.GetFeature(easyLoop5k.hash):IsToggled() then
        easyLoop5k.func()
    end
    if FeatureMgr.GetFeature(easyLoop50k.hash):IsToggled() then
        easyLoop50k.func()
    end
    if FeatureMgr.GetFeature(easyLoop100k.hash):IsToggled() then
        easyLoop100k.func()
    end
    if FeatureMgr.GetFeature(easyLoop180k.hash):IsToggled() then
        easyLoop180k.func()
    end
    if FeatureMgr.GetFeature(easyLoop300k.hash):IsToggled() then
        easyLoop300k.func()
    end
end

function ReAssign()
    PLAYER_ID = GTA.GetLocalPlayerId()
    eGlobal.Business.CrateWarehouse.Slot   = { type = "int", global = 1845281 + 1 + (PLAYER_ID * 883) + 268 + 120 + 1 + (0 * 3)  }
    eGlobal.Business.Nightclub.Safe.Value  = { type = "int", global = 1845281 + 1 + (PLAYER_ID * 883) + 268 + 358 + 5            }
    eGlobal.Heist.Apartment.Jobs           = { type = "int", global = 1877417 + 1 + (PLAYER_ID * 77 + 1) + 76                    }
    eGlobal.Player.Property                = { type = "int", global = 2657971 + 1 + (PLAYER_ID * 465) + 322 + 8                  }
    eLocal.World.Casino.Poker.CurrentTable = { type = "int", vLocal = 767 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" }
    eLocal.World.Casino.Blackjack = {
        Dealer = {
            FirstCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
            SecondCard = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
            ThirdCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
        },
        CurrentTable = { type = "int", vLocal = 1794 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
        VisibleCards = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
    }
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
            Log("Online session detected")
            ParseTunables(eTunable)
            ParseStats(eStat)
            ReAssign()
            ParseGlobals(eGlobal)
            ParseLocals(eLocal)
            while not eTunable.HAS_PARSED and eGlobal.HAS_PARSED and eLocal.HAS_PARSED and eStat.HAS_PARSED and ePackedBool.HAS_PARSED and eTable.HAS_PARSED do
                Script.Yield(1)
            end
            Log("All required values parsed")
            HAS_PARSED = true
        end
    end
    LAST_SESSION_STATE = IsInSession()
end

Script.RegisterLooped(function()
    DiamondAutograbber()
    TurkishSupplier()
    PriceMaximizer()
    EasyLooper()
    ReParse()
    Script.Yield(1)
end)
