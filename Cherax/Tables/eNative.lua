function InvokeNative(returnType, hash)
    local arg1, arg2
    if type(returnType) == "string" then
        arg1, arg2 = returnType, hash
    else
        arg1, arg2 = "Void", returnType
    end
    return function(...)
        return Natives[string.format("Invoke%s", arg1)](arg2, ...)
    end
end

eNative = {
    CUTSCENE = {
        STOP_CUTSCENE_IMMEDIATELY = InvokeNative(0xD220BDD222AC4A1E)
    },
    MONEY = {
        NETWORK_GET_VC_BANK_BALANCE   = InvokeNative("Int", 0x76EF28DA05EA395A),
        NETWORK_GET_VC_WALLET_BALANCE = InvokeNative("Int", 0xA40F9C2623F6A8B5)
    },
    NETSHOPPING = {
        NET_GAMESERVER_GET_PRICE               = InvokeNative("Int", 0xC27009422FCCA88D),
        NET_GAMESERVER_BASKET_IS_ACTIVE        = InvokeNative("Bool", 0xA65568121DF2EA26),
        NET_GAMESERVER_BASKET_END              = InvokeNative("Bool", 0xFA336E7F40C0A0D0),
        NET_GAMESERVER_TRANSFER_BANK_TO_WALLET = InvokeNative("Bool", 0xD47A2C1BA117471D),
        NET_GAMESERVER_TRANSFER_WALLET_TO_BANK = InvokeNative("Bool", 0xC2F7FE5309181C7D)
    },
    NETWORK = {
        NETWORK_GET_HOST_OF_SCRIPT = InvokeNative("Int", 0x1D6A14F1F9A736FC),
        NETWORK_IS_SESSION_STARTED = InvokeNative("Bool", 0x9DE624D2FC4B603F),
        NETWORK_IS_SESSION_ACTIVE  = InvokeNative("Bool", 0xD83C2B94E7508980)
    },
    PAD = {
        ENABLE_CONTROL_ACTION        = InvokeNative(0x351220255D64C155),
        SET_CONTROL_VALUE_NEXT_FRAME = InvokeNative("Bool", 0xE8A25867FBA3B05E),
        SET_CURSOR_POSITION          = InvokeNative("Bool", 0xFC695459D4D0E219)
    },
    PLAYER = {
        GET_NUMBER_OF_PLAYERS = InvokeNative("Int", 0x407C7F91DDB46C16)
    },
    SCRIPT = {
        REQUEST_SCRIPT                                          = InvokeNative(0x6EB5F71AA68F2E8E),
        SET_SCRIPT_AS_NO_LONGER_NEEDED                          = InvokeNative(0xC90D2DCACD56184C),
        GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH = InvokeNative("Int", 0x2C83A9DA6BFFC4F9),
        DOES_SCRIPT_EXIST                                       = InvokeNative("Bool", 0xFC04745FBE67C19A),
        HAS_SCRIPT_LOADED                                       = InvokeNative("Bool", 0xE6CC9F3BA0FB9EF1),
    },
    STATS = {
        GET_PACKED_STAT_INT_CODE  = InvokeNative("Int", 0x0BC900A6FE73770C),
        GET_PACKED_STAT_BOOL_CODE = InvokeNative("Bool", 0xDA7EBFC49AE3F1B0),
        SET_PACKED_STAT_INT_CODE  = InvokeNative(0x1581503AE529CD2E),
        SET_PACKED_STAT_BOOL_CODE = InvokeNative(0xDB8A58AEAA67CD07)
    },
    SYSTEM = {
        START_NEW_SCRIPT = InvokeNative("Int", 0xE81651AD79516E48)
    },
    ENTITY = {
        SET_ENTITY_COORDS_NO_OFFSET = InvokeNative(0x239A3351AC1DA385),
        GET_ENTITY_COORDS           = InvokeNative("Bool", 0x3FEF770D40960D5A)
    }
}
