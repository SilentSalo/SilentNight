--#region Cloudflare

local workerUrl = "https://silent-night.silentsalo.workers.dev"

local function GetScriptEdition(uid)
    local curl = Curl.Easy()
    local url  = F("%s/?uid=%s", workerUrl, uid)

    curl:Setopt(eCurlOption.CURLOPT_URL, url)
    curl:Setopt(eCurlOption.CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
    curl:Perform()

    while not curl:GetFinished() do
        Script.Yield(10)
    end

    local curlCode, body = curl:GetResponse()

    if curlCode ~= eCurlCode.CURLE_OK then
        return "Standard"
    end

    local status, data = pcall(Json.Decode, body)

    if not status or not data then
        return "Standard"
    end

    if data.supporter == "OG Supporter" or data.supporter == "Supporter" then
        return data.supporter
    else
        return "Standard"
    end
end

Script.QueueJob(function()
	SCRIPT_EDTN = GetScriptEdition(Cherax.GetUID())
end)

--#endregion
