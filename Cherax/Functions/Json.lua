--#region Json

-- Modified version of https://github.com/rxi/json.lua

Json = {}

local Encode

local escapeCharMap = {
    [ "\\" ] = "\\",
    [ "\"" ] = "\"",
    [ "\b" ] = "b",
    [ "\f" ] = "f",
    [ "\n" ] = "n",
    [ "\r" ] = "r",
    [ "\t" ] = "t",
}

local escapeCharMapInv = { [ "/" ] = "/" }

for k, v in pairs(escapeCharMap) do
    escapeCharMapInv[v] = k
end

local function EscapeChar(c)
    return "\\" .. (escapeCharMap[c] or F("u%04x", c:byte()))
end

local function EncodeNil()
    return "null"
end

local function EncodeTable(val, stack)
    local res = {}
    stack = stack or {}

    -- Circular reference?
    if stack[val] then SilentLogger.LogError("circular reference") end

    stack[val] = true

    if rawget(val, 1) ~= nil or next(val) == nil then
        -- Treat as array -- check keys are valid and it is not sparse
        local n = 0
        for k in pairs(val) do
            if type(k) ~= "number" then
                SilentLogger.LogError("invalid table: mixed or invalid key types")
            end
            n = n + 1
        end
        if n ~= #val then
            SilentLogger.LogError("invalid table: sparse array")
        end
        -- Encode
        for i, v in ipairs(val) do
            I(res, Encode(v, stack))
        end
        stack[val] = nil
        return "[" .. table.concat(res, ",") .. "]"
    else
        -- Treat as an object
        for k, v in pairs(val) do
            if type(k) ~= "string" then
                SilentLogger.LogError("invalid table: mixed or invalid key types")
            end
            I(res, Encode(k, stack) .. ":" .. Encode(v, stack))
        end
        stack[val] = nil
        return "{" .. table.concat(res, ",") .. "}"
    end
end

local function EncodeString(val)
    return '"' .. val:gsub('[%z\1-\31\\"]', EscapeChar) .. '"'
end

local function EncodeNumber(val)
    -- Check for NaN, -inf and inf
    if val ~= val or val <= -math.huge or val >= math.huge then
        SilentLogger.LogError("unexpected number value '" .. S(val) .. "'")
    end
    return F("%.14g", val)
end

local typeFuncMap = {
    [ "nil"     ] = EncodeNil,
    [ "table"   ] = EncodeTable,
    [ "string"  ] = EncodeString,
    [ "number"  ] = EncodeNumber,
    [ "boolean" ] = S,
}

Encode = function(val, stack)
    local t = type(val)
    local f = typeFuncMap[t]
    if f then
        return f(val, stack)
    end
    SilentLogger.LogError("unexpected type '" .. t .. "'")
end

function Json.Encode(val, indent)
    indent = indent or "\t"
    local function EncodeValue(value, stack, currentIndent)
        local t = type(value)
        stack = stack or {}
        currentIndent = currentIndent or ""

        if t == "table" then
            if stack[value] then SilentLogger.LogError("circular reference") end
            stack[value] = true

            local res = {}
            local nextIndent = currentIndent .. indent

            if rawget(value, 1) ~= nil or next(value) == nil then
                -- Array
                for _, v in ipairs(value) do
                    I(res, nextIndent .. EncodeValue(v, stack, nextIndent))
                end
                stack[value] = nil
                return "[\n" .. table.concat(res, ",\n") .. "\n" .. currentIndent .. "]"
            else
                -- Object (sort keys alphabetically)
                local keys = {}
                for k, _ in pairs(value) do
                    if type(k) ~= "string" then
                        SilentLogger.LogError("invalid table: mixed or invalid key types")
                    end
                    table.insert(keys, k)
                end
                table.sort(keys)
                for _, k in ipairs(keys) do
                    I(res, nextIndent .. EncodeString(k) .. ": " .. EncodeValue(value[k], stack, nextIndent))
                end
                stack[value] = nil
                return "{\n" .. table.concat(res, ",\n") .. "\n" .. currentIndent .. "}"
            end
        else
            return Encode(value, stack)
        end
    end

    return EncodeValue(val)
end

local Parse

local function CreateSet(...)
    local res = {}
    for i = 1, select("#", ...) do
        res[select(i, ...)] = true
    end
    return res
end

local spaceChars = CreateSet(" ", "\t", "\r", "\n")
local delimChars = CreateSet(" ", "\t", "\r", "\n", "]", "}", ",")
local escapeChars = CreateSet("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals = CreateSet("true", "false", "null")

local literalMap = {
    ["true"] = true,
    ["false"] = false,
    ["null"] = nil,
}

local function NextChar(str, idx, set, negate)
    for i = idx, #str do
        if set[str:sub(i, i)] ~= negate then
            return i
        end
    end
    return #str + 1
end

local function DecodeError(str, idx, msg)
    local lineCount = 1
    local colCount = 1
    for i = 1, idx - 1 do
        colCount = colCount + 1
        if str:sub(i, i) == "\n" then
            lineCount = lineCount + 1
            colCount = 1
        end
    end
    SilentLogger.LogError(F("%s at line %d col %d", msg, lineCount, colCount))
end

local function CodepointToUtf8(n)
    local f = math.floor
    if n <= 0x7f then
        return string.char(n)
    elseif n <= 0x7ff then
        return string.char(f(n / 64) + 192, n % 64 + 128)
    elseif n <= 0xffff then
        return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
    elseif n <= 0x10ffff then
        return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128, f(n % 4096 / 64) + 128, n % 64 + 128)
    end
    SilentLogger.LogError(F("invalid unicode codepoint '%x'", n))
