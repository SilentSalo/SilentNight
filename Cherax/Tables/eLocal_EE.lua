eLocal = {
    HAS_PARSED = false,
    Business = {
        Bunker = {
            Sell = {
                Finish = { type = "int", vLocal = 1264 + 774, script = "gb_gunrunning" }
            }
        },
        CrateWarehouse = {
            Buy = {
                Amount  = { type = "int", vLocal = 623 + 1,   script = "gb_contraband_buy" },
                Finish1 = { type = "int", vLocal = 623 + 5,   script = "gb_contraband_buy" },
                Finish2 = { type = "int", vLocal = 623 + 191, script = "gb_contraband_buy" },
                Finish3 = { type = "int", vLocal = 623 + 192, script = "gb_contraband_buy" }
            },
            Sell = {
                Type   = { type = "int", vLocal = 565 + 7, script = "gb_contraband_sell" },
                Finish = { type = "int", vLocal = 565 + 1, script = "gb_contraband_sell" }
            },
            Position = {
                X = { type = "int", vLocal = 778,     script = "appsecuroserv" },
                Y = { type = "int", vLocal = 778 + 1, script = "appsecuroserv" },
                Z = { type = "int", vLocal = 778 + 2, script = "appsecuroserv" }
            },
            Bitset   = { type = "int", vLocal = 581, script = "appsecuroserv" },
            Property = { type = "int", vLocal = 757, script = "appsecuroserv" }
        },
        Hangar = {
            Sell = {
                Delivered = { type = "int", vLocal = 1987 + 1078, script = "gb_smuggler" },
                Finish    = { type = "int", vLocal = 1987 + 1035, script = "gb_smuggler" }
            }
        },
        Nightclub = {
            Safe = {
                Collect = { type = "int", vLocal = 204 + 32 + 1, script = "am_mp_nightclub" }
            }
        }
    },
    Heist = {
        Generic = {
            Launch1 = { type = "int", vLocal = 19877 + 15, script = "fmmc_launcher" },
            Launch2 = { type = "int", vLocal = 19877 + 34, script = "fmmc_launcher" }
        },
        Agency = {
            Finish = {
                Step1 = { type = "int", vLocal = 52581 + 1,        script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52581 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        Apartment = {
            Bypass = {
                Fleeca = {
                    Hack  = { type = "int",   vLocal = 12214 + 24, script = "fm_mission_controller" },
                    Drill = { type = "float", vLocal = 10505 + 11, script = "fm_mission_controller" }
                },
                Pacific = {
                    Hack = { type = "int", vLocal = 10211, script = "fm_mission_controller" }
                }
            },
            Finish = {
                Step1 = { type = "int", vLocal = 20385,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 20385 + 1062,     script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 20385 + 1740 + 1, script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 20385 + 2686,     script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 29004 + 1,        script = "fm_mission_controller" },
                Step6 = { type = "int", vLocal = 32460 + 68 + 1,   script = "fm_mission_controller" }
            }
        },
        AutoShop = {
            Reload = { type = "int", vLocal = 403, script = "tuner_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 52581 + 1,        script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52581 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        CayoPerico = {
            Bypass = {
                FingerprintHack = { type = "int",   vLocal = 26407,     script = "fm_mission_controller_2020" },
                PlasmaCutterCut = { type = "float", vLocal = 31451 + 3, script = "fm_mission_controller_2020" },
                DrainagePipeCut = { type = "int",   vLocal = 30212,     script = "fm_mission_controller_2020" },
            },
            Reload = { type = "int", vLocal = 1566, script = "heist_island_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 52581,            script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52581 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        DiamondCasino = {
            Autograbber = {
                Grab  = { type =   "int", vLocal = 10691,      script = "fm_mission_controller" },
                Speed = { type = "float", vLocal = 10691 + 14, script = "fm_mission_controller" }
            },
            Bypass = {
                FingerprintHack = { type = "int", vLocal = 53997,      script = "fm_mission_controller" },
                KeypadHack      = { type = "int", vLocal = 55063,      script = "fm_mission_controller" },
                VaultDrill1     = { type = "int", vLocal = 10505 + 7,  script = "fm_mission_controller" },
                VaultDrill2     = { type = "int", vLocal = 10505 + 37, script = "fm_mission_controller" }
            },
            Reload = { type = "int", vLocal = 208, script = "gb_casino_heist_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 20385,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 20385 + 1062,     script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 20385 + 1740 + 1, script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 20385 + 2686,     script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 29004 + 1,        script = "fm_mission_controller" },
                Step6 = { type = "int", vLocal = 32460 + 68 + 1,   script = "fm_mission_controller" }
            }
        },
        Doomsday = {
            Bypass = {
                DataHack     = { type = "int", vLocal = 1537,       script = "fm_mission_controller" },
                DoomsdayHack = { type = "int", vLocal = 1294 + 135, script = "fm_mission_controller" }
            },
            Reload = { type = "int", vLocal = 207, script = "gb_gang_ops_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 20385,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 20385 + 1740 + 1, script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 29004 + 1,        script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 32460 + 68 + 1,   script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 32460 + 97,       script = "fm_mission_controller" }
            }
        },
        SalvageYard = {
            Reload = { type = "int", vLocal = 532, script = "vehrob_planning" }
        }
    },
    World = {
        AmmuNation = {
            Bypass = {
                Lock = { type = "int", vLocal = 142 + 748, script = "gunclub_shop" }
            }
        },
        Casino = {
            Blackjack = {
                Dealer = {
                    FirstCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1, script = "blackjack" },
                    SecondCard = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2, script = "blackjack" },
                    ThirdCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
                },
                CurrentTable = { type = "int", vLocal = 1796 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
                VisibleCards = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
            },
            LuckyWheel = {
                WinState    = { type = "int", vLocal = 300 + 14, script = "casino_lucky_wheel" },
                PrizeState  = { type = "int", vLocal = 300 + 45, script = "casino_lucky_wheel" }
            },
            Poker = {
                CurrentTable  = { type = "int", vLocal = 769 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" },
                Table         = { type = "int", vLocal = 769,                           script = "three_card_poker" },
                TableSize     = { type = "int", vLocal = 9,                             script = "three_card_poker" },
                Cards         = { type = "int", vLocal = 136,                           script = "three_card_poker" },
                CurrentDeck   = { type = "int", vLocal = 168,                           script = "three_card_poker" },
                AntiCheat     = { type = "int", vLocal = 1058,                          script = "three_card_poker" },
                AntiCheatDeck = { type = "int", vLocal = 799,                           script = "three_card_poker" },
                DeckSize      = { type = "int", vLocal = 55,                            script = "three_card_poker" }
            },
            Roulette = {
                MasterTable   = { type = "int", vLocal = 144,  script = "casinoroulette" },
                OutcomesTable = { type = "int", vLocal = 1357, script = "casinoroulette" },
                BallTable     = { type = "int", vLocal = 153,  script = "casinoroulette" }
            },
            Slots = {
                RandomResultTable = { type = "int", vLocal = 1368, script = "casino_slots" }
            }
        }
    }
}
