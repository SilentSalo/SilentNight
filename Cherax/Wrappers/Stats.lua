--#region Stats

function Stats.GetString(hash)
	return true, eNative.STATS.STAT_GET_STRING(hash, -1)
end

function Stats.SetString(hash, value)
	return eNative.STATS.STAT_SET_STRING(hash, value, true)
end

--#endregion
