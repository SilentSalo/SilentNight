--#region ePackedStat

ePackedStat = {
    HAS_PARSED = false,

    Business = {
        Arcade = {
            Setup = { type = "bool", index = 27227 }
        },

        CrateWarehouse = {
            Cargo = { type = "bool", index = { 32359, 32363 } }
        },

        Hangar = {
            Cargo = { type = "bool", index = 36828 }
        },

        Nightclub = {
            Setup = {
                Staff     = { type = "bool", index = 18161 },
                Equipment = { type = "bool", index = 22067 },
                DJ        = { type = "bool", index = 22068 }
            }
        },

        Heat = {
            HandsOnCarWash   = { type = "int", index = 24924 },
            SmokeOnTheWater  = { type = "int", index = 24925 },
            HigginsHelitours = { type = "int", index = 24926 }
        }
    },

    Clothes = {
        DiamondCasino = { type = "bool", index = { 28225, 28248 } },

        Parachutes = {
            Part1 = { type = "bool", index = 3609             },
            Part2 = { type = "bool", index = { 31791, 31796 } },
            Part3 = { type = "bool", index = { 34378, 34379 } }
        }
    },

    Player = {
        Awards = {
            Doomsday            = { type = "bool", index = { 18098, 18161 } },
            AfterHours          = { type = "bool", index = { 22066, 22193 } },
            ArenaWar            = { type = "bool", index = { 24962, 25537 } },
            DiamondCasinoResort = { type = "bool", index = { 26810, 27257 } },
            DiamondCasino       = { type = "bool", index = { 28098, 28353 } },
            SummerSpecial       = { type = "bool", index = { 30227, 30482 } },
            CayoPerico          = { type = "bool", index = { 30515, 30706 } },
            Tuners              = { type = "bool", index = { 31707, 32282 } },
            Contract            = { type = "bool", index = { 32283, 32474 } }
        }
    },

    Vehicle = {
        Unlock = {
            ArenaWar = { type = "bool", index = { 24992, 24999 } }
        },

        TradePrices = {
            ArenaWarVehicles = { type = "bool", index = { 24963, 25109 } },
            Headlights       = { type = "bool", index = { 24980, 24991 } }
        }
    },

    Weapon = {
        Livery = {
            DildodudeMicroSMG    = { type = "bool", index = 36788 },
            DildodudePumpShotgun = { type = "bool", index = 36787 },
            EmployeeMicroSMG     = { type = "bool", index = 41657 },
            SantaHeavySniper     = { type = "bool", index = 42069 },
            SeasonPistolMkII     = { type = "bool", index = 36786 },
            SkullSpecialCarbine  = { type = "bool", index = 42122 },
            SnowmanCombatPistol  = { type = "bool", index = 42068 },
            SuedeCarbineRifle    = { type = "bool", index = 41658 },
            UncleRPG             = { type = "bool", index = 41659 }
        }
    }
}

--#endregion
