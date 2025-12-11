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
                    Step4 = { type = "int", global = 4718592 + 192451 + 1 }
                },

                Cut        = { type = "int", global = 2686095 + 6783 },
                Difficulty = { type = "int", global = 4718592 + 3538 }
            },

            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1936013 + 1 + 1    },
                        Local  = { type = "int", global = 1937981 + 3008 + 1 }
                    },

                    Player2 = {
                        Global = { type = "int", global = 1936013 + 1 + 2    },
                        Local  = { type = "int", global = 1937981 + 3008 + 2 }
                    },

                    Player3 = {
                        Global = { type = "int", global = 1936013 + 1 + 3    },
                        Local  = { type = "int", global = 1937981 + 3008 + 3 }
                    },

                    Player4 = {
                        Global = { type = "int", global = 1936013 + 1 + 4    },
                        Local  = { type = "int", global = 1937981 + 3008 + 4 }
                    }
                },

                Ready = {
                    Player1 = { type = "int", global = 2658294 + 1 + (0 * 468) + 270 },
                    Player2 = { type = "int", global = 2658294 + 1 + (1 * 468) + 270 },
                    Player3 = { type = "int", global = 2658294 + 1 + (2 * 468) + 270 },
                    Player4 = { type = "int", global = 2658294 + 1 + (3 * 468) + 270 }
                },

                Reload   = { type = "int", global = 1936048                             },
                Cooldown = { type = "int", global = 1877303 + 1 + (PLAYER_ID * 77) + 76 }
            },

            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1980034 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1980034 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1980034 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1980034 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 2640831 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 2640831 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 2640831 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 2640831 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1973230 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1973230 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1973230 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1973230 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1977593 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1977593 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1977593 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1977593 + 1 + (3 * 68) + 7 + 4 }
                }
            },

            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1968543 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1968543 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1968543 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1968543 + 812 + 50 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1882717 + 1 + (0 * 315) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882717 + 1 + (1 * 315) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882717 + 1 + (2 * 315) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882717 + 1 + (3 * 315) + 43 + 11 + 4 },
                }
            },

            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33613 + 1 }
                    },

                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33613 + 2 }
                    },

                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33613 + 3 }
                    }
                },

                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33621 + 1 },
                        Value   = { type = "int",  global = 262145 + 33625 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33617 + 1 }
                    },

                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33621 + 2 },
                        Value   = { type = "int",  global = 262145 + 33625 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33617 + 2 }
                    },

                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33621 + 3 },
                        Value   = { type = "int",  global = 262145 + 33625 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33617 + 3 }
                    },

                    SalvageValueMultiplier = { type = "float", global = 262145 + 33633 }
                }
            }
        },

        Business = {
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708925 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708925 + 1 + 5 * 2 + 1 }
                },

                Multiplier = { type = "float", global = 262145 + 18968 }
            },

            Nightclub = {
                Safe = {
                    Collect = { type = "bool", global = 2708832 },

                    Income = {
                        Top5   = { type = "int", global = 262145 + 23750 },
                        Top100 = { type = "int", global = 262145 + 23769 }
                    },

                    Value = { type = "int", global = 1845299 + 1 + (PLAYER_ID * 883) + 260 + 364 + 5 }
                }
            },

            Supplies = {
                Slot0  = { type = "int", global = 1673814 + 0 + 1 },
                Slot1  = { type = "int", global = 1673814 + 1 + 1 },
                Slot2  = { type = "int", global = 1673814 + 2 + 1 },
                Slot3  = { type = "int", global = 1673814 + 3 + 1 },
                Slot4  = { type = "int", global = 1673814 + 4 + 1 },
                Bunker = { type = "int", global = 1673814 + 5 + 1 },
                Acid   = { type = "int", global = 1673814 + 6 + 1 }
            }
        },

        Player = {
            Cash = {
                Remove = { type = "int", global = 2708668 + 36 }
            },

            Organization = {
                CEO  = { type = "int", global = 1892798 + 1 + (PLAYER_ID * 615) + 10       },
                Type = { type = "int", global = 1892798 + 1 + (PLAYER_ID * 615) + 10 + 433 }
            }
        },

        Session = {
            Type   = { type = "int", global = 1575044     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },

        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "bool", global = 1972794 }
                }
            },

            Kosatka = {
                Request = { type = "int", global = 2733138 + 613                             },
                Status  = { type = "int", global = 2658294 + 1 + (PLAYER_ID * 468) + 325 + 4 }
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
                    Step4 = { type = "int", global = 4718592 + 185951 + 1 }
                },

                Cut        = { type = "int", global = 2686090 + 6772 },
                Difficulty = { type = "int", global = 4718592 + 3538 }
            },

            Apartment = {
                Cut = {
                    Player1 = {
                        Global = { type = "int", global = 1935536 + 1 + 1    },
                        Local  = { type = "int", global = 1937504 + 3008 + 1 }
                    },

                    Player2 = {
                        Global = { type = "int", global = 1935536 + 1 + 2    },
                        Local  = { type = "int", global = 1937504 + 3008 + 2 }
                    },

                    Player3 = {
                        Global = { type = "int", global = 1935536 + 1 + 3    },
                        Local  = { type = "int", global = 1937504 + 3008 + 3 }
                    },

                    Player4 = {
                        Global = { type = "int", global = 1935536 + 1 + 4    },
                        Local  = { type = "int", global = 1937504 + 3008 + 4 }
                    }
                },

                Ready = {
                    Player1 = { type = "int", global = 2658291 + 1 + (0 * 468) + 270 },
                    Player2 = { type = "int", global = 2658291 + 1 + (1 * 468) + 270 },
                    Player3 = { type = "int", global = 2658291 + 1 + (2 * 468) + 270 },
                    Player4 = { type = "int", global = 2658291 + 1 + (3 * 468) + 270 }
                },

                Reload     = { type = "int", global = 1935571                             },
                Cooldown   = { type = "int", global = 1877158 + 1 + (PLAYER_ID * 77) + 76 }
            },

            CayoPerico = {
                Cut = {
                    Player1 = { type = "int", global = 1978755 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1978755 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1978755 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1978755 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1979867 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1979867 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1979867 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1979867 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1971951 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1971951 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1971951 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1971951 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1976314 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1976314 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1976314 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1976314 + 1 + (3 * 68) + 7 + 4 }
                }
            },

            Doomsday = {
                Cut = {
                    Player1 = { type = "int", global = 1967983 + 812 + 50 + 1 },
                    Player2 = { type = "int", global = 1967983 + 812 + 50 + 2 },
                    Player3 = { type = "int", global = 1967983 + 812 + 50 + 3 },
                    Player4 = { type = "int", global = 1967983 + 812 + 50 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1882572 + 1 + (0 * 315) + 43 + 11 + 1 },
                    Player2 = { type = "int", global = 1882572 + 1 + (1 * 315) + 43 + 11 + 2 },
                    Player3 = { type = "int", global = 1882572 + 1 + (2 * 315) + 43 + 11 + 3 },
                    Player4 = { type = "int", global = 1882572 + 1 + (3 * 315) + 43 + 11 + 4 },
                }
            },

            SalvageYard = {
                Robbery = {
                    Slot1 = {
                        Type = { type = "int", global = 262145 + 33111 + 1 }
                    },

                    Slot2 = {
                        Type = { type = "int", global = 262145 + 33111 + 2 }
                    },

                    Slot3 = {
                        Type = { type = "int", global = 262145 + 33111 + 3 }
                    }
                },

                Vehicle = {
                    Slot1 = {
                        Type    = { type = "int",  global = 262145 + 33119 + 1 },
                        Value   = { type = "int",  global = 262145 + 33123 + 1 },
                        CanKeep = { type = "bool", global = 262145 + 33115 + 1 }
                    },

                    Slot2 = {
                        Type    = { type = "int",  global = 262145 + 33119 + 2 },
                        Value   = { type = "int",  global = 262145 + 33123 + 2 },
                        CanKeep = { type = "bool", global = 262145 + 33115 + 2 }
                    },

                    Slot3 = {
                        Type    = { type = "int",  global = 262145 + 33119 + 3 },
                        Value   = { type = "int",  global = 262145 + 33123 + 3 },
                        CanKeep = { type = "bool", global = 262145 + 33115 + 3 }
                    },

                    SalvageValueMultiplier = { type = "float", global = 262145 + 33131 }
                }
            }
        },

        Business = {
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708790 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708790 + 1 + 5 * 2 + 1 }
                },

                Multiplier = { type = "float", global = 262145 + 18964 }
            },

            Nightclub = {
                Safe = {
                    Income = {
                        Top5   = { type = "int", global = 262145 + 23746 },
                        Top100 = { type = "int", global = 262145 + 23765 }
                    },

                    Value = { type = "int", global = 1845250 + 1 + (PLAYER_ID * 880) + 260 + 364 + 5 }
                }
            },

            Supplies = {
                Slot0  = { type = "int", global = 1673807 + 0 + 1 },
                Slot1  = { type = "int", global = 1673807 + 1 + 1 },
                Slot2  = { type = "int", global = 1673807 + 2 + 1 },
                Slot3  = { type = "int", global = 1673807 + 3 + 1 },
                Slot4  = { type = "int", global = 1673807 + 4 + 1 },
                Bunker = { type = "int", global = 1673807 + 5 + 1 },
                Acid   = { type = "int", global = 1673807 + 6 + 1 }
            }
        },

        Player = {
            Cash = {
                Remove = { type = "int", global = 2708554 + 36 }
            },

            Organization = {
                CEO  = { type = "int", global = 1892653 + 1 + (PLAYER_ID * 615) + 10       },
                Type = { type = "int", global = 1892653 + 1 + (PLAYER_ID * 615) + 10 + 433 }
            }
        },

        Session = {
            Type   = { type = "int", global = 1575042     },
            Switch = { type = "int", global = 1574589     },
            Quit   = { type = "int", global = 1574589 + 2 }
        },

        World = {
            Casino = {
                Chips = {
                    Bonus = { type = "bool", global = 1971515 }
                }
            },

            Kosatka = {
                Request = { type = "int", global = 2733002 + 613                             },
                Status  = { type = "int", global = 2658291 + 1 + (PLAYER_ID * 468) + 325 + 4 }
            },

            Multiplier = {
                Cash = { type = "float", global = 262145     },
                Xp   = { type = "float", global = 262145 + 1 }
            }
        }
    }
end

--#endregion
