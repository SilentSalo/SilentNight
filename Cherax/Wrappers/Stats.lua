--#region Stats

function Stats.GetString(hash)
	return true, eNative.STATS.STAT_GET_STRING(hash, -1)
end

function Stats.SetString(hash, value)
	return eNative.STATS.STAT_SET_STRING(hash, value, true)
end

function Stats.GetDate(hash)
	local date = {
		year    = 0,
		month   = 0,
		day     = 0,
		hour    = 0,
		minute  = 0,
		second  = 0,
		msecond = 0
	}

	local fields   = { "year", "month", "day", "hour", "minute", "second", "msecond" }
	local outValue = Memory.Alloc(8 * #fields)
	local success  = eNative.STATS.STAT_GET_DATE(hash, outValue, #fields, -1)

	if not success then
		Memory.Free(outValue)
		return success, nil
	end

	for i = 1, #fields do
		date[fields[i]] = Memory.ReadInt(outValue + 8 * (i - 1))
	end

	Memory.Free(outValue)
	return success, date
end

function Stats.SetDate(hash, date)
	local value = Memory.Alloc(8 * 7)

	Memory.WriteInt(value + 8 * 0, date.year)
	Memory.WriteInt(value + 8 * 1, date.month)
	Memory.WriteInt(value + 8 * 2, date.day)
	Memory.WriteInt(value + 8 * 3, date.hour)
	Memory.WriteInt(value + 8 * 4, date.minute)
	Memory.WriteInt(value + 8 * 5, date.second)
	Memory.WriteInt(value + 8 * 6, date.msecond)

	local success = eNative.STATS.STAT_SET_DATE(hash, value, true)

	Memory.Free(value)
	return success
end

--#endregion
