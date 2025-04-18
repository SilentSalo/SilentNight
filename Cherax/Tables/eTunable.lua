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
                MaterialProduct =
                {
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
            Payout   = { type = "int", tunable = "FIXER_FINALE_LEADER_CASH_REWARD", defaultValue = 1000000 },
            Cooldown = { 
                Story    = { type = "int", tunable = "FIXER_STORY_COOLDOWN_POSIX",             defaultValue = 1800   },
                Security = { type = "int", tunable = "FIXER_SECURITY_CONTRACT_COOLDOWN_TIME",  defaultValue = 300000 },
                Reward   = { type = "int", tunable = "VIP_CONTRACT_MIN_CASH_REWARD",           defaultValue = 500    },
                Payphone = { type = "int", tunable = "REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN", defaultValue = 600000 }
            }
        },
        Apartment = {
            RootIdHash = {
                Fleeca  = { type = "int", tunable = "ROOT_ID_HASH_THE_FLECCA_JOB",           defaultValue = Utils.sJoaat("33TxqLipLUintwlU_YDzMg") },
                Prison  = { type = "int", tunable = "ROOT_ID_HASH_THE_PRISON_BREAK",         defaultValue = Utils.sJoaat("A6UBSyF61kiveglc58lm2Q") },
                Humane  = { type = "int", tunable = "ROOT_ID_HASH_THE_HUMANE_LABS_RAID",     defaultValue = Utils.sJoaat("a_hWnpMUz0-7Yd_Rc5pJ4w") },
                Series  = { type = "int", tunable = "ROOT_ID_HASH_SERIES_A_FUNDING",         defaultValue = Utils.sJoaat("7r5AKL5aB0qe9HiDy3nW8w") },
                Pacific = { type = "int", tunable = "ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB", defaultValue = Utils.sJoaat("hKSf9RCT8UiaZlykyGrMwg") }
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
                    Karim   = { type = "int", tunable = "HEIST3_HACKERS_RICKIE_CUT",    defaultValue = 3  },
                    Taliana = { type = "int", tunable = "HEIST3_HACKERS_CHRISTIAN_CUT", defaultValue = 7  },
                    Eddie   = { type = "int", tunable = "HEIST3_HACKERS_YOHAN_CUT",     defaultValue = 5  },
                    Norm    = { type = "int", tunable = "HEIST3_HACKERS_AVI_CUT",       defaultValue = 10 },
                    Chester = { type = "int", tunable = "HEIST3_HACKERS_PAIGE_CUT",     defaultValue = 9  }
                }
            }
        },
        SalvageYard = {
            Robbery = {
                Slot1 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_0", defaultValue = -1 }
                },
                Slot2 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_1", defaultValue = -1 }
                },
                Slot3 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_2", defaultValue = -1 }
                },
                SetupPrice = { type = "int", tunable = 71522671, defaultValue = 20000 }
            },
            Vehicle = {
                Slot1 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_0",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_0",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_0", defaultValue = 0  }
                },
                Slot2 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_1",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_1",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_1", defaultValue = 0  }
                },
                Slot3 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_2",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_2",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_2", defaultValue = 0  }
                },
                ClaimPrice = {
                    Standard   = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE",                  defaultValue = 20000 },
                    Discounted = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT", defaultValue = 10000 },
                },
                --SalvageValueMultiplier = { type = "float", tunable = "SALV23_VEHICLE_SALVAGE_VALUE_MULTIPLIER", defaultValue = 0.8 },
            },
            Cooldown = {
                Weekly  = { type = "int", tunable = "SALV23_VEH_ROBBERY_WEEK_ID",   defaultValue = 0    },
                Robbery = { type = "int", tunable = "SALV23_VEH_ROB_COOLDOWN_TIME", defaultValue = 300  },
                Cfr     = { type = "int", tunable = "SALV23_CFR_COOLDOWN_TIME",     defaultValue = 3600 }
            }
        },
    },
    Player = {
        Appearance = {
            Cooldown = { type = "int", tunable = "CHARACTER_APPEARANCE_COOLDOWN", defaultValue = 2880000}
        }
    },
    World = {
        Casino = {
            Chips = {
                AcquireLimit          = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY",           defaultValue = 20000 },
                AcquireLimitPenthouse = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY_PENTHOUSE", defaultValue = 50000 }
            }
        },
        GunVan = {
            Weapon = {
                Slot1 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_0",     defaultValue = Utils.sJoaat("WEAPON_BAT") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_0", defaultValue = 0.0                        }
                },
                Slot2 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_1",     defaultValue = Utils.sJoaat("WEAPON_KNFIE") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_1", defaultValue = 0.0                          }
                },
                Slot3 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_2",     defaultValue = Utils.sJoaat("WEAPON_RAILGUNXM3") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_2", defaultValue = 0.0                               }
                },
                Slot4 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_3",     defaultValue = Utils.sJoaat("WEAPON_MICROSMG") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_3", defaultValue = 0.0                             }
                },
                Slot5 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_4",     defaultValue = Utils.sJoaat("WEAPON_PUMPSHOTGUN") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_4", defaultValue = 0.0                                }
                },
                Slot6 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_5",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_5", defaultValue = 0.0 }
                },
                Slot7 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_6",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_6", defaultValue = 0.0 }
                },
                Slot8 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_7",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_7", defaultValue = 0.0 }
                },
                Slot9 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_8",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_8", defaultValue = 0.0 }
                },
                Slot10 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_9",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_9", defaultValue = 0.0 }
                }
            },
            Throwable = {
                Slot1 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0",     defaultValue = Utils.sJoaat("WEAPON_STICKYBOMB") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_0", defaultValue = 0.0                               }
                },
                Slot2 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_1",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_1", defaultValue = 0.0 }
                },
                Slot3 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_1",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_1", defaultValue = 0.0 }
                }
            },
            Armour = {
                Slot1 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_0", defaultValue = 0.0 }
                },
                Slot2 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_1", defaultValue = 0.0 }
                },
                Slot3 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_2", defaultValue = 0.0 }
                },
                Slot4 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_3", defaultValue = 0.0 }
                },
                Slot5 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_4", defaultValue = 0.0 }
                }
            },
            --MeleeSkins = { type = "int", tunable = 1490225691, defaultValue = 0 }
        },
        LSCarMeet = {
            XpMultiplier = {
                FirstTime = {
                    Bonus = {
                        Sprint          = { type = "float", tunable = "TUNER_SPRINT_FIRST_TIME_BONUS_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Street          = { type = "float", tunable = "TUNER_STREET_FIRST_TIME_BONUS_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Pursuit         = { type = "float", tunable = "TUNER_PURSUIT_FIRST_TIME_BONUS_XP_MULTIPLIER",          defaultValue = 1.0 },
                        Mod             = { type = "float", tunable = "TUNER_MOD_FIRST_TIME_BONUS_XP_MULTIPLIER",              defaultValue = 1.0 },
                        Sandbox         = { type = "float", tunable = "TUNER_SANDBOX_TEST_FIRST_TIME_BONUS_XP_MULTIPLIER",     defaultValue = 1.0 },
                        TimeTrial       = { type = "float", tunable = "TUNER_TIMETRIAL_FIRST_TIME_BONUS_XP_MULTIPLIER",        defaultValue = 1.0 },
                        Checkpoint      = { type = "float", tunable = "TUNER_CHECKPOINT_FIRST_TIME_BONUS_XP_MULTIPLIER",       defaultValue = 1.0 },
                        HeadToHead      = { type = "float", tunable = "TUNER_HEADTOHEAD_FIRST_TIME_BONUS_XP_MULTIPLIER",       defaultValue = 1.0 },
                        PrivateInstance = { type = "float", tunable = "TUNER_PRIVATE_INSTANCE_FIRST_TIME_BONUS_XP_MULTIPLIER", defaultValue = 1.0 }
                    },
                    Daily = {
                        CarClub         = { type = "float", tunable = "TUNER_CARCLUB_FIRST_TIME_DAILY_XP_MULTIPLIER",          defaultValue = 1.0 },
                        CarClubPv       = { type = "float", tunable = "TUNER_CARCLUB_PV_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        Sprint          = { type = "float", tunable = "TUNER_SPRINT_FIRST_TIME_DAILY_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Street          = { type = "float", tunable = "TUNER_STREET_FIRST_TIME_DAILY_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Pursuit         = { type = "float", tunable = "TUNER_PURSUIT_FIRST_TIME_DAILY_XP_MULTIPLIER",          defaultValue = 1.0 },
                        Mod             = { type = "float", tunable = "TUNER_MOD_FIRST_TIME_DAILY_XP_MULTIPLIER",              defaultValue = 1.0 },
                        Sandbox         = { type = "float", tunable = "TUNER_SANDBOX_TEST_FIRST_TIME_DAILY_XP_MULTIPLIERER",   defaultValue = 1.0 },
                        SandboxPv       = { type = "float", tunable = "TUNER_SANDBOX_PV_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        TimeTrial       = { type = "float", tunable = "TUNER_TIMETRIAL_FIRST_TIME_DAILY_XP_MULTIPLIER",        defaultValue = 1.0 },
                        Checkpoint      = { type = "float", tunable = "TUNER_CHECKPOINT_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        HeadToHead      = { type = "float", tunable = "TUNER_HEADTOHEAD_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        PrivateInstance = { type = "float", tunable = "TUNER_PRIVATE_INSTANCE_FIRST_TIME_DAILY_XP_MULTIPLIER", defaultValue = 1.0 }
                    }
                },
                Time = {
                    CarClub = { type = "float", tunable = "TUNER_CARCLUB_TIME_XP_MULTIPLIER", defaultValue = 1.0 },
                    Sandbox = { type = "float", tunable = "TUNER_SANDBOX_TIME_XP_MULTIPLIER", defaultValue = 1.0 },
                },
                Place = {
                    Sprint     = { type = "float", tunable = "TUNER_SPRINT_RACE_PLACE_XP_MULTIPLIER",     defaultValue = 1.0 },
                    Street     = { type = "float", tunable = "TUNER_STREET_RACE_PLACE_XP_MULTIPLIER",     defaultValue = 1.2 },
                    Pursuit    = { type = "float", tunable = "TUNER_PURSUIT_RACE_PLACE_XP_MULTIPLIER",    defaultValue = 1.2 },
                    Checkpoint = { type = "float", tunable = "TUNER_CHECKPOINT_RACE_PLACE_XP_MULTIPLIER", defaultValue = 1.0 },
                    HeadToHead = { type = "float", tunable = "TUNER_HEADTOHEAD_RACE_PLACE_XP_MULTIPLIER", defaultValue = 1.0 },
                },
                VisitsStreak  = { type = "float", tunable = "TUNER_CARCLUB_VISITS_STREAK_XP_MULTIPLIER", defaultValue = 1.0 },
                MerchPurchase = { type = "float", tunable = "TUNER_MERCH_PURCHASE_XP_MULTIPLIER",        defaultValue = 1.0 }
            }
        },
        Multiplier = {
            --Cash = { type = "float", tunable = "CASH_MULTIPLIER", defaultValue = 1.0 },
            --Xp   = { type = "float", tunable = "XP_MULTIPLIER",   defaultValue = 1.0 }
        }
    }
}
