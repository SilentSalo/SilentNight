--#region Startup

local GTA_VERSION = "1.72"

if Natives.InvokeString(0xFCA9373EF340AC0A) ~= GTA_VERSION then
	Logger.Log(eLogColor.LIGHTRED, "Silent Night", "Online version mismatch. Unable to start Silent Night ツ")
	GUI.AddToast("Silent Night", "Online version mismatch. Unable to start Silent Night.", 5000, eToastPos.TOP_RIGHT)
	SetShouldUnload()
	return
end

--#endregion
