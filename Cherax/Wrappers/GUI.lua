--#region GUI

_AddToast = GUI.AddToast

function GUI.AddToast(text, toastPos)
    _AddToast(SCRIPT_NAME, CleanToast(text), 5000, toastPos or eToastPos.TOP_RIGHT)
end

function CleanToast(text)
    local cleaned = text:gsub("^%[.-%]%s*", "")
    cleaned = cleaned:gsub("%s*ツ", ".")
    cleaned = cleaned:gsub("%..$", ".")
    return cleaned
end

--#endregion
