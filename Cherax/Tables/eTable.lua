--#region eTable

eTable = {
    HAS_PARSED = false,

    Business = {
        Hangar = {
            Cargoes = {
                { name = "Animal Materials",  index = 1 },
                { name = "Art n Antiques",    index = 2 },
                { name = "Chemicals",         index = 3 },
                { name = "Counterfeit Goods", index = 4 },
                { name = "Jewel n Gems",      index = 5 },
                { name = "Medical Supplies",  index = 6 },
                { name = "Narcotics",         index = 7 },
                { name = "Tabacco n Alcohol", index = 8 },
            }
        },

        Nightclub = {
            Cargoes = {
                { name = "Cargo n Shipments",  index = "HUB_PROD_TOTAL_0" },
                { name = "Sporting Goods",     index = "HUB_PROD_TOTAL_1" },
                { name = "S.A. Imports",       index = "HUB_PROD_TOTAL_2" },
                { name = "Pharmac. Research",  index = "HUB_PROD_TOTAL_3" },
                { name = "Organic Produce",    index = "HUB_PROD_TOTAL_4" },
                { name = "Printing n Copying", index = "HUB_PROD_TOTAL_5" },
                { name = "Cash Creation",      index = "HUB_PROD_TOTAL_6" },
            }
        },

        Supplies = {}
    },

    Heist = {
        Agency = {
            Contracts = {
                { name = "None",           index = 3    },
                { name = "Nightclub",      index = 4    },
                { name = "Marina",         index = 12   },
                { name = "Nightlife Leak", index = 28   },
                { name = "Country Club",   index = 60   },
                { name = "Guest List",     index = 123  },
                { name = "High Soc. Leak", index = 254  },
                { name = "Davis",          index = 508  },
                { name = "Ballas",         index = 1020 },
                { name = "Sou. Cen. Leak", index = 2044 },
                { name = "Studio Time",    index = 2045 },
                { name = "Don't # W. Dre", index = 4095 }
            }
        },

        Apartment = {
            Presets = {
                { name = "All - 0%",    index = 0   },
                { name = "All - 85%",   index = 85  },
                { name = "All - 100%",  index = 100 },
                { name = "3mil Payout", index = -1  }
            },

            Heists = {
                FleecaJob   = "hK5OgJk1BkinXGGXghhTMg",
                PrisonBreak = "7-w96-PU4kSevhtG5YwUHQ",
                HumaneLabs  = "BWsCWtmnvEWXBrprK9hDHA",
                SeriesA     = "20Lu41Px20OJMPdZ6wXG3g",
                PacificJob  = "zCxFg29teE2ReKGnr0L4Bg"
            },

            Files = {}
        },

        AutoShop = {
            Contracts = {
                { name = "None",            index = -1 },
                { name = "Union Deposit.",  index = 0  },
                { name = "Superdol. Deal",  index = 1  },
                { name = "Bank Contract",   index = 2  },
                { name = "ECU Job",         index = 3  },
                { name = "Prison Contrac.", index = 4  },
                { name = "Agency Deal",     index = 5  },
                { name = "Lost Contract",   index = 6  },
                { name = "Data Contract",   index = 7  }
            }
        },

        CayoPerico = {
            Difficulties = {
                { name = "Normal", index = 126823 },
                { name = "Hard",   index = 131055 }
            },

            Approaches = {
                { name = "Kosatka",        index = 65283 },
                { name = "Alkonost",       index = 65413 },
                { name = "Velum",          index = 65289 },
                { name = "Stealth Annih.", index = 65425 },
                { name = "Patrol Boat",    index = 65313 },
                { name = "Longfin",        index = 65345 },
                { name = "All Ways",       index = 65535 }
            },

            Loadouts = {
                { name = "Aggressor",   index = 1 },
                { name = "Conspirator", index = 2 },
                { name = "Crackshot",   index = 3 },
                { name = "Saboteur",    index = 4 },
                { name = "Marksman",    index = 5 },
            },

            Targets = {
                Primary = {
                    { name = "Sinsimito Tequil.", index = 0 },
                    { name = "Ruby Necklace",     index = 1 },
                    { name = "Bearer Bonds",      index = 2 },
                    { name = "Pink Diamond",      index = 3 },
                    { name = "Madrazo Files",     index = 4 },
                    { name = "Panther Statue",    index = 5 }
                },
                Secondary = {
                    { name = "None", index = 0      },
                    { name = "Cash", index = "CASH" },
                    { name = "Weed", index = "WEED" },
                    { name = "Coke", index = "COKE" },
                    { name = "Gold", index = "GOLD" }
                },
                Amounts = {
                    Compound = {
                        { name = "Empty", index = 0   },
                        { name = "Full",  index = 255 },
                        { name = "1",     index = 128 },
                        { name = "2",     index = 64  },
                        { name = "3",     index = 196 },
                        { name = "4",     index = 204 },
                        { name = "5",     index = 220 },
                        { name = "6",     index = 252 },
                        { name = "7",     index = 253 }
                    },
                    Island = {
                        { name = "Empty", index = 0        },
                        { name = "Full",  index = 16777215 },
                        { name = "1",     index = 8388608  },
                        { name = "2",     index = 12582912 },
                        { name = "3",     index = 12845056 },
                        { name = "4",     index = 12976128 },
                        { name = "5",     index = 13500416 },
                        { name = "6",     index = 14548992 },
                        { name = "7",     index = 16646144 },
                        { name = "8",     index = 16711680 },
                        { name = "9",     index = 16744448 },
                        { name = "10",    index = 16760832 },
                        { name = "11",    index = 16769024 },
                        { name = "12",    index = 16769536 },
                        { name = "13",    index = 16770560 },
                        { name = "14",    index = 16770816 },
                        { name = "15",    index = 16770880 },
                        { name = "16",    index = 16771008 },
                        { name = "17",    index = 16773056 },
                        { name = "18",    index = 16777152 },
                        { name = "19",    index = 16777184 },
                        { name = "20",    index = 16777200 },
                        { name = "21",    index = 16777202 },
                        { name = "22",    index = 16777203 },
                        { name = "23",    index = 16777211 }
                    },
                    Arts = {
                        { name = "Empty", index = 0   },
                        { name = "Full",  index = 127 },
                        { name = "1",     index = 64  },
                        { name = "2",     index = 96  },
                        { name = "3",     index = 112 },
                        { name = "4",     index = 120 },
                        { name = "5",     index = 122 },
                        { name = "6",     index = 126 }
                    }
                }
            },

            Presets = {
                { name = "All - 0%",       index = 0   },
                { name = "All - 85%",      index = 85  },
                { name = "All - 100%",     index = 100 },
                { name = "2.55mil Payout", index = -1  }
            },

            Values = {
                Cash = 83250,
                Weed = 135000,
                Coke = 202500,
                Gold = 333333,
                Arts = 180000
            },

            Files = {}
        },

        DiamondCasino = {
            Difficulties = {
                { name = "Normal", index = 0 },
                { name = "Hard",   index = 1 }
            },

            Approaches = {
                { name = "Silent n Snea.", index = 1 },
                { name = "Big Con",        index = 2 },
                { name = "Aggressive",     index = 3 }
            },

            Gunmans = {
                { name = "Karl Abolaji",    index = 1 },
                { name = "Charlie Reed",    index = 3 },
                { name = "Patrick McRear.", index = 5 },
                { name = "Gustavo Mota",    index = 2 },
                { name = "Chester McCoy",   index = 4 }
            },

            Loadouts = {
                { name = "Micro SMG (S)",     index = 1 },
                { name = "Mac. Pistol (S)",   index = 1 },
                { name = "Micro SMG",         index = 1 },
                { name = "Double Barrel",     index = 1 },
                { name = "Sawed-Off",         index = 1 },
                { name = "Heavy Revolver",    index = 1 },
                { name = "Assau. SMG (S)",    index = 3 },
                { name = "Bullpup Sh. (S)",   index = 3 },
                { name = "Machine Pistol",    index = 3 },
                { name = "Sweeper Shot.",     index = 3 },
                { name = "Assault SMG",       index = 3 },
                { name = "Pump Shotgun",      index = 3 },
                { name = "Combat PDW",        index = 5 },
                { name = "Assault Rif. (S)",  index = 5 },
                { name = "Sawed-Off",         index = 5 },
                { name = "Compact Rifle",     index = 5 },
                { name = "Heavy Shotgun",     index = 5 },
                { name = "Combat MG",         index = 5 },
                { name = "Carbin. Rif. (S)",  index = 2 },
                { name = "Assau. Sho. (S)",   index = 2 },
                { name = "Carbine Rifle",     index = 2 },
                { name = "Assault Shot.",     index = 2 },
                { name = "Carbine Rifle",     index = 2 },
                { name = "Assault Shot.",     index = 2 },
                { name = "Pump Sh. II (S)",   index = 4 },
                { name = "Carbine R. II (S)", index = 4 },
                { name = "SMG Mk II",         index = 4 },
                { name = "Bullpup Rifle II",  index = 4 },
                { name = "Pump Shot. II",     index = 4 },
                { name = "Assault Rifle II",  index = 4 }
            },

            Drivers = {
                { name = "Karim Denz",       index = 1 },
                { name = "Zach Nelson",      index = 4 },
                { name = "Taliana Martinez", index = 2 },
                { name = "Eddie Toh",        index = 3 },
                { name = "Chester McCoy",    index = 5 }
            },

            Vehicles = {
                { name = "Issi Classic",    index = 1 },
                { name = "Asbo",            index = 1 },
                { name = "Blista Kanjo",    index = 1 },
                { name = "Sentinel Class.", index = 1 },
                { name = "Manchez",         index = 4 },
                { name = "Stryder",         index = 4 },
                { name = "Defiler",         index = 4 },
                { name = "Lectro",          index = 4 },
                { name = "Retinue Mk II",   index = 2 },
                { name = "Drift Yosemite",  index = 2 },
                { name = "Sugoi",           index = 2 },
                { name = "Jugular",         index = 2 },
                { name = "Sultan Classic",  index = 3 },
                { name = "Gauntl. Classic", index = 3 },
                { name = "Ellie",           index = 3 },
                { name = "Komoda",          index = 3 },
                { name = "Zhaba",           index = 5 },
                { name = "Vagrant",         index = 5 },
                { name = "Outlaw",          index = 5 },
                { name = "Everon",          index = 5 }
            },

            Hackers = {
                { name = "Rickie Lukens",   index = 1 },
                { name = "Yohan Blair",     index = 3 },
                { name = "Christian Feltz", index = 2 },
                { name = "Page Harris",     index = 5 },
                { name = "Avi Schwartz.",   index = 4 }
            },

            Masks = {
                { name = "None",              index = 0  },
                { name = "Geometric Set",     index = 1  },
                { name = "Hunter Set",        index = 2  },
                { name = "Oni Half Mask Set", index = 3  },
                { name = "Emoji Set",         index = 4  },
                { name = "Ornate Skull Set",  index = 5  },
                { name = "Lucky Fruit Set",   index = 6  },
                { name = "Guerilla Set",      index = 7  },
                { name = "Clown Set",         index = 8  },
                { name = "Animal Set",        index = 9  },
                { name = "Riot Set",          index = 10 },
                { name = "Oni Full Mask Set", index = 11 },
                { name = "Hockey Set",        index = 12 }
            },

            Guards = {
                { name = "Elite",  index = 0 },
                { name = "Pro",    index = 1 },
                { name = "Unit",   index = 2 },
                { name = "Rookie", index = 3 }
            },

            Keycards = {
                { name = "None",    index = 0 },
                { name = "Level 1", index = 1 },
                { name = "Level 2", index = 2 }
            },

            Targets = {
                { name = "Cash",     index = 0 },
                { name = "Arts",     index = 2 },
                { name = "Gold",     index = 1 },
                { name = "Diamonds", index = 3 }
            },

            Presets = {
                { name = "All - 0%",      index = 0   },
                { name = "All - 85%",     index = 85  },
                { name = "All - 100%",    index = 100 },
                { name = "3.6mil Payout", index = -1  }
            },

            Files = {}
        },

        Doomsday = {
            Acts = {
                { name = "Data Breaches",     index = 1 },
                { name = "Bogdan Problem",    index = 2 },
                { name = "Doomsday Scenario", index = 3 }
            },

            Presets = {
                { name = "All - 0%",       index = 0   },
                { name = "All - 85%",      index = 85  },
                { name = "All - 100%",     index = 100 },
                { name = "2.55mil Payout", index = -1  }
            },

            Heists = {
                Data     = 503,
                Bogdan   = 240,
                Doomsday = 16368,
            },

            Files = {}
        },

        SalvageYard = {
            Robberies = {
                { name = "Cargo Ship", index = 0 },
                { name = "Gangbanger", index = 1 },
                { name = "Duggan",     index = 2 },
                { name = "Podium",     index = 3 },
                { name = "McTony",     index = 4 }
            },

            Vehicles = {
                { name = "LM87",             index = 1   },
                { name = "Cinquemila",       index = 2   },
                { name = "Autarch",          index = 3   },
                { name = "Tigon",            index = 4   },
                { name = "Champion",         index = 5   },
                { name = "10F",              index = 6   },
                { name = "SM722",            index = 7   },
                { name = "Omnis e-GT",       index = 8   },
                { name = "Growler",          index = 9   },
                { name = "Deity",            index = 10  },
                { name = "Itali RSX",        index = 11  },
                { name = "Coquette D10",     index = 12  },
                { name = "Jubilee",          index = 13  },
                { name = "Astron",           index = 14  },
                { name = "Comet S2 Cabr.",   index = 15  },
                { name = "Torero",           index = 16  },
                { name = "Cheetah Classic",  index = 17  },
                { name = "Turismo Classic",  index = 18  },
                { name = "Infernus Classic", index = 19  },
                { name = "Stafford",         index = 20  },
                { name = "GT500",            index = 21  },
                { name = "Viseris",          index = 22  },
                { name = "Mamba",            index = 23  },
                { name = "Coquette Black.",  index = 24  },
                { name = "Stinger GT",       index = 25  },
                { name = "Z-Type",           index = 26  },
                { name = "Broadway",         index = 27  },
                { name = "Vigero ZX",        index = 28  },
                { name = "Buffalo STX",      index = 29  },
                { name = "Ruston",           index = 30  },
                { name = "Gauntl. Hellfire", index = 31  },
                { name = "Dominator GTT",    index = 32  },
                { name = "Roosevelt Valor",  index = 33  },
                { name = "Swinger",          index = 34  },
                { name = "Stirling GT",      index = 35  },
                { name = "Omnis",            index = 36  },
                { name = "Tropos Rallye",    index = 37  },
                { name = "Jugular",          index = 38  },
                { name = "Patriot Mil-Spec", index = 39  },
                { name = "Toros",            index = 40  },
                { name = "Caracara 4x4",     index = 41  },
                { name = "Sentinel Classic", index = 42  },
                { name = "Weevil",           index = 43  },
                { name = "Blista Kanjo",     index = 44  },
                { name = "Eudora",           index = 45  },
                { name = "Kamacho",          index = 46  },
                { name = "Hellion",          index = 47  },
                { name = "Ellie",            index = 48  },
                { name = "Hermes",           index = 49  },
                { name = "Hustler",          index = 50  },
                { name = "Turismo Om.",      index = 51  },
                { name = "Buffalo EVX",      index = 52  },
                { name = "Itali GTO St.",    index = 53  },
                { name = "Virtue",           index = 54  },
                { name = "Ignus",            index = 55  },
                { name = "Zentorno",         index = 56  },
                { name = "Neon",             index = 57  },
                { name = "Furia",            index = 58  },
                { name = "Zorrusso",         index = 59  },
                { name = "Thrax",            index = 60  },
                { name = "Vagner",           index = 61  },
                { name = "Panthere",         index = 62  },
                { name = "Itali GTO",        index = 63  },
                { name = "S80RR",            index = 64  },
                { name = "Tyrant",           index = 65  },
                { name = "Entity MT",        index = 66  },
                { name = "Torero XO",        index = 67  },
                { name = "Neo",              index = 68  },
                { name = "Corsita",          index = 69  },
                { name = "Paragon R",        index = 70  },
                { name = "Franken Stange",   index = 71  },
                { name = "Comet Safari",     index = 72  },
                { name = "FR36",             index = 73  },
                { name = "Hotring Everon",   index = 74  },
                { name = "Komoda",           index = 75  },
                { name = "Tailgater S",      index = 76  },
                { name = "Jester Classic",   index = 77  },
                { name = "Jester RR",        index = 78  },
                { name = "Euros",            index = 79  },
                { name = "ZR350",            index = 80  },
                { name = "Cypher",           index = 81  },
                { name = "Dominator ASP",    index = 82  },
                { name = "Baller ST-D",      index = 83  },
                { name = "Casco",            index = 84  },
                { name = "Drift Yosemite",   index = 85  },
                { name = "Everon",           index = 86  },
                { name = "Penumbra FF",      index = 87  },
                { name = "V-STR",            index = 88  },
                { name = "Dominator GT",     index = 89  },
                { name = "Schlagen GT",      index = 90  },
                { name = "Cavalcade XL",     index = 91  },
                { name = "Clique",           index = 92  },
                { name = "Boor",             index = 93  },
                { name = "Sugoi",            index = 94  },
                { name = "Greenwood",        index = 95  },
                { name = "Brigham",          index = 96  },
                { name = "Issi Rally",       index = 97  },
                { name = "Seminole Fr.",     index = 98  },
                { name = "Kanjo SJ",         index = 99  },
                { name = "Previon",          index = 100 }
            },

            Modifications = {
                { name = "Version 1", index = 0 },
                { name = "Version 2", index = 1 },
                { name = "Version 3", index = 2 },
                { name = "Version 4", index = 3 },
                { name = "Version 5", index = 4 },
            },

            Keeps = {
                { name = "Can't Claim", index = 0 },
                { name = "Can Claim",   index = 1 }
            }
        }
    },

    Cash = {
        Stats = {
            Earneds = {
                { name = "Unselected",       index = 0                                },
                { name = "Total",            index = eStat.MPPLY_TOTAL_EVC            },
                { name = "Jobs",             index = eStat.MPX_MONEY_EARN_JOBS        },
                { name = "Selling Vehicles", index = eStat.MPX_MONEY_EARN_SELLING_VEH },
                { name = "Betting",          index = eStat.MPX_MONEY_EARN_BETTING     },
                { name = "Good Sport",       index = eStat.MPX_MONEY_EARN_GOOD_SPORT  },
                { name = "Picked Up",        index = eStat.MPX_MONEY_EARN_PICKED_UP   }
            },
            Spents = {
                { name = "Unselected",          index = 0                                     },
                { name = "Total",               index = eStat.MPPLY_TOTAL_SVC                 },
                { name = "Weapons n Armor",     index = eStat.MPX_MONEY_SPENT_WEAPON_ARMOR    },
                { name = "Vehicles n Maint.",   index = eStat.MPX_MONEY_SPENT_VEH_MAINTENANCE },
                { name = "Style n Entert.",     index = eStat.MPX_MONEY_SPENT_STYLE_ENT       },
                { name = "Property n Utils",    index = eStat.MPX_MONEY_SPENT_PROPERTY_UTIL   },
                { name = "Job n Ac. Ent. Fees", index = eStat.MPX_MONEY_SPENT_JOB_ACTIVITY    },
                { name = "Betting",             index = eStat.MPX_MONEY_SPENT_BETTING         },
                { name = "Contact Services",    index = eStat.MPX_MONEY_SPENT_CONTACT_SERVICE },
                { name = "Healthcare n Bail",   index = eStat.MPX_MONEY_SPENT_HEALTHCARE      },
                { name = "Dropped or Stolen",   index = eStat.MPX_MONEY_SPENT_DROPPED_STOLEN  }
            }
        }
    },

    Session = {
        Types = {
            Public       = 0,
            NewPublic    = 1,
            ClosedCrew   = 2,
            Crew         = 3,
            ClosedFriend = 4,
            Friend       = 5,
            Solo         = 6,
            Invite       = 7,
            JoinCrew     = 8,
            Offline      = 9
        }
    },

    World = {
        Casino = {
            Prizes = {
                { name = "Clothing 1",   index =  0 },
                { name = "Clothing 2",   index =  8 },
                { name = "Clothing 3",   index = 12 },
                { name = "2,500 RP",     index =  1 },
                { name = "5,000 RP",     index =  5 },
                { name = "7,500 RP",     index =  9 },
                { name = "10,000 RP",    index = 13 },
                { name = "15,000 RP",    index = 17 },
                { name = "$20,000",      index =  2 },
                { name = "$30,000",      index =  6 },
                { name = "$40,000",      index = 14 },
                { name = "$50,000",      index = 19 },
                { name = "10,000 Chips", index =  3 },
                { name = "15,000 Chips", index =  7 },
                { name = "20,000 Chips", index = 10 },
                { name = "25,000 Chips", index = 15 },
                { name = "Discount",     index =  4 },
                { name = "Mystery",      index = 11 },
                { name = "Vehicle",      index = 18 }
            }
        }
    },

    Story = {
        Characters = {
            { name = "Michael",  index = 0 },
            { name = "Franklin", index = 1 },
            { name = "Trevor",   index = 2 }
        }
    },

    Editor = {
        Globals = {
            Types = {
                { name = "int",   index = 0 },
                { name = "float", index = 1 },
                { name = "bool",  index = 2 }
            }
        },

        Locals = {
            Types = {
                { name = "int",   index = 0 },
                { name = "float", index = 1 }
            }
        },

        Stats = {
            Types = {
                { name = "int",    index = 0 },
                { name = "float",  index = 1 },
                { name = "bool",   index = 2 },
                { name = "string", index = 3 }
            },

            Files = {}
        },

        PackedStats = {
            Types = {
                { name = "int",  index = 0 },
                { name = "bool", index = 1 }
            }
        }
    },

    Settings = {
        Logging = {
            { name = "Disabled", index = 0 },
            { name = "Silent",   index = 1 },
            { name = "Enabled",  index = 2 }
        },

        Languages = {},

        InstantFinishes = {
            { name = "Old", index = 0 },
            { name = "New", index = 1 }
        },

        OrgTypes = {
            { name = "SecuroServ CEO", index = 0 },
            { name = "Club President", index = 1 }
        }
    },

    SilentNight = {
        Features = {
            Language = 1984344559
        }
    },

    Cherax = {
        Features = {
            ForceScriptHost     = 1181010276,
            SessionType         = 603923874,
            StartSession        = 3364415752,
            BailFromSession     = 3768410355,
            LogTransactions     = 925637617,
            SubscribedScripts   = 3331055146,
            RunScript           = 2423908032,
            StopScript          = 2425713991,
            EventProtection     = 2022901605,
            ProtectionWhitelist = 445959715
        }
    },

    JinxScript = {
        Features = {
            ForceCloudSave  = 3244199536,
            RestartFreemode = 3731619689
        }
    },

    BlipSprites = {
        Agency       = 826,
        Apartment    = 40,
        AutoShop     = 779,
        Kosatka      = 760,
        Arcade       = 740,
        Facility     = 590,
        SalvageYard  = 867,
        Bunker       = 557,
        Hangar       = 569,
        Nightclub    = 614,
        Office       = 475,
        Warehouse    = 473,
        Garment      = 900,
        Heist        = 428,
        Franklin     = 88,
        Laptop       = 521,
        WeedShop     = 925,
        WeedShopH    = 927,
        TourCompany  = 928,
        TourCompanyH = 930,
        CarWash      = 931,
        CarWashH     = 933
    },

    BlipColors = {
        Blue = 3
    },

    Properties = {
        Agency      = eStat.MPX_FIXER_HQ_OWNED,
        Apartment   = eStat.MPX_PROPERTY_HOUSE,
        AutoShop    = eStat.MPX_AUTO_SHOP_OWNED,
        Kosatka     = eStat.MPX_IH_SUB_OWNED,
        Arcade      = eStat.MPX_ARCADE_OWNED,
        Facility    = eStat.MPX_DBASE_OWNED,
        SalvageYard = eStat.MPX_SALVAGE_YARD_OWNED,
        Bunker      = eStat.MPX_FACTORYSLOT5,
        Hangar      = eStat.MPX_SALVAGE_YARD_OWNED,
        Nightclub   = eStat.MPX_NIGHTCLUB_OWNED,
        Office      = eStat.MPX_PROP_OFFICE,
        Warehouse   = eStat.MPX_WAREHOUSE_OWNED,
        Garment     = eStat.MPX_HACKER_DEN_OWNED,
        CarWash     = eStat.MPX_SB_CAR_WASH_OWNED,
        WeedShop    = eStat.MPX_SB_WEED_SHOP_OWNED,
        TourCompany = eStat.MPX_SB_HELI_TOURS_OWNED
    },

    Stats = {
        Times = {
            { name = "Unselected",    index = 0                            },
            { name = "In GTA Online", index = eStat.MP_PLAYING_TIME        },
            { name = "As Character",  index = eStat.MPX_TOTAL_PLAYING_TIME }
        },

        Dates = {
            { name = "Unselected",        index = 0                             },
            { name = "Character Created", index = eStat.MPX_CHAR_DATE_CREATED   },
            { name = "Last Time Played",  index = eStat.MPX_CHAR_LAST_PLAY_TIME },
            { name = "Last Ranked Up",    index = eStat.MPX_CHAR_DATE_RANKUP    }
        }
    },

    Teleports = {
        Agency      = { -578.981,  -711.381,  116.805, 123.687 },
        AutoShop    = { -1349.024, 138.381,   -95.121, 194.202 },
        Kosatka     = { 1561.087,  386.610,   -49.685, 179.884 },
        Arcade      = { 2712.995,  -371.115,  -54.780, 178.758 },
        SalvageYard = { 1074.720,  -2275.502, -48.999, 84.481  },
        Office      = { -81.345,   -802.471,  243.387, 278.402 },
        Bunker      = { 907.515,   -3207.357, -97.187, 245.099 },
        Hangar      = { -1239.059, -3001.454, -42.867, 146.258 },
        Nightclub   = { -1618.249, -3013.507, -75.205, 257.431 },
        Garment     = { 749.337,   -995.654,  -46.376, 50.750  },
        MazeBank    = { -75.146,   -818.687,  326.175, 357.531 },
        Terminal    = { 1169.749,  -2973.535, 5.902,   271.204 },
        CarWash     = { 23.684,    -1400.633, -73.999, 357.518 },
        WeedShop    = { -1160.636, -1535.462, -48.994, 180.271 },
        TourCompany = { -1160.599, -1535.585, -48.999, 177.268 }
    }
}

--#endregion
