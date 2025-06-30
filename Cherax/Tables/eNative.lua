--#region eNative

eNative = {
    CUTSCENE = {
        STOP_CUTSCENE_IMMEDIATELY = Natives.Invoke("Void", 0xD220BDD222AC4A1E)
    },

    ENTITY = {
        FREEZE_ENTITY_POSITION      = Natives.Invoke("Void", 0x428CA6DBD1094446),
        SET_ENTITY_COORDS_NO_OFFSET = Natives.Invoke("Void", 0x239A3351AC1DA385),
        GET_ENTITY_COORDS           = Natives.Invoke("V3", 0x3FEF770D40960D5A),
        SET_ENTITY_HEADING          = Natives.Invoke("Void", 0x8E2530AA8ADA980E)
    },

    HUD = {
        GET_CLOSEST_BLIP_INFO_ID = Natives.Invoke("Int", 0xD484BF71050CA1EE),
        GET_BLIP_COORDS          = Natives.Invoke("V3", 0x586AFE3FF72D996E)
    },

    INTERIOR = {
        GET_INTERIOR_FROM_ENTITY = Natives.Invoke("Int", 0x2107BA504071A6BB),
        GET_INTERIOR_AT_COORDS   = Natives.Invoke("Int", 0xB0F7F8663821D9C3),
        PIN_INTERIOR_IN_MEMORY   = Natives.Invoke("Void", 0x2CA429C029CCF247),
        IS_INTERIOR_READY        = Natives.Invoke("Void", 0x6726BDCCC1932F0E)
    },

    MONEY = {
        NETWORK_GET_VC_BANK_BALANCE   = Natives.Invoke("Int", 0x76EF28DA05EA395A),
        NETWORK_GET_VC_WALLET_BALANCE = Natives.Invoke("Int", 0xA40F9C2623F6A8B5)
    },

    NETSHOPPING = {
        NET_GAMESERVER_GET_PRICE               = Natives.Invoke("Int", 0xC27009422FCCA88D),
        NET_GAMESERVER_BASKET_IS_ACTIVE        = Natives.Invoke("Bool", 0xA65568121DF2EA26),
        NET_GAMESERVER_BASKET_END              = Natives.Invoke("Bool", 0xFA336E7F40C0A0D0),
        NET_GAMESERVER_TRANSFER_BANK_TO_WALLET = Natives.Invoke("Bool", 0xD47A2C1BA117471D),
        NET_GAMESERVER_TRANSFER_WALLET_TO_BANK = Natives.Invoke("Bool", 0xC2F7FE5309181C7D)
    },

    NETWORK = {
        NETWORK_GET_HOST_OF_SCRIPT = Natives.Invoke("Int", 0x1D6A14F1F9A736FC),
        NETWORK_IS_SESSION_STARTED = Natives.Invoke("Bool", 0x9DE624D2FC4B603F),
        NETWORK_IS_SESSION_ACTIVE  = Natives.Invoke("Bool", 0xD83C2B94E7508980),
        GET_ONLINE_VERSION         = Natives.Invoke("String", 0xFCA9373EF340AC0A)
    },

    PAD = {
        ENABLE_CONTROL_ACTION        = Natives.Invoke("Void", 0x351220255D64C155),
        SET_CONTROL_VALUE_NEXT_FRAME = Natives.Invoke("Bool", 0xE8A25867FBA3B05E),
        SET_CURSOR_POSITION          = Natives.Invoke("Bool", 0xFC695459D4D0E219)
    },

    PLAYER = {
        GET_NUMBER_OF_PLAYERS = Natives.Invoke("Int", 0x407C7F91DDB46C16)
    },

    SCRIPT = {
        REQUEST_SCRIPT                                          = Natives.Invoke("Void", 0x6EB5F71AA68F2E8E),
        SET_SCRIPT_AS_NO_LONGER_NEEDED                          = Natives.Invoke("Void", 0xC90D2DCACD56184C),
        GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH = Natives.Invoke("Int", 0x2C83A9DA6BFFC4F9),
        DOES_SCRIPT_EXIST                                       = Natives.Invoke("Bool", 0xFC04745FBE67C19A),
        HAS_SCRIPT_LOADED                                       = Natives.Invoke("Bool", 0xE6CC9F3BA0FB9EF1),
    },

    STATS = {
        GET_PACKED_STAT_INT_CODE  = Natives.Invoke("Int", 0x0BC900A6FE73770C),
        GET_PACKED_STAT_BOOL_CODE = Natives.Invoke("Bool", 0xDA7EBFC49AE3F1B0),
        SET_PACKED_STAT_INT_CODE  = Natives.Invoke("Void", 0x1581503AE529CD2E),
        SET_PACKED_STAT_BOOL_CODE = Natives.Invoke("Void", 0xDB8A58AEAA67CD07),
        STAT_INCREMENT            = Natives.Invoke("Void", 0x9B5A68C6489E9909),
        STAT_GET_STRING           = Natives.Invoke("String", 0xE50384ACC2C3DB74),
        STAT_SET_STRING           = Natives.Invoke("Void", 0xA87B2335D12531D7)
    },

    SYSTEM = {
        START_NEW_SCRIPT = Natives.Invoke("Int", 0xE81651AD79516E48)
    }
}

--#endregion
