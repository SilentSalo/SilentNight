--#region GUI

_AddToast = GUI.AddToast

function GUI.AddToast(text)
    _AddToast(SCRIPT_NAME, CleanToast(text), 5000, eToastPos.TOP_RIGHT)
end

function CleanToast(text)
    local cleaned = text:gsub("^%[.-%]%s*", "")
    cleaned = cleaned:gsub("%s*ツ", ".")
    cleaned = cleaned:gsub("%..$", ".")
    return cleaned
end

--#endregion
