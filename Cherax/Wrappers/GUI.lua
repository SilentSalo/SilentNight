--#region GUI

_AddToast = GUI.AddToast

function GUI.AddToast(text)
    _AddToast(SCRIPT_NAME, text, 5000, eToastPos.TOP_RIGHT)
end

--#endregion
