--#region ePackedStat

ePackedStat = {
    HAS_PARSED = false,

    Business = {
        Agency = {
            Setup = { type = "bool", index = 28257 }
        },

        Arcade = {
            Setup = { type = "bool", index = 27227 }
        },

        AutoShop = {
            Setup = { type = "bool", index = 31753 }
        },

        CrateWarehouse = {
            Cargo = { type = "bool", index = { 32359, 32363 } }
        },

        Facility = {
            Setup = { type = "bool", index = 18139 }
        },

        Hangar = {
            Setup = { type = "bool", index = 15966 },

            Cargo = { type = "bool", index = 36828 },

            Crate = {
                First = { type = "int", index = 16011 },
                Last  = { type = "int", index = 16060 }
            }
        },

        Kosatka = {
            MeetMiguel = { type = "bool", index = 30309 },
            Setup      = { type = "bool", index = 30522 }
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
    }
}

--#endregion
