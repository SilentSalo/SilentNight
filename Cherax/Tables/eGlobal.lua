if GTA_EDITION == "EE" then
    eGlobal = {
        HAS_PARSED = false,
        Business = {
            Base = {
                OrbitalCannon = {
                    Refund = { type = "int", global = 1963562 }
                }
            },
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708060 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708060 + 1 + 5 * 2 + 1 }
                },
                Multiplier = { type = "float", global = 262145 + 18879 }
            },
            CrateWarehouse = {
                Slot = { type = "int", global = 1845270 + 1 + (PLAYER_ID * 892) + 268 + 120 + 1 + (0 * 3) }
            },
            Nightclub = {
                Safe = {
                    Income = {
                        Top5   = { type = "int", global = 262145 + 23661 },
                        Top100 = { type = "int", global = 262145 + 23680 }
                    },
                    Value = { type = "int", global = 1845270 + 1 + (PLAYER_ID * 892) + 268 + 360 + 5 }
                }
            },
            Supplies = {
                Slot0  = { type = "int", global = 1668003 + 0 + 1 },
                Slot1  = { type = "int", global = 1668003 + 1 + 1 },
                Slot2  = { type = "int", global = 1668003 + 2 + 1 },
                Slot3  = { type = "int", global = 1668003 + 3 + 1 },
                Slot4  = { type = "int", global = 1668003 + 4 + 1 },
                Bunker = { type = "int", global = 1668003 + 5 + 1 },
                Acid   = { type = "int", global = 1668003 + 6 + 1 }
            }
        },
        Heist = {
            Generic = {
                Launch1 = { type = "int", global = 4718592 + 3526       },
                Launch2 = { type = "int", global = 4718592 + 3527       },
                Launch3 = { type = "int", global = 4718592 + 3529 + 1   },
                Launch4 = { type = "int", global = 4718592 + 187365 + 1 },
                Cut     = { type = "int", global = 2685663 + 6662       }
            },
            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1929794 + 1 + 1    },
                        Local  = { type = "int", global = 1931762 + 3008 + 1 }
                    },
                    Player2 = {
                        Global = { type = "int", global = 1929794 + 1 + 2    },
                        Local  = { type = "int", global = 1931762 + 3008 + 2 }
                    },
                    Player3 = {
                        Global = { type = "int", global = 1929794 + 1 + 3    },
                        Local  = { type = "int", global = 1931762 + 3008 + 3 }
                    },
                    Player4 = {
                        Global = { type = "int", global = 1929794 + 1 + 4    },
                        Local  = { type = "int", global = 1931762 + 3008 + 4 }
                    }
                },
                Ready  = {
                    Player1 = { type = "int", global = 2657994 + 1 + (0 * 467) + 269 },
                    Player2 = { type = "int", global = 2657994 + 1 + (1 * 467) + 269 },
                    Player3 = { type = "int", global = 2657994 + 1 + (2 * 467) + 269 },
                    Player4 = { type = "int", global = 2657994 + 1 + (3 * 467) + 269 }
                },
                Reload   = { type = "int", global = 1929829                                 },
                Jobs     = { type = "int", global = 1877562 + 1 + (PLAYER_ID * 77 + 1) + 76 },
                Cooldown = { type = "int", global = 1877562 + 1 + (PLAYER_ID * 77) + 76     },
                Heist    = {
                    Type       = { type = "int", global = 1877562 + (PLAYER_ID * 77) + 24 + 2 },
                    Difficulty = { type = "int", global = 4718592 + 3525                      }
                }
            },
            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1973698 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1973698 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1973698 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1973698 + 831 + 56 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1974810 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1974810 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1974810 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1974810 + 1 + (3 * 27) + 7 + 4 }
                }
            },
            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1966898 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1966898 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1966898 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1966898 + 1497 + 736 + 92 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1971261 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1971261 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1971261 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1971261 + 1 + (3 * 68) + 7 + 4 }
                }
            },
            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1962078 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1962078 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1962078 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1962078 + 812 + 50 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1882925 + 1 + (0 * 149) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882925 + 1 + (1 * 149) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882925 + 1 + (2 * 149) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882925 + 1 + (3 * 149) + 43 + 11 + 4 },
                }
            },
            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33525 + 1 }
                    },
                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33525 + 2 }
                    },
                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33525 + 3 }
                    }
                },
                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33533 + 1 },
                        Value   = { type = "int",  global = 262145 + 33537 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33529 + 1 }
                    },
                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33533 + 2 },
                        Value   = { type = "int",  global = 262145 + 33537 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33529 + 2 }
                    },
                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33533 + 3 },
                        Value   = { type = "int",  global = 262145 + 33537 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33529 + 3 }
                    },
                    SalvageValueMultiplier = { type = "float", global = 262145 + 33545 }
                }
            }
        },
        Player = {
            Cash = {
                Remove = { type = "int", global = 2707816 + 36 }
            },
            Collectible = {
                ActionFigures = { type = "int", global = 2708543 + 209 },
                LdOrganics    = { type = "int", global = 2708543 + 421 },
                PlayingCards  = { type = "int", global = 2708543 + 210 },
                SignalJammers = { type = "int", global = 2708543 + 216 },
                Snowmen       = { type = "int", global = 2708543 + 531 },
                MovieProps    = { type = "int", global = 2708543 + 418 },
                JackOLanterns = { type = "int", global = 2708543 + 522 }
            },
            Property = { type = "int", global = 2657994 + 1 + (PLAYER_ID * 467) + 324 + 8 }
        },
        Session = {
            Type   = { type = "int", global = 1575036     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },
        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "int", global = 1966467 }
                }
            },
            GunVan = {
                Location = { type = "int", global = 2652571 + 2706 + 1 }
            },
            Multiplier = {
                Cash = { type = "float", global = 262145     },
                Xp   = { type = "float", global = 262145 + 1 }
            }
        }
    }
