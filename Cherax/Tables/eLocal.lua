--#region eLocal

if GTA_EDITION == "EE" then
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
                    Finish    = { type = "int", vLocal = 1989 + 1035, script = "gb_smuggler" }
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
                    Step1 = { type = "int", vLocal = 19992 + 15, script = "fmmc_launcher" },
                    Step2 = { type = "int", vLocal = 19992 + 34, script = "fmmc_launcher" },
                },

                Skip = {
                    Old = { type = "int", vLocal = 20391 + 2, script = "fm_mission_controller"      },
                    New = { type = "int", vLocal = 54763 + 2, script = "fm_mission_controller_2020" },
                },

                Finish  = {
                    Old = {
                        Step1 = { type = "int", vLocal = 20391 + 1062,     script = "fm_mission_controller" },
                        Step2 = { type = "int", vLocal = 20391 + 1232 + 1, script = "fm_mission_controller" },
                        Step3 = { type = "int", vLocal = 20391 + 1,        script = "fm_mission_controller" }
                    },

                    New = {
                        Step1 = { type = "int", vLocal = 54763 + 1589,     script = "fm_mission_controller_2020" },
                        Step2 = { type = "int", vLocal = 54763 + 1776 + 1, script = "fm_mission_controller_2020" },
                        Step3 = { type = "int", vLocal = 54763 + 1,        script = "fm_mission_controller_2020" }
                    }
                }
            },

            Agency = {
                Finish = {
                    Step1 = { type = "int", vLocal = 54763 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54763 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            Apartment = {
                Bypass = {
                    Fleeca = {
                        Hack  = { type = "int",   vLocal = 12220 + 24, script = "fm_mission_controller" },
                        Drill = { type = "float", vLocal = 10509 + 11, script = "fm_mission_controller" }
                    },

                    Pacific = {
                        Hack = { type = "int", vLocal = 10213, script = "fm_mission_controller" }
                    }
                },

                Finish = {
                    Step1 = { type = "int", vLocal = 20391,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20391 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 20391 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 20391 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 29011 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 32467 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            AutoShop = {
                Reload = { type = "int", vLocal = 406, script = "tuner_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 54763 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54763 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            CayoPerico = {
                Bypass = {
                    FingerprintHack = { type = "int",   vLocal = 25460,     script = "fm_mission_controller_2020" },
                    PlasmaCutterCut = { type = "float", vLocal = 31525 + 3, script = "fm_mission_controller_2020" },
                    DrainagePipeCut = { type = "int",   vLocal = 30285,     script = "fm_mission_controller_2020" },
                },

                Reload = { type = "int", vLocal = 1568, script = "heist_island_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 54763,            script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54763 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            DiamondCasino = {
                Autograbber = {
                    Grab  = { type =   "int", vLocal = 10695,      script = "fm_mission_controller" },
                    Speed = { type = "float", vLocal = 10695 + 14, script = "fm_mission_controller" }
                },

                Bypass = {
                    FingerprintHack = { type = "int", vLocal = 54037,      script = "fm_mission_controller" },
                    KeypadHack      = { type = "int", vLocal = 55103,      script = "fm_mission_controller" },
                    VaultDrill1     = { type = "int", vLocal = 10509 + 7,  script = "fm_mission_controller" },
                    VaultDrill2     = { type = "int", vLocal = 10509 + 37, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 210, script = "gb_casino_heist_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 20391,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20391 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 20391 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 20391 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 29011 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 32467 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            Doomsday = {
                Bypass = {
                    DataHack     = { type = "int", vLocal = 1539,       script = "fm_mission_controller" },
                    DoomsdayHack = { type = "int", vLocal = 1296 + 135, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 209, script = "gb_gang_ops_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 20391,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 20391 + 1740 + 1, script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 29011 + 1,        script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 32467 + 1 + 68,   script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 32467 + 97,       script = "fm_mission_controller" }
                }
            },

            SalvageYard = {
                Finish = {
                    CargoShip = {
                        Step1 = { type = "int", vLocal = 7163 + 1,    script = "fm_content_vehrob_cargo_ship" },
                        Step2 = { type = "int", vLocal = 7308 + 1249, script = "fm_content_vehrob_cargo_ship" }
                    },

                    Gangbanger = {
                        Step1 = { type = "int", vLocal = 8989 + 1,    script = "fm_content_vehrob_police" },
                        Step2 = { type = "int", vLocal = 9122 + 1305, script = "fm_content_vehrob_police" }
                    },

                    Duggan = {
                        Step1 = { type = "int", vLocal = 7894 + 1,    script = "fm_content_vehrob_arena" },
                        Step2 = { type = "int", vLocal = 8014 + 1314, script = "fm_content_vehrob_arena" }
                    },

                    Podium = {
                        Step1 = { type = "int", vLocal = 9163 + 1,    script = "fm_content_vehrob_casino_prize" },
                        Step2 = { type = "int", vLocal = 9300 + 1258, script = "fm_content_vehrob_casino_prize" }
                    },

                    McTony = {
                        Step1 = { type = "int", vLocal = 6198 + 1,    script = "fm_content_vehrob_submarine" },
                        Step2 = { type = "int", vLocal = 6336 + 1159, script = "fm_content_vehrob_submarine" }
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
                        FirstCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 1, script = "blackjack" },
                        SecondCard = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 2, script = "blackjack" },
                        ThirdCard  = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 3, script = "blackjack" }
                    },

                    CurrentTable = { type = "int", vLocal = 1798 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
                    VisibleCards = { type = "int", vLocal = 138 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1798 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 12, script = "blackjack" }
                },

                LuckyWheel = {
                    WinState    = { type = "int", vLocal = 302 + 14, script = "casino_lucky_wheel" },
                    PrizeState  = { type = "int", vLocal = 302 + 45, script = "casino_lucky_wheel" }
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
else
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
                }
            },

            Hangar = {
                Sell = {
                    Delivered = { type = "int", vLocal = 1987 + 1078, script = "gb_smuggler" },
                    Finish    = { type = "int", vLocal = 1987 + 1035, script = "gb_smuggler" }
                }
            },

            Nightclub = {
                Safe = {
                    Type    = { type = "int", vLocal = 204 + 32 + 2,      script = "am_mp_nightclub" },
                    Collect = { type = "int", vLocal = 204 + 32 + 19 + 1, script = "am_mp_nightclub" }
                }
            }
        },

        Heist = {
            Generic = {
                Launch = {
                    Step1 = { type = "int", vLocal = 19990 + 15, script = "fmmc_launcher" },
                    Step2 = { type = "int", vLocal = 19990 + 34, script = "fmmc_launcher" },
                },

                Skip = {
                    Old = { type = "int", vLocal = 19787 + 2, script = "fm_mission_controller"      },
                    New = { type = "int", vLocal = 54353 + 2, script = "fm_mission_controller_2020" },
                },

                Finish  = {
                    Old = {
                        Step1 = { type = "int", vLocal = 19787 + 1062,     script = "fm_mission_controller" },
                        Step2 = { type = "int", vLocal = 19787 + 1232 + 1, script = "fm_mission_controller" },
                        Step3 = { type = "int", vLocal = 19787 + 1,        script = "fm_mission_controller" }
                    },

                    New = {
                        Step1 = { type = "int", vLocal = 54353 + 1589,     script = "fm_mission_controller_2020" },
                        Step2 = { type = "int", vLocal = 54353 + 1776 + 1, script = "fm_mission_controller_2020" },
                        Step3 = { type = "int", vLocal = 54353 + 1,        script = "fm_mission_controller_2020" }
                    }
                }
            },

            Agency = {
                Finish = {
                    Step1 = { type = "int", vLocal = 54353 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54353 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            Apartment = {
                Bypass = {
                    Fleeca = {
                        Hack  = { type = "int",   vLocal = 11818 + 24, script = "fm_mission_controller" },
                        Drill = { type = "float", vLocal = 10107 + 11, script = "fm_mission_controller" }
                    },

                    Pacific = {
                        Hack = { type = "int", vLocal = 9811, script = "fm_mission_controller" }
                    }
                },

                Finish = {
                    Step1 = { type = "int", vLocal = 19787,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19787 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 19787 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 19787 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 28407 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 31663 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            AutoShop = {
                Reload  = { type = "int", vLocal = 404, script = "tuner_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 54353 + 1,        script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54353 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            CayoPerico = {
                Bypass = {
                    FingerprintHack = { type = "int",   vLocal = 25058,     script = "fm_mission_controller_2020" },
                    PlasmaCutterCut = { type = "float", vLocal = 31123 + 3, script = "fm_mission_controller_2020" },
                    DrainagePipeCut = { type = "int",   vLocal = 29883,     script = "fm_mission_controller_2020" },
                },

                Reload = { type = "int", vLocal = 1566, script = "heist_island_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 54353,            script = "fm_mission_controller_2020" },
                    Step2 = { type = "int", vLocal = 54353 + 1776 + 1, script = "fm_mission_controller_2020" }
                }
            },

            DiamondCasino = {
                Autograbber = {
                    Grab  = { type =   "int", vLocal = 10293,      script = "fm_mission_controller" },
                    Speed = { type = "float", vLocal = 10293 + 14, script = "fm_mission_controller" }
                },

                Bypass = {
                    FingerprintHack = { type = "int", vLocal = 53127,      script = "fm_mission_controller" },
                    KeypadHack      = { type = "int", vLocal = 54193,      script = "fm_mission_controller" },
                    VaultDrill1     = { type = "int", vLocal = 10107 + 7,  script = "fm_mission_controller" },
                    VaultDrill2     = { type = "int", vLocal = 10107 + 37, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 208, script = "gb_casino_heist_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 19787,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19787 + 1062,     script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 19787 + 1740 + 1, script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 19787 + 2686,     script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 28407 + 1,        script = "fm_mission_controller" },
                    Step6 = { type = "int", vLocal = 31663 + 1 + 68,   script = "fm_mission_controller" }
                }
            },

            Doomsday = {
                Bypass = {
                    DataHack     = { type = "int", vLocal = 1537,       script = "fm_mission_controller" },
                    DoomsdayHack = { type = "int", vLocal = 1294 + 135, script = "fm_mission_controller" }
                },

                Reload = { type = "int", vLocal = 207, script = "gb_gang_ops_planning" },

                Finish = {
                    Step1 = { type = "int", vLocal = 19787,            script = "fm_mission_controller" },
                    Step2 = { type = "int", vLocal = 19787 + 1740 + 1, script = "fm_mission_controller" },
                    Step3 = { type = "int", vLocal = 28407 + 1,        script = "fm_mission_controller" },
                    Step4 = { type = "int", vLocal = 31663 + 1 + 68,   script = "fm_mission_controller" },
                    Step5 = { type = "int", vLocal = 31663 + 97,       script = "fm_mission_controller" }
                }
            },

            SalvageYard = {
                Finish = {
                    CargoShip = {
                        Step1 = { type = "int", vLocal = 7161 + 1,    script = "fm_content_vehrob_cargo_ship" },
                        Step2 = { type = "int", vLocal = 7306 + 1249, script = "fm_content_vehrob_cargo_ship" }
                    },

                    Gangbanger = {
                        Step1 = { type = "int", vLocal = 8987 + 1,    script = "fm_content_vehrob_police" },
                        Step2 = { type = "int", vLocal = 9120 + 1305, script = "fm_content_vehrob_police" }
                    },

                    Duggan = {
                        Step1 = { type = "int", vLocal = 7892 + 1,    script = "fm_content_vehrob_arena" },
                        Step2 = { type = "int", vLocal = 8012 + 1314, script = "fm_content_vehrob_arena" }
                    },

                    Podium = {
                        Step1 = { type = "int", vLocal = 9161 + 1,    script = "fm_content_vehrob_casino_prize" },
                        Step2 = { type = "int", vLocal = 9298 + 1258, script = "fm_content_vehrob_casino_prize" }
                    },

                    McTony = {
                        Step1 = { type = "int", vLocal = 6196 + 1,    script = "fm_content_vehrob_submarine" },
                        Step2 = { type = "int", vLocal = 6334 + 1159, script = "fm_content_vehrob_submarine" }
                    }
                },

                Force  = { type = "int", vLocal = 414, script = "vehrob_planning" },
                Reload = { type = "int", vLocal = 533, script = "vehrob_planning" }
            }
        },

        World = {
            Casino = {
                Blackjack = {
                    Dealer = {
                        FirstCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 1,  script = "blackjack" },
                        SecondCard = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 2,  script = "blackjack" },
                        ThirdCard  = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 3,  script = "blackjack" }
                    },

                    CurrentTable = { type = "int", vLocal = 1796 + 1 + (PLAYER_ID * 8) + 4,                                                                 script = "blackjack" },
                    VisibleCards = { type = "int", vLocal = 136 + 846 + 1 + (ScriptLocal.GetInt(J("blackjack"), 1796 + 1 + (PLAYER_ID * 8) + 4)) * 13 + 12, script = "blackjack" }
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
                    RandomResultTable = { type = "int", vLocal = 1370, script = "casino_slots" }
                }
            }
        }
    }
end

--#endregion