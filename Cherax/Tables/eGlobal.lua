--#region eGlobal

if GTA_EDITION == "EE" then
    eGlobal = {
        HAS_PARSED = false,

        Heist = {
            Generic = {
                Launch = {
                    Step1 = { type = "int", global = 4718592 + 3539       },
                    Step2 = { type = "int", global = 4718592 + 3540       },
                    Step3 = { type = "int", global = 4718592 + 3542 + 1   },
                    Step4 = { type = "int", global = 4718592 + 190507 + 1 }
                },

                Cut        = { type = "int", global = 2685690 + 6753 },
                Difficulty = { type = "int", global = 4718592 + 3538 }
            },

            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1931800 + 1 + 1    },
                        Local  = { type = "int", global = 1933768 + 3008 + 1 }
                    },

                    Player2 = {
                        Global = { type = "int", global = 1931800 + 1 + 2    },
                        Local  = { type = "int", global = 1933768 + 3008 + 2 }
                    },

                    Player3 = {
                        Global = { type = "int", global = 1931800 + 1 + 3    },
                        Local  = { type = "int", global = 1933768 + 3008 + 3 }
                    },

                    Player4 = {
                        Global = { type = "int", global = 1931800 + 1 + 4    },
                        Local  = { type = "int", global = 1933768 + 3008 + 4 }
                    }
                },

                Ready = {
                    Player1 = { type = "int", global = 2658019 + 1 + (0 * 467) + 269 },
                    Player2 = { type = "int", global = 2658019 + 1 + (1 * 467) + 269 },
                    Player3 = { type = "int", global = 2658019 + 1 + (2 * 467) + 269 },
                    Player4 = { type = "int", global = 2658019 + 1 + (3 * 467) + 269 }
                },

                Reload   = { type = "int", global = 1931835                             },
                Cooldown = { type = "int", global = 1877086 + 1 + (PLAYER_ID * 77) + 76 }
            },

            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1975799 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1975799 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1975799 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1975799 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1976911 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1976911 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1976911 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1976911 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1968996 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1968996 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1968996 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1968996 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1973359 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1973359 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1973359 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1973359 + 1 + (3 * 68) + 7 + 4 }
                }
            },

            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1964170 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1964170 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1964170 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1964170 + 812 + 50 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1882449 + 1 + (0 * 149) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882449 + 1 + (1 * 149) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882449 + 1 + (2 * 149) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882449 + 1 + (3 * 149) + 43 + 11 + 4 },
                }
            },

            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33524 + 1 }
                    },

                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33524 + 2 }
                    },

                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33524 + 3 }
                    }
                },

                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33532 + 1 },
                        Value   = { type = "int",  global = 262145 + 33536 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33528 + 1 }
                    },

                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33532 + 2 },
                        Value   = { type = "int",  global = 262145 + 33536 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33528 + 2 }
                    },

                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33532 + 3 },
                        Value   = { type = "int",  global = 262145 + 33536 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33528 + 3 }
                    },

                    SalvageValueMultiplier = { type = "float", global = 262145 + 33544 }
                }
            }
        },

        Business = {
            Base = {
                OrbitalCannon = {
                    Refund = { type = "int", global = 1963562 }
                }
            },

            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708294 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708294 + 1 + 5 * 2 + 1 }
                },

                Multiplier = { type = "float", global = 262145 + 18879 }
            },

            Nightclub = {
                Safe = {
                    Collect = { type = "bool", global = 2708201 },

                    Income = {
                        Top5   = { type = "int", global = 262145 + 23661 },
                        Top100 = { type = "int", global = 262145 + 23680 }
                    },

                    Value = { type = "int", global = 1845274 + 1 + (PLAYER_ID * 877) + 260 + 358 + 5 }
                }
            },

            Supplies = {
                Slot0  = { type = "int", global = 1668007 + 0 + 1 },
                Slot1  = { type = "int", global = 1668007 + 1 + 1 },
                Slot2  = { type = "int", global = 1668007 + 2 + 1 },
                Slot3  = { type = "int", global = 1668007 + 3 + 1 },
                Slot4  = { type = "int", global = 1668007 + 4 + 1 },
                Bunker = { type = "int", global = 1668007 + 5 + 1 },
                Acid   = { type = "int", global = 1668007 + 6 + 1 }
            }
        },

        Player = {
            Cash = {
                Remove = { type = "int", global = 2708037 + 36 }
            },

            Organization = {
                CEO  = { type = "int", global = 1888882 + 1 + (PLAYER_ID * 611) + 10       },
                Type = { type = "int", global = 1888882 + 1 + (PLAYER_ID * 611) + 10 + 431 }
            }
        },

        Session = {
            Type   = { type = "int", global = 1575040     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },

        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "bool", global = 1968565 }
                }
            },

            Kosatka = {
                Request = { type = "int", global = 2740191 + 992                             },
                Status  = { type = "int", global = 2658019 + 1 + (PLAYER_ID * 467) + 324 + 4 }
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

        Heist = {
            Generic = {
                Launch = {
                    Step1 = { type = "int", global = 4718592 + 3539       },
                    Step2 = { type = "int", global = 4718592 + 3540       },
                    Step3 = { type = "int", global = 4718592 + 3542 + 1   },
                    Step4 = { type = "int", global = 4718592 + 184007 + 1 }
                },

                Cut        = { type = "int", global = 2685685 + 6742 },
                Difficulty = { type = "int", global = 4718592 + 3538 }
            },

            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1931323 + 1 + 1    },
                        Local  = { type = "int", global = 1933291 + 3008 + 1 }
                    },

                    Player2 = {
                        Global = { type = "int", global = 1931323 + 1 + 2    },
                        Local  = { type = "int", global = 1933291 + 3008 + 2 }
                    },

                    Player3 = {
                        Global = { type = "int", global = 1931323 + 1 + 3    },
                        Local  = { type = "int", global = 1933291 + 3008 + 3 }
                    },

                    Player4 = {
                        Global = { type = "int", global = 1931323 + 1 + 4    },
                        Local  = { type = "int", global = 1933291 + 3008 + 4 }
                    }
                },

                Ready = {
                    Player1 = { type = "int", global = 2658016 + 1 + (0 * 467) + 269 },
                    Player2 = { type = "int", global = 2658016 + 1 + (1 * 467) + 269 },
                    Player3 = { type = "int", global = 2658016 + 1 + (2 * 467) + 269 },
                    Player4 = { type = "int", global = 2658016 + 1 + (3 * 467) + 269 }
                },

                Reload     = { type = "int", global = 1931358                             },
                Cooldown   = { type = "int", global = 1876941 + 1 + (PLAYER_ID * 77) + 76 }
            },

            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1974520 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1974520 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1974520 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1974520 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1975632 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1975632 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1975632 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1975632 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1967717 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1967717 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1967717 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1967717 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1972080 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1972080 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1972080 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1972080 + 1 + (3 * 68) + 7 + 4 }
                }
            },

            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1963610 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1963610 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1963610 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1963610 + 812 + 50 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1882304 + 1 + (0 * 146) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882304 + 1 + (1 * 146) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882304 + 1 + (2 * 146) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882304 + 1 + (3 * 146) + 43 + 11 + 4 },
                }
            },

            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33022 + 1 }
                    },

                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33022 + 2 }
                    },

                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33022 + 3 }
                    }
                },

                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33030 + 1 },
                        Value   = { type = "int",  global = 262145 + 33034 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33026 + 1 }
                    },

                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33030 + 2 },
                        Value   = { type = "int",  global = 262145 + 33034 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33026 + 2 }
                    },

                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33030 + 3 },
                        Value   = { type = "int",  global = 262145 + 33034 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33026 + 3 }
                    },

                    SalvageValueMultiplier = { type = "float", global = 262145 + 33042 }
                }
            }
        },

        Business = {
            Base = {
                OrbitalCannon = {
                    Refund = { type = "int", global = 1962995 }
                }
            },

            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708158 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708158 + 1 + 5 * 2 + 1 }
                },

                Multiplier = { type = "float", global = 262145 + 18875 }
            },

            Nightclub = {
                Safe = {
                    Income = {
                        Top5   = { type = "int", global = 262145 + 23657 },
                        Top100 = { type = "int", global = 262145 + 23676 }
                    },

                    Value = { type = "int", global = 1845225 + 1 + (PLAYER_ID * 874) + 260 + 358 + 5 }
                }
            },

            Supplies = {
                Slot0  = { type = "int", global = 1668000 + 0 + 1 },
                Slot1  = { type = "int", global = 1668000 + 1 + 1 },
                Slot2  = { type = "int", global = 1668000 + 2 + 1 },
                Slot3  = { type = "int", global = 1668000 + 3 + 1 },
                Slot4  = { type = "int", global = 1668000 + 4 + 1 },
                Bunker = { type = "int", global = 1668000 + 5 + 1 },
                Acid   = { type = "int", global = 1668000 + 6 + 1 }
            }
        },

        Player = {
            Cash = {
                Remove = { type = "int", global = 2707922 + 36 }
            },

            Organization = {
                CEO  = { type = "int", global = 1888737 + 1 + (PLAYER_ID * 611) + 10       },
                Type = { type = "int", global = 1888737 + 1 + (PLAYER_ID * 611) + 10 + 431 }
            }
        },

        Session = {
            Type   = { type = "int", global = 1575038     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },

        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "bool", global = 1967286 }
                }
            },

            Kosatka = {
                Request = { type = "int", global = 2740054 + 992                             },
                Status  = { type = "int", global = 2658016 + 1 + (PLAYER_ID * 467) + 324 + 4 }
            },

            Multiplier = {
                Cash = { type = "float", global = 262145     },
                Xp   = { type = "float", global = 262145 + 1 }
            }
        }
    }
end

--#endregion
