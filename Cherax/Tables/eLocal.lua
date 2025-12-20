--#region eLocal

if GTA_EDITION == "EE" then
    eLocal = {
        HAS_PARSED = false,

        Business = {
            Bunker = {
                Sell = {
                    Finish = { type = "int", vLocal = 1268 + 774, script = "gb_gunrunning" }
                }
            },

            CrateWarehouse = {
                Buy = {
                    Amount  = { type = "int", vLocal = 627 + 1,   script = "gb_contraband_buy" },
                    Finish1 = { type = "int", vLocal = 627 + 5,   script = "gb_contraband_buy" },
                    Finish2 = { type = "int", vLocal = 627 + 191, script = "gb_contraband_buy" },
                    Finish3 = { type = "int", vLocal = 627 + 192, script = "gb_contraband_buy" }
                },

                Sell = {
                    Type   = { type = "int", vLocal = 569 + 7, script = "gb_contraband_sell" },
                    Finish = { type = "int", vLocal = 569 + 1, script = "gb_contraband_sell" }
                }
            },

            Hangar = {
                Sell = {
                    Delivered = { type = "int", vLocal = 1991 + 1078, script = "gb_smuggler" },
                    ToDeliver = { type = "int", vLocal = 1991 + 1035, script = "gb_smuggler" }
                }
            },

            Nightclub = {
                Safe = {
                    Type    = { type = "int", vLocal = 208 + 32 + 2,      script = "am_mp_nightclub" },
                    Collect = { type = "int", vLocal = 208 + 32 + 19 + 1, script = "am_mp_nightclub" }
                }
            }
        },

        Heist = {
            Generic = {
                Launch = {
                    Step1 = { type = "int", vLocal = 20056 + 34, script = "fmmc_launcher" },
                    Step2 = { type = "int", vLocal = 20056 + 15, script = "fmmc_launcher" },
                    Step3 = { type = "int", vLocal = 20297,      script = "fmmc_launcher" }
                },

                Skip = {
                    Old = { type = "int", vLocal = 20395 + 2, script = "fm_mission_controller"      },
                    New = { type = "int", vLocal = 56223 + 2, script = "fm_mission_controller_2020" },
                },

                Finish  = {
                    Old = {
                        Step1 = { type = "int", vLocal = 20395 + 1062,     script = "fm_mission_controller" },
                        Step2 = { type = "int", vLocal = 20395 + 1232 + 1, script = "fm_mission_controller" },
                        Step3 = { type = "int", vLocal = 20395 + 1,        script = "fm_mission_controller" }
                    },

                    New = {
                        Step1 = { type = "int", vLocal = 56223 + 1589,     script = "fm_mission_controller_2020" },
                        Step2 = { type = "int", vLocal = 56223 + 1776 + 1, script = "fm_mission_controller_2020" },
                        Step3 = { type = "int", vLocal = 56223 + 1,        script = "fm_mission_controller_2020" }
                    }
                }
            },

            Agency = {
                Finish = {
                    Step1 = { type = "int", vLocal = 56223 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 56223 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            Apartment = {
                Bypass = {
                    Fleeca = {
                        Hack  = { type = "int",   vLocal = 12223 + 24, script = "fm_mission_controller" },
                        Drill = { type = "float", vLocal = 10511 + 11, script = "fm_mission_controller" }
                    },

                    Pacific = {
                        Hack = { type = "int", vLocal = 10217, script = "fm_mission_controller" }
                    }
                },

                Finish = {
                    Step1 = { type = "int", vLocal = 20395,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20395 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 20395 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 20395 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 29016 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 32472 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            AutoShop = {
                Reload = { type = "int", vLocal = 408, script = "tuner_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 56223 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 56223 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            CayoPerico = {
                Bypass = {
                    FingerprintHack = { type = "int",   vLocal = 26486,     script = "fm_mission_controller_2020" },
                    PlasmaCutterCut = { type = "float", vLocal = 32589 + 3, script = "fm_mission_controller_2020" },
                    DrainagePipeCut = { type = "int",   vLocal = 31349,     script = "fm_mission_controller_2020" },
                },

                Reload = { type = "int", vLocal = 1570, script = "heist_island_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 56223,            script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 56223 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            DiamondCasino = {
                Autograbber = {
                    Grab  = { type =   "int", vLocal = 10697,      script = "fm_mission_controller" },
                    Speed = { type = "float", vLocal = 10697 + 14, script = "fm_mission_controller" }
                },

                Bypass = {
                    FingerprintHack = { type = "int", vLocal = 54042,      script = "fm_mission_controller" },
                    KeypadHack      = { type = "int", vLocal = 55108,      script = "fm_mission_controller" },
                    VaultDrill1     = { type = "int", vLocal = 10551 + 7,  script = "fm_mission_controller" },
                    VaultDrill2     = { type = "int", vLocal = 10551 + 37, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 212, script = "gb_casino_heist_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 20395,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20395 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 20395 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 20395 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 29016 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 32472 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            Doomsday = {
                Bypass = {
                    DataHack     = { type = "int", vLocal = 1541,       script = "fm_mission_controller" },
                    DoomsdayHack = { type = "int", vLocal = 1298 + 135, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 211, script = "gb_gang_ops_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 20395,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20395 + 1740 + 1, script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 29016 + 1,        script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 32472 + 1 + 68,   script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 32472 + 97,       script = "fm_mission_controller" }
                }
            },

            SalvageYard = {
                Finish = {
                    CargoShip = {
                        Step1 = { type = "int", vLocal = 7187 + 1,    script = "fm_content_vehrob_cargo_ship" },
                        Step2 = { type = "int", vLocal = 7332 + 1249, script = "fm_content_vehrob_cargo_ship" }
                    },

                    Gangbanger = {
                        Step1 = { type = "int", vLocal = 9013 + 1,    script = "fm_content_vehrob_police" },
                        Step2 = { type = "int", vLocal = 9146 + 1305, script = "fm_content_vehrob_police" }
                    },

                    Duggan = {
                        Step1 = { type = "int", vLocal = 7914 + 1,    script = "fm_content_vehrob_arena" },
                        Step2 = { type = "int", vLocal = 8034 + 1314, script = "fm_content_vehrob_arena" }
                    },

                    Podium = {
                        Step1 = { type = "int", vLocal = 9193 + 1,    script = "fm_content_vehrob_casino_prize" },
                        Step2 = { type = "int", vLocal = 9330 + 1258, script = "fm_content_vehrob_casino_prize" }
                    },

                    McTony = {
                        Step1 = { type = "int", vLocal = 6220 + 1,    script = "fm_content_vehrob_submarine" },
                        Step2 = { type = "int", vLocal = 6358 + 1159, script = "fm_content_vehrob_submarine" }
                    }
                },

                Force  = { type = "int", vLocal = 418, script = "vehrob_planning" },
                Reload = { type = "int", vLocal = 537, script = "vehrob_planning" }
            }
        },

        World = {
            Casino = {
                Blackjack = {
                    Dealer = {
                        FirstCard  = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 1, script = "blackjack" },
                        SecondCard = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 2, script = "blackjack" },
                        ThirdCard  = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 3, script = "blackjack" }
                    },

                    CurrentTable = { type = "int", vLocal = 1800 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
                    VisibleCards = { type = "int", vLocal = 140 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1800 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 12, script = "blackjack" }
                },

                LuckyWheel = {
                    WinState    = { type = "int", vLocal = 304 + 14, script = "casino_lucky_wheel" },
                    PrizeState  = { type = "int", vLocal = 304 + 45, script = "casino_lucky_wheel" }
                },

                Poker = {
                    CurrentTable  = { type = "int", vLocal = 773 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" },
                    Table         = { type = "int", vLocal = 773,                           script = "three_card_poker" },
                    TableSize     = { type = "int", vLocal = 9,                             script = "three_card_poker" },
                    Cards         = { type = "int", vLocal = 136,                           script = "three_card_poker" },
                    CurrentDeck   = { type = "int", vLocal = 168,                           script = "three_card_poker" },
                    AntiCheat     = { type = "int", vLocal = 1058,                          script = "three_card_poker" },
                    AntiCheatDeck = { type = "int", vLocal = 799,                           script = "three_card_poker" },
                    DeckSize      = { type = "int", vLocal = 55,                            script = "three_card_poker" }
                },

                Roulette = {
                    MasterTable   = { type = "int", vLocal = 148,  script = "casinoroulette" },
                    OutcomesTable = { type = "int", vLocal = 1357, script = "casinoroulette" },
                    BallTable     = { type = "int", vLocal = 153,  script = "casinoroulette" }
                },

                Slots = {
                    RandomResultTable = { type = "int", vLocal = 1374, script = "casino_slots" }
                }
            }
        }
    }
else
    eLocal = {
        HAS_PARSED = false,

        Business = {
            Bunker = {
                Sell = {
                    Finish = { type = "int", vLocal = 1266 + 774, script = "gb_gunrunning" }
                }
            },

            CrateWarehouse = {
                Buy = {
                    Amount  = { type = "int", vLocal = 625 + 1,   script = "gb_contraband_buy" },
                    Finish1 = { type = "int", vLocal = 625 + 5,   script = "gb_contraband_buy" },
                    Finish2 = { type = "int", vLocal = 625 + 191, script = "gb_contraband_buy" },
                    Finish3 = { type = "int", vLocal = 625 + 192, script = "gb_contraband_buy" }
                },

                Sell = {
                    Type   = { type = "int", vLocal = 567 + 7, script = "gb_contraband_sell" },
                    Finish = { type = "int", vLocal = 567 + 1, script = "gb_contraband_sell" }
                }
            },

            Hangar = {
                Sell = {
                    Delivered = { type = "int", vLocal = 1989 + 1078, script = "gb_smuggler" },
                    ToDeliver = { type = "int", vLocal = 1989 + 1035, script = "gb_smuggler" }
                }
            },

            Nightclub = {
                Safe = {
                    Type    = { type = "int", vLocal = 206 + 32 + 2,      script = "am_mp_nightclub" },
                    Collect = { type = "int", vLocal = 206 + 32 + 19 + 1, script = "am_mp_nightclub" }
                }
            }
        },

        Heist = {
            Generic = {
                Launch = {
                    Step1 = { type = "int", vLocal = 20054 + 34, script = "fmmc_launcher" },
                    Step2 = { type = "int", vLocal = 20054 + 15, script = "fmmc_launcher" },
                    Step3 = { type = "int", vLocal = 20295,      script = "fmmc_launcher" }
                },

                Skip = {
                    Old = { type = "int", vLocal = 19791 + 2, script = "fm_mission_controller"      },
                    New = { type = "int", vLocal = 55789 + 2, script = "fm_mission_controller_2020" },
                },

                Finish  = {
                    Old = {
                        Step1 = { type = "int", vLocal = 19791 + 1062,     script = "fm_mission_controller" },
                        Step2 = { type = "int", vLocal = 19791 + 1232 + 1, script = "fm_mission_controller" },
                        Step3 = { type = "int", vLocal = 19791 + 1,        script = "fm_mission_controller" }
                    },

                    New = {
                        Step1 = { type = "int", vLocal = 55789 + 1589,     script = "fm_mission_controller_2020" },
                        Step2 = { type = "int", vLocal = 55789 + 1776 + 1, script = "fm_mission_controller_2020" },
                        Step3 = { type = "int", vLocal = 55789 + 1,        script = "fm_mission_controller_2020" }
                    }
                }
            },

            Agency = {
                Finish = {
                    Step1 = { type = "int", vLocal = 55789 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 55789 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            Apartment = {
                Bypass = {
                    Fleeca = {
                        Hack  = { type = "int",   vLocal = 11821 + 24, script = "fm_mission_controller" },
                        Drill = { type = "float", vLocal = 10109 + 11, script = "fm_mission_controller" }
                    },

                    Pacific = {
                        Hack = { type = "int", vLocal = 9815, script = "fm_mission_controller" }
                    }
                },

                Finish = {
                    Step1 = { type = "int", vLocal = 19791,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19791 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 19791 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 19791 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 28412 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 31668 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            AutoShop = {
                Reload  = { type = "int", vLocal = 406, script = "tuner_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 55789 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 55789 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            CayoPerico = {
                Bypass = {
                    FingerprintHack = { type = "int",   vLocal = 26084,     script = "fm_mission_controller_2020" },
                    PlasmaCutterCut = { type = "float", vLocal = 32187 + 3, script = "fm_mission_controller_2020" },
                    DrainagePipeCut = { type = "int",   vLocal = 30947,     script = "fm_mission_controller_2020" },
                },

                Reload = { type = "int", vLocal = 1568, script = "heist_island_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 55789,            script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 55789 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            DiamondCasino = {
                Autograbber = {
                    Grab  = { type =   "int", vLocal = 10295,      script = "fm_mission_controller" },
                    Speed = { type = "float", vLocal = 10295 + 14, script = "fm_mission_controller" }
                },

                Bypass = {
                    FingerprintHack = { type = "int", vLocal = 53132,      script = "fm_mission_controller" },
                    KeypadHack      = { type = "int", vLocal = 54198,      script = "fm_mission_controller" },
                    VaultDrill1     = { type = "int", vLocal = 10149 + 7,  script = "fm_mission_controller" },
                    VaultDrill2     = { type = "int", vLocal = 10149 + 37, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 210, script = "gb_casino_heist_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 19791,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19791 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 19791 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 19791 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 28412 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 31668 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            Doomsday = {
                Bypass = {
                    DataHack     = { type = "int", vLocal = 1539,       script = "fm_mission_controller" },
                    DoomsdayHack = { type = "int", vLocal = 1296 + 135, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 209, script = "gb_gang_ops_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 19791,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19791 + 1740 + 1, script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 28412 + 1,        script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 31668 + 1 + 68,   script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 31668 + 97,       script = "fm_mission_controller" }
                }
            },

            SalvageYard = {
                Finish = {
                    CargoShip = {
                        Step1 = { type = "int", vLocal = 7185 + 1,    script = "fm_content_vehrob_cargo_ship" },
                        Step2 = { type = "int", vLocal = 7330 + 1249, script = "fm_content_vehrob_cargo_ship" }
                    },

                    Gangbanger = {
                        Step1 = { type = "int", vLocal = 9011 + 1,    script = "fm_content_vehrob_police" },
                        Step2 = { type = "int", vLocal = 9144 + 1305, script = "fm_content_vehrob_police" }
                    },

                    Duggan = {
                        Step1 = { type = "int", vLocal = 7912 + 1,    script = "fm_content_vehrob_arena" },
                        Step2 = { type = "int", vLocal = 8032 + 1314, script = "fm_content_vehrob_arena" }
                    },

                    Podium = {
                        Step1 = { type = "int", vLocal = 9191 + 1,    script = "fm_content_vehrob_casino_prize" },
                        Step2 = { type = "int", vLocal = 9328 + 1258, script = "fm_content_vehrob_casino_prize" }
                    },

                    McTony = {
                        Step1 = { type = "int", vLocal = 6218 + 1,    script = "fm_content_vehrob_submarine" },
                        Step2 = { type = "int", vLocal = 6356 + 1159, script = "fm_content_vehrob_submarine" }
                    }
                },

                Force  = { type = "int", vLocal = 416, script = "vehrob_planning" },
                Reload = { type = "int", vLocal = 535, script = "vehrob_planning" }
            }
        },

        World = {
            Casino = {
                Blackjack = {
                    Dealer = {
                        FirstCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 1,  script = "blackjack" },
                        SecondCard = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 2,  script = "blackjack" },
                        ThirdCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 3,  script = "blackjack" }
                    },

                    CurrentTable = { type = "int", vLocal = 1798 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
                    VisibleCards = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 12, script = "blackjack" }
                },

                LuckyWheel = {
                    WinState    = { type = "int", vLocal = 302 + 14, script = "casino_lucky_wheel" },
                    PrizeState  = { type = "int", vLocal = 302 + 45, script = "casino_lucky_wheel" }
                },

                Poker = {
                    CurrentTable  = { type = "int", vLocal = 771 + 1 + (PLAYER_ID * 9) + 2, script = "three_card_poker" },
                    Table         = { type = "int", vLocal = 771,                           script = "three_card_poker" },
                    TableSize     = { type = "int", vLocal = 9,                             script = "three_card_poker" },
                    Cards         = { type = "int", vLocal = 138,                           script = "three_card_poker" },
                    CurrentDeck   = { type = "int", vLocal = 168,                           script = "three_card_poker" },
                    AntiCheat     = { type = "int", vLocal = 1060,                          script = "three_card_poker" },
                    AntiCheatDeck = { type = "int", vLocal = 799,                           script = "three_card_poker" },
                    DeckSize      = { type = "int", vLocal = 55,                            script = "three_card_poker" }
                },

                Roulette = {
                    MasterTable   = { type = "int", vLocal = 146,  script = "casinoroulette" },
                    OutcomesTable = { type = "int", vLocal = 1357, script = "casinoroulette" },
                    BallTable     = { type = "int", vLocal = 153,  script = "casinoroulette" }
                },

                Slots = {
                    RandomResultTable = { type = "int", vLocal = 1372, script = "casino_slots" }
                }
            }
        }
    }
end

--#endregion