--#region Natives

eNativeType = {
    Bool    = "Bool",
    Float   = "Float",
    Int     = "Int",
    String  = "String",
    Vector3 = "V3",
    Void    = "Void"
}

function Natives.Invoke(nativeType, hash)
    return function(...)
        return Natives[F("Invoke%s", nativeType)](hash, ...)
    end
end

--#endregion
