ESX = exports["es_extended"]:getSharedObject()
local PlayerLavoro = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerLavoro = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerLavoro.job = job
end)

for k, v in pairs(PosRapine) do 
    rapina = AddBlipForCoord(v+vector3(0.0,0.0,0.0))
    SetBlipSprite(rapina, YD.Blips.Sprite)
    SetBlipScale(rapina, YD.Blips.Scale)
    SetBlipColour(rapina, YD.Blips.Colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(YD.Blips.Name)
    EndTextCommandSetBlipName(rapina)
end

for k, v in pairs(PosRapine) do
    TriggerEvent('gridsystem:registerMarker', {
        name = '_PosRapine'..k,
        pos = v+vector3(0.0,0.0,0.0),
        scale = vector3(0.2, 0.2, 0.2),
        size = vector3(2.0, 2.0, 2.0),
        msg = YD.Lang.Gridsystem,
        type = YD.Gridsystem.Type,
        show3D = YD.Gridsystem.Show3D,
        color =  YD.Gridsystem.Color,
        drawDistance = YD.Gridsystem.Distance,
        control = YD.Gridsystem.Control,
        action = function()
            ESX.TriggerServerCallback('police:disponibili', function(policedisponibile, coordinate)
                if policedisponibile >= YD.PoliceNecessaria then
                    if IsPedArmed(PlayerPedId(), 1) or IsPedArmed(PlayerPedId(), 2) or IsPedArmed(PlayerPedId(), 4) then
                        ESX.ShowNotification(YD.Lang.Allarme)
                        NotificaPolizia()
			FreezeEntityPosition(ped, true)
                        if YD.Progress.Bar then
                            if lib.progressBar({
                                duration = YD.Progress.Tempo,
                                label = YD.Lang.ProgressMsg,
                                useWhileDead = false,
                                canCancel = true,
                                anim = {
                                    dict = YD.Progress.AnimDict,
                                    clip = YD.Progress.AnimClip,
                                },
                            }) then TriggerServerEvent('rapina', GetEntityCoords(PlayerPedId())) end
                                ESX.ShowNotification(YD.Lang.RapinaSuccess)
				FreezeEntityPosition(ped, false)
                        elseif YD.Progress.Circle.Active then 
                            if lib.progressCircle({
                                duration = YD.Progress.Tempo,
                                label = YD.Lang.ProgressMsg,
                                position = YD.Progress.Position,
                                useWhileDead = false,
                                canCancel = true,
                                anim = {
                                    dict = YD.Progress.AnimDict,
                                    clip = YD.Progress.AnimClip,
                                },
                            }) then TriggerServerEvent('rapina', GetEntityCoords(PlayerPedId())) end
                                ESX.ShowNotification(YD.Lang.RapinaSuccess)
                        end
                    else
                        ESX.ShowNotification(YD.Lang.WeaponError)
                    end
                else
                    ESX.ShowNotification(YD.Lang.PoliceError)
                end
            end)
        end
    })
end
