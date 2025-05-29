--#region Generic

SCRIPT_NAME = "Silent Night"
SCRIPT_VER  = "0.2.0"
DISCORD     = "https://discord.gg/AYpT8cBaVb"
INT32_MAX   = 2147483647
PLAYER_ID   = GTA.GetLocalPlayerId()
GTA_EDITION = Cherax.GetEdition()
MENU_PATH   = FileMgr.GetMenuRootPath()
CONFIG_DIR  = F("%s\\Lua\\SilentNight\\Data\\Config", MENU_PATH)
CAYO_DIR    = F("%s\\Lua\\SilentNight\\Data\\CayoPerico", MENU_PATH)
DIAMOND_DIR = F("%s\\Lua\\SilentNight\\Data\\DiamondCasino", MENU_PATH)
STATS_DIR   = F("%s\\Lua\\SilentNight\\Data\\Stats", MENU_PATH)
CONFIG_PATH = F("%s\\config.json", CONFIG_DIR)
NPOPULARITY = "TEMP"
TEMP_GLOBAL = "TEMP"
TEMP_LOCAL  = "TEMP"
TEMP_STAT   = "TEMP"
TEMP_PSTAT  = "TEMP"

--#endregion
