--#region eTunable

eTunable = {
    HAS_PARSED = false,

    Business = {
        Bunker = {
            Product = {
                Value             = { type = "int", tunable = "GR_MANU_PRODUCT_VALUE",                   defaultValue = 5000 },
                StaffUpgraded     = { type = "int", tunable = "GR_MANU_PRODUCT_VALUE_STAFF_UPGRADE",     defaultValue = 1000 },
                EquipmentUpgraded = { type = "int", tunable = "GR_MANU_PRODUCT_VALUE_EQUIPMENT_UPGRADE", defaultValue = 1000 }
            },

            Research = {
                Capacity       = { type = "int", tunable = "GR_RESEARCH_CAPACITY",        defaultValue = 60     },
                ProductionTime = { type = "int", tunable = "GR_RESEARCH_PRODUCTION_TIME", defaultValue = 300000 },

                ReductionTime = {
                    EquipmentUpgraded = { type = "int", tunable = "GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME", defaultValue = 45000 },
                    StaffUpgraded     = { type = "int", tunable = "GR_RESEARCH_UPGRADE_STAFF_REDUCTION_TIME",     defaultValue = 45000 }
                },

                MaterialProduct = {
                    Cost         = { type = "int", tunable = "GR_RESEARCH_MATERIAL_PRODUCT_COST",                   defaultValue = 2 },
                    CostUpgraded = { type = "int", tunable = "GR_RESEARCH_MATERIAL_PRODUCT_COST_UPGRADE_REDUCTION", defaultValue = 1 }
                }
            },

            Multiplier = {
                ProductLocal = { type = "float", tunable = "BIKER_SELL_PRODUCT_LOCAL_MODIFIER", defaultValue = 1.0 },
                ProductFar   = { type = "float", tunable = "BIKER_SELL_PRODUCT_FAR_MODIFIER",   defaultValue = 1.5 }
            }
        },

        CrateWarehouse = {
            Price = {
                Threshold1  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1",  defaultValue = 10000 },
                Threshold2  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD2",  defaultValue = 11000 },
                Threshold3  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD3",  defaultValue = 12000 },
                Threshold4  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD4",  defaultValue = 13000 },
                Threshold5  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD5",  defaultValue = 13500 },
                Threshold6  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD6",  defaultValue = 14000 },
                Threshold7  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD7",  defaultValue = 14500 },
                Threshold8  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD8",  defaultValue = 15000 },
                Threshold9  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD9",  defaultValue = 15500 },
                Threshold10 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD10", defaultValue = 16000 },
                Threshold11 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD11", defaultValue = 16500 },
                Threshold12 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD12", defaultValue = 17000 },
                Threshold13 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD13", defaultValue = 17500 },
                Threshold14 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD14", defaultValue = 17750 },
                Threshold15 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD15", defaultValue = 18000 },
                Threshold16 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD16", defaultValue = 18250 },
                Threshold17 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD17", defaultValue = 18500 },
                Threshold18 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD18", defaultValue = 18750 },
                Threshold19 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD19", defaultValue = 19000 },
                Threshold20 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD20", defaultValue = 19500 },
                Threshold21 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD21", defaultValue = 20000 }
            },

            Cooldown = {
                Buy  = { type = "int", tunable = "EXEC_BUY_COOLDOWN",  defaultValue = 300000  },
                Sell = { type = "int", tunable = "EXEC_SELL_COOLDOWN", defaultValue = 1800000 }
            },

            HighDemand = { type = "float", tunable = "EXEC_CONTRABAND_HIGH_DEMAND_BONUS_PERCENTAGE", defaultValue = 2.5 }
        },

        Hangar = {
            Price    = { type = "int",   tunable = "SMUG_SELL_PRICE_PER_CRATE_MIXED", defaultValue = 30000 },
            RonsCut  = { type = "float", tunable = "SMUG_SELL_RONS_CUT",              defaultValue = 0.025 },

            Cooldown = {
                Steal = {
                    Easy       = { type = "int", tunable = "SMUG_STEAL_EASY_COOLDOWN_TIMER",            defaultValue = 120000 },
                    Medium     = { type = "int", tunable = "SMUG_STEAL_MED_COOLDOWN_TIMER",             defaultValue = 180000 },
                    Hard       = { type = "int", tunable = "SMUG_STEAL_HARD_COOLDOWN_TIMER",            defaultValue = 240000 },
                    Additional = { type = "int", tunable = "SMUG_STEAL_ADDITIONAL_CRATE_COOLDOWN_TIME", defaultValue = 60000  }
                },

                Sell = { type = "int", tunable = "SMUG_SELL_SELL_COOLDOWN_TIMER", defaultValue = 180000 }
            }
        },

        Nightclub = {
            Price = {
                Weapons   = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_WEAPONS",          defaultValue = 5000  },
                Coke      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_COKE",             defaultValue = 27000 },
                Meth      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_METH",             defaultValue = 11475 },
                Weed      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_WEED",             defaultValue = 2025  },
                Documents = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_FORGED_DOCUMENTS", defaultValue = 1350  },
                Cash      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_COUNTERFEIT_CASH", defaultValue = 4725  },
                Cargo     = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_CARGO",            defaultValue = 10000 }
            },

            Safe = {
                Income = {
                    Top5   = { type = "int", tunable = "NIGHTCLUBINCOMEUPTOPOP5",   defaultValue = 1500  },
                    Top100 = { type = "int", tunable = "NIGHTCLUBINCOMEUPTOPOP100", defaultValue = 50000 }
                },

                MaxCapacity = { type = "int", tunable = "NIGHTCLUBMAXSAFEVALUE", defaultValue = 250000 },
            },

            Cooldown = {
                ClubManagement = { type = "int", tunable = "BB_CLUB_MANAGEMENT_CLUB_MANAGEMENT_MISSION_COOLDOWN",           defaultValue  = 300000 },
                Sell           = { type = "int", tunable = "BB_SELL_MISSIONS_MISSION_COOLDOWN",                             defaultValue  = 300000 },
                SellDelivery   = { type = "int", tunable = "BB_SELL_MISSIONS_DELIVERY_VEHICLE_COOLDOWN_AFTER_SELL_MISSION", defaultValue  = 300000 }
            }
        }
    },

    Heist = {
        Agency = {
            Payout = { type = "int", tunable = "FIXER_FINALE_LEADER_CASH_REWARD", defaultValue = 1000000 },

            Cooldown = {
                Story    = { type = "int", tunable = "FIXER_STORY_COOLDOWN_POSIX",             defaultValue = 1800   },
                Security = { type = "int", tunable = "FIXER_SECURITY_CONTRACT_COOLDOWN_TIME",  defaultValue = 300000 },
                Payphone = { type = "int", tunable = "REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN", defaultValue = 600000 }
            }
        },

        Apartment = {
            RootIdHash = {
                Fleeca  = { type = "int", tunable = "ROOT_ID_HASH_THE_FLECCA_JOB",           defaultValue = J("33TxqLipLUintwlU_YDzMg") },
                Prison  = { type = "int", tunable = "ROOT_ID_HASH_THE_PRISON_BREAK",         defaultValue = J("A6UBSyF61kiveglc58lm2Q") },
                Humane  = { type = "int", tunable = "ROOT_ID_HASH_THE_HUMANE_LABS_RAID",     defaultValue = J("a_hWnpMUz0-7Yd_Rc5pJ4w") },
                Series  = { type = "int", tunable = "ROOT_ID_HASH_SERIES_A_FUNDING",         defaultValue = J("7r5AKL5aB0qe9HiDy3nW8w") },
                Pacific = { type = "int", tunable = "ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB", defaultValue = J("hKSf9RCT8UiaZlykyGrMwg") }
            }
        },

        AutoShop = {
            Payout = {
                First   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD0", defaultValue = 300000 },
                Second  = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD1", defaultValue = 185000 },
                Third   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD2", defaultValue = 178000 },
                Fourth  = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD3", defaultValue = 172000 },
                Fifth   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD4", defaultValue = 175000 },
                Sixth   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD5", defaultValue = 182000 },
                Seventh = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD6", defaultValue = 180000 },
                Eight   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD7", defaultValue = 170000 },
                Fee     = { type = "float", tunable = "TUNER_ROBBERY_CONTACT_FEE",         defaultValue = 0.1    }
            },

            Cooldown = { type = "int", tunable = "TUNER_ROBBERY_COOLDOWN_TIME", defaultValue = 3600 }
        },

        CayoPerico = {
            Bag = {
                MaxCapacity = { type = "int", tunable = "HEIST_BAG_MAX_CAPACITY", defaultValue = 1800 }
            },

            Cut = {
                Pavel = { type = "float", tunable = "IH_DEDUCTION_PAVEL_CUT",   defaultValue = -0.02 },
                Fee   = { type = "float", tunable = "IH_DEDUCTION_FENCING_FEE", defaultValue = -0.1  }
            }
        },

        DiamondCasino = {
            Cut = {
                Lester = { type = "int", tunable = "CH_LESTER_CUT", defaultValue = 5 },

                Gunman = {
                    Karl    = { type = "int", tunable = "HEIST3_PREPBOARD_GUNMEN_KARL_CUT",    defaultValue = 5  },
                    Gustavo = { type = "int", tunable = "HEIST3_PREPBOARD_GUNMEN_GUSTAVO_CUT", defaultValue = 9  },
                    Charlie = { type = "int", tunable = "HEIST3_PREPBOARD_GUNMEN_CHARLIE_CUT", defaultValue = 7  },
                    Chester = { type = "int", tunable = "HEIST3_PREPBOARD_GUNMEN_CHESTER_CUT", defaultValue = 10 },
                    Patrick = { type = "int", tunable = "HEIST3_PREPBOARD_GUNMEN_PATRICK_CUT", defaultValue = 8  }
                },

                Driver = {
                    Karim   = { type = "int", tunable = "HEIST3_DRIVERS_KARIM_CUT",   defaultValue = 5  },
                    Taliana = { type = "int", tunable = "HEIST3_DRIVERS_TALIANA_CUT", defaultValue = 7  },
                    Eddie   = { type = "int", tunable = "HEIST3_DRIVERS_EDDIE_CUT",   defaultValue = 9  },
                    Norm    = { type = "int", tunable = "HEIST3_DRIVERS_ZACH_CUT",    defaultValue = 6  },
                    Chester = { type = "int", tunable = "HEIST3_DRIVERS_CHESTER_CUT", defaultValue = 10 }
                },

                Hacker = {
                    Rickie    = { type = "int", tunable = "HEIST3_HACKERS_RICKIE_CUT",    defaultValue = 3  },
                    Christian = { type = "int", tunable = "HEIST3_HACKERS_CHRISTIAN_CUT", defaultValue = 7  },
                    Yohan     = { type = "int", tunable = "HEIST3_HACKERS_YOHAN_CUT",     defaultValue = 5  },
                    Avi       = { type = "int", tunable = "HEIST3_HACKERS_AVI_CUT",       defaultValue = 10 },
                    Paige     = { type = "int", tunable = "HEIST3_HACKERS_PAIGE_CUT",     defaultValue = 9  }
                }
            },

            Buyer = {
                Low  = { type = "float", tunable = "CH_BUYER_MOD_SHORT", defaultValue = 0.9  },
                Mid  = { type = "float", tunable = "CH_BUYER_MOD_MED",   defaultValue = 0.95 },
                High = { type = "float", tunable = "CH_BUYER_MOD_LONG",  defaultValue = 1    }
            }
        },

        SalvageYard = {
            Robbery = {
                SetupPrice = { type = "int", tunable = 71522671, defaultValue = 20000 }
            },

            Vehicle = {
                ClaimPrice = {
                    Standard   = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE",                  defaultValue = 20000 },
                    Discounted = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT", defaultValue = 10000 }
                }
            },

            Cooldown = {
                Weekly  = { type = "int", tunable = "SALV23_VEH_ROBBERY_WEEK_ID",   defaultValue = 0    },
                Robbery = { type = "int", tunable = "SALV23_VEH_ROB_COOLDOWN_TIME", defaultValue = 300  },
                Cfr     = { type = "int", tunable = "SALV23_CFR_COOLDOWN_TIME",     defaultValue = 3600 }
            }
        },
    },

    World = {
        Casino = {
            Chips = {
                Limit = {
                    Acquire          = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY",           defaultValue = 20000    },
                    AcquirePenthouse = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY_PENTHOUSE", defaultValue = 50000    },
                    Trade            = { type = "int", tunable = "VC_CASINO_CHIP_MAX_SELL",          defaultValue = 10000000 }
                }
            }
        }
    }
}

--#endregion
