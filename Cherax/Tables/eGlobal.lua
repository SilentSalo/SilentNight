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
                    Step4 = { type = "int", global = 4718592 + 192451 + 1 },
                    Step5 = { type = "int", global = 4718592 + 3536       }
                },

                Cut            = { type = "int", global = 2686095 + 6783 },
                Difficulty     = { type = "int", global = 4718592 + 3538 },
                IsCasinoFinale = { type = "int", global = 2685153 + 21   }
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
                    Player1 = { type = "int", global = 1980035 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1980035 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1980035 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1980035 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1981147 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1981147 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1981147 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1981147 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1973231 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1973231 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1973231 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1973231 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1977594 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1977594 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1977594 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1977594 + 1 + (3 * 68) + 7 + 4 }
                },

                Board = {
                    Buyer = { type = "int", global = 1973231 + 1497 + 1019 },
                },

                Data = {
                    Target   = { type = "int",  global = 1973197 + 1  },
                    Cameras  = { type = "bool", global = 1973197 + 2  },
                    Patrol   = { type = "bool", global = 1973197 + 3  },
                    Guards   = { type = "int",  global = 1973197 + 4  },
                    NVDs     = { type = "bool", global = 1973197 + 5  },
                    Drills   = { type = "bool", global = 1973197 + 6  },
                    Unknown  = { type = "bool", global = 1973197 + 7  },
                    Buyer    = { type = "int",  global = 1973197 + 8  },
                    Decoy    = { type = "bool", global = 1973197 + 10 },
                    Getaway  = { type = "int",  global = 1973197 + 11 },
                    Gunman   = { type = "int",  global = 1973197 + 13 },
                    Weapons  = { type = "int",  global = 1973197 + 14 },
                    Driver   = { type = "int",  global = 1973197 + 15 },
                    Vehicles = { type = "int",  global = 1973197 + 16 },
                    Hacker   = { type = "int",  global = 1973197 + 17 },
                    Keycards = { type = "int",  global = 1973197 + 18 },
                    Exit     = { type = "int",  global = 1973197 + 20 },
                    Masks    = { type = "int",  global = 1973197 + 21 },
                    Van      = { type = "int",  global = 1973197 + 22 },
                    Infested = { type = "bool", global = 1973197 + 24 },
                    Bitset   = { type = "int",  global = 1973197 + 25 },
                    Gear     = { type = "bool", global = 1973197 + 26 },
                    HardMode = { type = "bool", global = 1973197 + 27 }
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
            }
        },

        Business = {
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708925 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708925 + 1 + 5 * 2 + 1 }
                }
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
            },

            RP = { type = "int", global = 1845299 + 1 + (PLAYER_ID * 883) + 198 + 1 }
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
                    Step4 = { type = "int", global = 4718592 + 185951 + 1 },
                    Step5 = { type = "int", global = 4718592 + 3536       }
                },

                Cut            = { type = "int", global = 2686090 + 6772 },
                Difficulty     = { type = "int", global = 4718592 + 3538 },
                IsCasinoFinale = { type = "int", global = 2685150 + 21   }
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
                    Player1 = { type = "int", global = 1978756 + 831 + 56 + 1 },
                    Player2 = { type = "int", global = 1978756 + 831 + 56 + 2 },
                    Player3 = { type = "int", global = 1978756 + 831 + 56 + 3 },
                    Player4 = { type = "int", global = 1978756 + 831 + 56 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1979868 + 1 + (0 * 27) + 7 + 1 },
                    Player2 = { type = "int", global = 1979868 + 1 + (1 * 27) + 7 + 2 },
                    Player3 = { type = "int", global = 1979868 + 1 + (2 * 27) + 7 + 3 },
                    Player4 = { type = "int", global = 1979868 + 1 + (3 * 27) + 7 + 4 }
                }
            },

            DiamondCasino = {
                Cut = {
                    Player1 = { type = "int", global = 1971952 + 1497 + 736 + 92 + 1 },
                    Player2 = { type = "int", global = 1971952 + 1497 + 736 + 92 + 2 },
                    Player3 = { type = "int", global = 1971952 + 1497 + 736 + 92 + 3 },
                    Player4 = { type = "int", global = 1971952 + 1497 + 736 + 92 + 4 }
                },

                Ready = {
                    Player1 = { type = "int", global = 1976315 + 1 + (0 * 68) + 7 + 1 },
                    Player2 = { type = "int", global = 1976315 + 1 + (1 * 68) + 7 + 2 },
                    Player3 = { type = "int", global = 1976315 + 1 + (2 * 68) + 7 + 3 },
                    Player4 = { type = "int", global = 1976315 + 1 + (3 * 68) + 7 + 4 }
                },

                Board = {
                    Buyer = { type = "int", global = 1971952 + 1497 + 1019 },
                },

                Data = {
                    Target   = { type = "int",  global = 1971918 + 1  },
                    Cameras  = { type = "bool", global = 1971918 + 2  },
                    Patrol   = { type = "bool", global = 1971918 + 3  },
                    Guards   = { type = "int",  global = 1971918 + 4  },
                    NVDs     = { type = "bool", global = 1971918 + 5  },
                    Drills   = { type = "bool", global = 1971918 + 6  },
                    Unknown  = { type = "bool", global = 1971918 + 7  },
                    Buyer    = { type = "int",  global = 1971918 + 8  },
                    Decoy    = { type = "bool", global = 1971918 + 10 },
                    Getaway  = { type = "int",  global = 1971918 + 11 },
                    Gunman   = { type = "int",  global = 1971918 + 13 },
                    Weapons  = { type = "int",  global = 1971918 + 14 },
                    Driver   = { type = "int",  global = 1971918 + 15 },
                    Vehicles = { type = "int",  global = 1971918 + 16 },
                    Hacker   = { type = "int",  global = 1971918 + 17 },
                    Keycards = { type = "int",  global = 1971918 + 18 },
                    Exit     = { type = "int",  global = 1971918 + 20 },
                    Masks    = { type = "int",  global = 1971918 + 21 },
                    Van      = { type = "int",  global = 1971918 + 22 },
                    Infested = { type = "bool", global = 1971918 + 24 },
                    Bitset   = { type = "int",  global = 1971918 + 25 },
                    Gear     = { type = "bool", global = 1971918 + 26 },
                    HardMode = { type = "bool", global = 1971918 + 27 }
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
            }
        },

        Business = {
            Bunker = {
                Production = {
                    Trigger1 = { type = "int",  global = 2708790 + 1 + 5 * 2     },
                    Trigger2 = { type = "bool", global = 2708790 + 1 + 5 * 2 + 1 }
                },
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
            },

            RP = { type = "int", global = 1845250 + 1 + (PLAYER_ID * 880) + 198 + 1 }
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
            }
        }
    }
end

--#endregion
