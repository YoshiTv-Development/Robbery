ESX = exports["es_extended"]:getSharedObject()

LangS = {
    ["player"] = "``Player:`` ",
    ["id"] = "\n ``ServerId:`` ",
    ["steam"] = "\n ``Steam:`` ",
    ["licenza"] = "\n ``Licenza:`` ",
    ["discord"] = "\n ``Discord:`` ",
    ["gruppo"] = "\n ``Gruppo:`` ",
    ["tempo"] = "\n ``Alle ore:`` ",
    ["rapinato"] = "\n ``Ha Rapinato:`` ",
    ["coordinate"] = "\n ``Alle Coordinate:`` ",
    ["moneys"] = "Soldi Sporchi"
}

ESX.RegisterServerCallback('police:disponibili', function(source, cb)
	local cops = 0
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == YD.JobRichiesto then
			cops = cops + 1
		end
	end
	cb(cops)
end)

RegisterServerEvent("rapina", function(coordinate)
    local xPlayer = ESX.GetPlayerFromId(source)
    local soldiricevere = YD.Soldi.Ricevere
    xPlayer.addInventoryItem(YD.Soldi.Item, soldiricevere)
    yoshilog(source, coordinate, soldiricevere)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    yoshi()
end)

function yoshi()
    print(YD.Lang.PrintF8)
end

function yoshilog(source, coordinate, soldiricevere)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gruppo = xPlayer.getGroup()
    local name = GetPlayerName(source)
    local now = os.date('%H:%M')
	local steam = "n/a"
    local discord = "n/a"
    local license = "n/a"
    for m, n in ipairs(GetPlayerIdentifiers(_source)) do
        if n:match("steam") then
           steam = n
        elseif n:match("discord") then
           discord = n:gsub("discord:", "")
        elseif n:match("license") then
           license = n
        end
     end
    PerformHttpRequest(YD.LogDiscord.Webhooks, function()
    end, "POST", json.encode({
        username = 'YoshiTv Developement Copyright 2023',
        embeds = {{
            author = {
                name = "[YD DEV] Version 1.0",
                url = "https://discord.gg/udH3eUJ2EB",
            },
            title = YD.LogDiscord.Title,
            description = LangS.player..name..LangS.id..source..LangS.gruppo..gruppo..LangS.discord.."<@"..discord..">"..LangS.tempo..now..LangS.rapinato..soldiricevere.."$ "..LangS.moneys..LangS.coordinate..coordinate.."\n\n **YoshiTv Development - YoshiTv**",
            color = YD.LogDiscord.Color
        }}}),{["Content-Type"] = "application/json"})
end