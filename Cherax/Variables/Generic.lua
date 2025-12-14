--#region Generic

SCRIPT_NAME = "Silent Night"
SCRIPT_VER  = "1.5.9"
DISCORD     = "https://discord.gg/AYpT8cBaVb"
INT32_MAX   = 2147483647
PLAYER_ID   = GTA.GetLocalPlayerId()
GTA_EDITION = string.sub(Cherax.GetEdition(), 1, 2)
MENU_PATH   = FileMgr.GetMenuRootPath()
SILENT_PATH = F("%s\\Lua\\SilentNight", MENU_PATH)
DATA_DIR    = F("%s\\Data", SILENT_PATH)
CONFIG_DIR  = F("%s\\Config", DATA_DIR)
TRANS_DIR   = F("%s\\Translations", DATA_DIR)
APART_DIR   = F("%s\\Presets\\Apartment", DATA_DIR)
CAYO_DIR    = F("%s\\Presets\\CayoPerico", DATA_DIR)
DIAMOND_DIR = F("%s\\Presets\\DiamondCasino", DATA_DIR)
DDAY_DIR    = F("%s\\Presets\\Doomsday", DATA_DIR)
STATS_DIR   = F("%s\\Stats", DATA_DIR)
CONFIG_PATH = F("%s\\config.json", CONFIG_DIR)
NPOPULARITY = "TEMP"
HOCWHEAT    = "TEMP"
SOTWHEAT    = "TEMP"
HHHEAT      = "TEMP"
TEMP_GLOBAL = "TEMP"
TEMP_LOCAL  = "TEMP"
TEMP_STAT   = "TEMP"
TEMP_PSTAT  = "TEMP"

--#endregion