else
    eGlobal = {
        HAS_PARSED = false,
        Business = {
            Base = {
                OrbitalCannon = {
                    Refund = { type = "int", global = 1962995 }
                }
            },
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2707927 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2707927 + 1 + 5 * 2 + 1 }
                },
                Multiplier = { type = "float", global = 262145 + 18875 }
            },
            CrateWarehouse = {
                Slot = { type = "int", global = 1845221 + 1 + (PLAYER_ID * 889) + 268 + 120 + 1 + (0 * 3) }
            },
            Nightclub = {
                Safe = {
                    Income = {
                        Top5   = { type = "int", global = 262145 + 23657 },
                        Top100 = { type = "int", global = 262145 + 23676 }
                    },
                    Value = { type = "int", global = 1845221 + 1 + (PLAYER_ID * 889) + 268 + 360 + 5 }
                }
            },
            Supplies = {
                Slot0  = { type = "int", global = 1667996 + 0 + 1 },
                Slot1  = { type = "int", global = 1667996 + 1 + 1 },
                Slot2  = { type = "int", global = 1667996 + 2 + 1 },
                Slot3  = { type = "int", global = 1667996 + 3 + 1 },
                Slot4  = { type = "int", global = 1667996 + 4 + 1 },
                Bunker = { type = "int", global = 1667996 + 5 + 1 },
                Acid   = { type = "int", global = 1667996 + 6 + 1 }
            }
        },
        Heist = {
            Generic = {
                Launch1 = { type = "int", global = 4718592 + 3526       },
                Launch2 = { type = "int", global = 4718592 + 3527       },
                Launch3 = { type = "int", global = 4718592 + 3529 + 1   },
                Launch4 = { type = "int", global = 4718592 + 180865 + 1 },
                Cut     = { type = "int", global = 2685658 + 6651       }
            },
            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1929317 + 1 + 1    },
                        Local  = { type = "int", global = 1931285 + 3008 + 1 }
                    },
                    Player2 = {
                        Global = { type = "int", global = 1929317 + 1 + 2    },
                        Local  = { type = "int", global = 1931285 + 3008 + 2 }
                    },
                    Player3 = {
                        Global = { type = "int", global = 1929317 + 1 + 3    },
                        Local  = { type = "int", global = 1931285 + 3008 + 3 }
                    },
                    Player4 = {
                        Global = { type = "int", global = 1929317 + 1 + 4    },
                        Local  = { type = "int", global = 1931285 + 3008 + 4 }
                    }
                },
                Ready  = {
                    Player1 = { type = "int", global = 2657991 + 1 + (0 * 467) + 269 },
                    Player2 = { type = "int", global = 2657991 + 1 + (1 * 467) + 269 },
                    Player3 = { type = "int", global = 2657991 + 1 + (2 * 467) + 269 },
                    Player4 = { type = "int", global = 2657991 + 1 + (3 * 467) + 269 }
                },
                Reload   = { type = "int", global = 1929352                                 },
                Jobs     = { type = "int", global = 1877417 + 1 + (PLAYER_ID * 77 + 1) + 76 },
                Cooldown = { type = "int", global = 1877417 + 1 + (PLAYER_ID * 77) + 76     },
                Heist    = {
                    Type       = { type = "int", global = 1877417 + (PLAYER_ID * 77) + 24 + 2 },
                    Difficulty = { type = "int", global = 4718592 + 3525                      }
                }
    
            },
            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1972414 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1972414 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1972414 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1972414 + 831 + 56 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1973526 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1973526 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1973526 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1973526 + 1 + (3 * 27) + 7 + 4 }
                }
            },
            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1965614 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1965614 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1965614 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1965614 + 1497 + 736 + 92 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1969977 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1969977 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1969977 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1969977 + 1 + (3 * 68) + 7 + 4 }
                }
            },
            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1961513 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1961513 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1961513 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1961513 + 812 + 50 + 4 }
                },
                Ready  = {
                    Player1 = { type = "int", global = 1882780 + 1 + (0 * 146) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882780 + 1 + (1 * 146) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882780 + 1 + (2 * 146) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882780 + 1 + (3 * 146) + 43 + 11 + 4 },
                }
            },
            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33023 + 1 }
                    },
                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33023 + 2 }
                    },
                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33023 + 3 }
                    }
                },
                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33031 + 1 },
                        Value   = { type = "int",  global = 262145 + 33035 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33027 + 1 }
                    },
                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33031 + 2 },
                        Value   = { type = "int",  global = 262145 + 33035 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33027 + 2 }
                    },
                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33031 + 3 },
                        Value   = { type = "int",  global = 262145 + 33035 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33027 + 3 }
                    },
                    SalvageValueMultiplier = { type = "float", global = 262145 + 33043 }
                }
            }
        },
        Player = {
            Cash = {
                Remove = { type = "int", global = 2707701 + 36 }
            },
            Collectible = {
                ActionFigures = { type = "int", global = 2708410 + 209 },
                LdOrganics    = { type = "int", global = 2708410 + 421 },
                PlayingCards  = { type = "int", global = 2708410 + 210 },
                SignalJammers = { type = "int", global = 2708410 + 216 },
                Snowmen       = { type = "int", global = 2708410 + 531 },
                MovieProps    = { type = "int", global = 2708410 + 418 },
                JackOLanterns = { type = "int", global = 2708410 + 522 }
            },
            Property = { type = "int", global = 2657991 + 1 + (PLAYER_ID * 467) + 324 + 8 }
        },
        Session = {
            Type   = { type = "int", global = 1575036     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },
        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "int", global = 1965183 }
                }
            },
            GunVan = {
                Location = { type = "int", global = 2652568 + 2706 + 1 }
            },
            Multiplier = {
                Cash = { type = "float", global = 262145     },
                Xp   = { type = "float", global = 262145 + 1 }
            }
        }
    }    
end
