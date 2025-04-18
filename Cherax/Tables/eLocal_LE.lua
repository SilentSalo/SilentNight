eLocal = {
    HAS_PARSED = false,
    Business = {
        Bunker = {
            Sell = {
                Finish = { type = "int", vLocal = 1262 + 774, script = "gb_gunrunning" }
            }
        },
        CrateWarehouse = {
            Buy = {
                Amount  = { type = "int", vLocal = 621 + 1,   script = "gb_contraband_buy" },
                Finish1 = { type = "int", vLocal = 621 + 5,   script = "gb_contraband_buy" },
                Finish2 = { type = "int", vLocal = 621 + 191, script = "gb_contraband_buy" },
                Finish3 = { type = "int", vLocal = 621 + 192, script = "gb_contraband_buy" }
            },
            Sell = {
                Type   = { type = "int", vLocal = 563 + 7, script = "gb_contraband_sell" },
                Finish = { type = "int", vLocal = 563 + 1, script = "gb_contraband_sell" }
            },
            Position = {
                X = { type = "int", vLocal = 776,     script = "appsecuroserv" },
                Y = { type = "int", vLocal = 776 + 1, script = "appsecuroserv" },
                Z = { type = "int", vLocal = 776 + 2, script = "appsecuroserv" }
            },
            Bitset   = { type = "int", vLocal = 579, script = "appsecuroserv" },
            Property = { type = "int", vLocal = 755, script = "appsecuroserv" }
        },
        Hangar = {
            Sell = {
                Delivered = { type = "int", vLocal = 1985 + 1078, script = "gb_smuggler" },
                Finish    = { type = "int", vLocal = 1985 + 1035, script = "gb_smuggler" }
            }
        },
        Nightclub = {
            Safe = {
                Type    = { type = "int", vLocal = 202 + 32 + 4, script = "am_mp_nightclub" },
                Collect = { type = "int", vLocal = 202 + 32 + 1, script = "am_mp_nightclub" }
            }
        }
    },
    Heist = {
        Generic = {
            Launch1 = { type = "int", vLocal = 19875 + 15, script = "fmmc_launcher" },
            Launch2 = { type = "int", vLocal = 19875 + 34, script = "fmmc_launcher" }
        },
        Agency = {
            Finish = {
                Step1 = { type = "int", vLocal = 52171 + 1,        script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52171 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        Apartment = {
            Bypass = {
                Fleeca = {
                    Hack  = { type = "int",   vLocal = 11814 + 24, script = "fm_mission_controller" },
                    Drill = { type = "float", vLocal = 10105 + 11, script = "fm_mission_controller" }
                },
                Pacific = {
                    Hack = { type = "int", vLocal = 9811, script = "fm_mission_controller" }
                }
            },
            Finish = {
                Step1 = { type = "int", vLocal = 19783,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 19783 + 1062,     script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 19783 + 1740 + 1, script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 19783 + 2686,     script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 28402 + 1,        script = "fm_mission_controller" },
                Step6 = { type = "int", vLocal = 31658 + 1 + 68,   script = "fm_mission_controller" }
            }
        },
        AutoShop = {
            Reload  = { type = "int", vLocal = 401, script = "tuner_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 52171 + 1,        script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52171 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        CayoPerico = {
            Bypass = {
                FingerprintHack = { type = "int",   vLocal = 24986,     script = "fm_mission_controller_2020" },
                PlasmaCutterCut = { type = "float", vLocal = 31049 + 3, script = "fm_mission_controller_2020" },
                DrainagePipeCut = { type = "int",   vLocal = 29810,     script = "fm_mission_controller_2020" },
            },
            Reload = { type = "int", vLocal = 1564, script = "heist_island_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 52171,            script = "fm_mission_controller_2020" },
                Step2 = { type = "int", vLocal = 52171 + 1776 + 1, script = "fm_mission_controller_2020" }
            }
        },
        DiamondCasino = {
            Autograbber = {
                Grab  = { type =   "int", vLocal = 10291,      script = "fm_mission_controller" },
                Speed = { type = "float", vLocal = 10291 + 14, script = "fm_mission_controller" }
            },
            Bypass = {
                FingerprintHack = { type = "int", vLocal = 53089,      script = "fm_mission_controller" },
                KeypadHack      = { type = "int", vLocal = 54155,      script = "fm_mission_controller" },
                VaultDrill1     = { type = "int", vLocal = 10145 + 7,  script = "fm_mission_controller" },
                VaultDrill2     = { type = "int", vLocal = 10145 + 37, script = "fm_mission_controller" }
            },
            Reload = { type = "int", vLocal = 206, script = "gb_casino_heist_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 19783,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 19783 + 1062,     script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 19783 + 1740 + 1, script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 19783 + 2686,     script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 28402 + 1,        script = "fm_mission_controller" },
                Step6 = { type = "int", vLocal = 31658 + 1 + 68,   script = "fm_mission_controller" }
            }
        },
        Doomsday = {
            Bypass = {
                DataHack     = { type = "int", vLocal = 1535,       script = "fm_mission_controller" },
                DoomsdayHack = { type = "int", vLocal = 1292 + 135, script = "fm_mission_controller" }
            },
            Reload = { type = "int", vLocal = 205, script = "gb_gang_ops_planning" },
            Finish = {
                Step1 = { type = "int", vLocal = 19783,            script = "fm_mission_controller" },
                Step2 = { type = "int", vLocal = 19783 + 1740 + 1, script = "fm_mission_controller" },
                Step3 = { type = "int", vLocal = 28402 + 1,        script = "fm_mission_controller" },
                Step4 = { type = "int", vLocal = 31658 + 1 + 68,   script = "fm_mission_controller" },
                Step5 = { type = "int", vLocal = 31658 + 97,       script = "fm_mission_controller" }
            }
        },
        SalvageYard = {
            Reload = { type = "int", vLocal = 530, script = "vehrob_planning" }
        }
    },
    World = {
        AmmuNation = {
            Bypass = {
                Lock = { type = "int", vLocal = 142 + 747, script = "gunclub_shop" }
            }
        },
        Casino = {
            Blackjack = {
                Dealer = {
                    FirstCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                    SecondCard = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                    ThirdCard  = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" }
                },
                CurrentTable = { type = "int", vLocal = 1794 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
                VisibleCards = { type = "int", vLocal = 134 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1794 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
            },
            LuckyWheel = {
                WinState    = { type = "int", vLocal = 298 + 14, script = "casino_lucky_wheel" },
                PrizeState  = { type = "int", vLocal = 298 + 45, script = "casino_lucky_wheel" }
            },
            Poker = {
                CurrentTable  = { type = "int", vLocal = 767 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" },
                Table         = { type = "int", vLocal = 767,                           script = "three_card_poker" },
                TableSize     = { type = "int", vLocal = 9,                             script = "three_card_poker" },
                Cards         = { type = "int", vLocal = 134,                           script = "three_card_poker" },
                CurrentDeck   = { type = "int", vLocal = 168,                           script = "three_card_poker" },
                AntiCheat     = { type = "int", vLocal = 1056,                          script = "three_card_poker" },
                AntiCheatDeck = { type = "int", vLocal = 799,                           script = "three_card_poker" },
                DeckSize      = { type = "int", vLocal = 55,                            script = "three_card_poker" }
            },
            Roulette = {
                MasterTable   = { type = "int", vLocal = 142,  script = "casinoroulette" },
                OutcomesTable = { type = "int", vLocal = 1357, script = "casinoroulette" },
                BallTable     = { type = "int", vLocal = 153,  script = "casinoroulette" }
            },
            Slots = {
                RandomResultTable = { type = "int", vLocal = 1366, script = "casino_slots" }
            }
        }
    }
}