end

local function ParseUnicodeEscape(s)
    local n1 = N(s:sub(1, 4), 16)
    local n2 = N(s:sub(7, 10), 16)
    -- Surrogate pair?
    if n2 then
        return CodepointToUtf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
    else
        return CodepointToUtf8(n1)
    end
end

local function ParseString(str, i)
    local res = ""
    local j = i + 1
    local k = j

    while j <= #str do
        local x = str:byte(j)

        if x < 32 then
            DecodeError(str, j, "control character in string")
        elseif x == 92 then -- `\`: Escape
            res = res .. str:sub(k, j - 1)
            j = j + 1
            local c = str:sub(j, j)
            if c == "u" then
                local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                    or str:match("^%x%x%x%x", j + 1)
                    or DecodeError(str, j - 1, "invalid unicode escape in string")
                res = res .. ParseUnicodeEscape(hex)
                j = j + #hex
            else
                if not escapeChars[c] then
                    DecodeError(str, j - 1, "invalid escape char '" .. c .. "' in string")
                end
                res = res .. escapeCharMapInv[c]
            end
            k = j + 1
        elseif x == 34 then -- `"`: End of string
            res = res .. str:sub(k, j - 1)
            return res, j + 1
        end

        j = j + 1
    end

    DecodeError(str, i, "expected closing quote for string")
end

local function ParseNumber(str, i)
    local x = NextChar(str, i, delimChars)
    local s = str:sub(i, x - 1)
    local n = N(s)
    if not n then
        DecodeError(str, i, "invalid number '" .. s .. "'")
    end
    return n, x
end

local function ParseLiteral(str, i)
    local x = NextChar(str, i, delimChars)
    local word = str:sub(i, x - 1)
    if not literals[word] then
        DecodeError(str, i, "invalid literal '" .. word .. "'")
    end
    return literalMap[word], x
end

local function ParseArray(str, i)
    local res = {}
    local n = 1
    i = i + 1
    while 1 do
        local x
        i = NextChar(str, i, spaceChars, true)
        -- Empty / end of array?
        if str:sub(i, i) == "]" then
            i = i + 1
            break
        end
        -- Read token
        x, i = Parse(str, i)
        res[n] = x
        n = n + 1
        -- Next token
        i = NextChar(str, i, spaceChars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "]" then break end
        if chr ~= "," then DecodeError(str, i, "expected ']' or ','") end
    end
    return res, i
end

local function ParseObject(str, i)
    local res = {}
    i = i + 1
    while 1 do
        local key, val
        i = NextChar(str, i, spaceChars, true)
        -- Empty / end of object?
        if str:sub(i, i) == "}" then
            i = i + 1
            break
        end
        -- Read key
        if str:sub(i, i) ~= '"' then
            DecodeError(str, i, "expected string for key")
        end
        key, i = Parse(str, i)
        -- Read ':' delimiter
        i = NextChar(str, i, spaceChars, true)
        if str:sub(i, i) ~= ":" then
            DecodeError(str, i, "expected ':' after key")
        end
        i = NextChar(str, i + 1, spaceChars, true)
        -- Read value
        val, i = Parse(str, i)
        -- Set
        res[key] = val
        -- Next token
        i = NextChar(str, i, spaceChars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "}" then break end
        if chr ~= "," then DecodeError(str, i, "expected '}' or ','") end
    end
    return res, i
end

local charFuncMap = {
    [ '"' ] = ParseString,
    [ "0" ] = ParseNumber,
    [ "1" ] = ParseNumber,
    [ "2" ] = ParseNumber,
    [ "3" ] = ParseNumber,
    [ "4" ] = ParseNumber,
    [ "5" ] = ParseNumber,
    [ "6" ] = ParseNumber,
    [ "7" ] = ParseNumber,
    [ "8" ] = ParseNumber,
    [ "9" ] = ParseNumber,
    [ "-" ] = ParseNumber,
    [ "t" ] = ParseLiteral,
    [ "f" ] = ParseLiteral,
    [ "n" ] = ParseLiteral,
    [ "[" ] = ParseArray,
    [ "{" ] = ParseObject,
}

Parse = function(str, idx)
    local chr = str:sub(idx, idx)
    local f = charFuncMap[chr]
    if f then
        return f(str, idx)
    end
    DecodeError(str, idx, "unexpected character '" .. chr .. "'")
end

function Json.Decode(str)
    if type(str) ~= "string" or str == "" then
        SilentLogger.LogError("expected non-empty string, got " .. S(str))
    end
    local res, idx = Parse(str, NextChar(str, 1, spaceChars, true))
    idx = NextChar(str, idx, spaceChars, true)
    if idx <= #str then
        DecodeError(str, idx, "trailing garbage")
    end
    return res
end

function Json.EncodeToFile(path, tbl)
    if FileMgr.DoesFileExist(path) then
        FileMgr.DeleteFile(path)
    end

    FileMgr.WriteFileContent(path, Json.Encode(tbl), false)
end

function Json.DecodeFromFile(path)
    if not FileMgr.DoesFileExist(path) then
       SilentLogger.LogError(F("File not found: %s", path))
    end

    return Json.Decode(FileMgr.ReadFileContent(path))
end

--#endregion
