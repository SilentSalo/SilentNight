--#region Natives

function Natives.Invoke(returnType, hash)
    return function(...)
        return Natives[F("Invoke%s", returnType)](hash, ...)
    end
end

--#endregion
