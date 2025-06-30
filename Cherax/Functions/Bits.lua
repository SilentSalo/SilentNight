--#region Bits

Bits = {}

function Bits.GetBit(value, position)
	return (value >> position) & 1
end

function Bits.SetBit(value, position)
    return value | (1 << position)
end

function Bits.IsBitSet(value, position)
	return (value & (1 << position)) ~= 0
end

function Bits.ClearBit(value, position)
	return value & ~(1 << position)
end

function Bits.ToggleBit(value, position)
	return value ~ (1 << position)
end

function Bits.SetBits(value, positions)
	for _, position in ipairs(positions) do
		value = Bits.SetBit(value, position)
	end
	return value
end

function Bits.IsAnyBitSet(value, positions)
	for _, position in ipairs(positions) do
		if Bits.IsBitSet(value, position) then
			return true
		end
	end
	return false
end

function Bits.ClearBits(value, positions)
	for _, position in ipairs(positions) do
		value = Bits.ClearBit(value, position)
	end
	return value
end

function Bits.ToggleBits(value, positions)
	for _, position in ipairs(positions) do
		value = Bits.ToggleBit(value, position)
	end
	return value
end

--#endregion
