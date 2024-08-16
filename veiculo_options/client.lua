local tudoCerto = false
local index_funcao = 0

function FloatingHelpText(txt)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(txt)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function DrawText3D(text, x, y, z)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function opcoesCarro()
    local VehiclePool = GetGamePool("CVehicle")  
    for _, carro in pairs(VehiclePool) do
        
        local minha_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
        local carro_pos = GetOffsetFromEntityInWorldCoords(carro, 0.0, 0.0, 0.0)
        
        if IsEntityAtCoord(PlayerPedId(), carro_pos.x, carro_pos.y, carro_pos.z, 10.0, 10.0, 10.0, 0, 1, 0) then
            if IsPedOnFoot(PlayerPedId()) then
                
                DrawText3D('1-Tranca\n2-Destranca\n3-Abre porta malas\n4-Fecha porta malas\n5-Liga o motor\n6-Desliga o motor\n7-Waypoint\n8-Tunning Max\n9 ao 13 - Sons\n15- RP',carro_pos.x, carro_pos.y, carro_pos.z)

                if index_funcao == 1 then--trancar
                    SetVehicleDoorsLocked(carro,10)
                    FloatingHelpText('Veiculo trancado')
                end
                if index_funcao == 2 then--destrancar
                    SetVehicleDoorsLocked(carro,1)
                    FloatingHelpText('Veiculo destrancado')
                end
                if index_funcao == 3 then--abrir porrtamalas
                    SetVehicleDoorOpen(carro,5,false,false)
                    FloatingHelpText('Porta malas aberto')
                end
                
                if index_funcao == 4 then--fechar porrtamalas
                    SetVehicleDoorShut(carro,5,false)
                    FloatingHelpText('Porta malas fechado')
                end
                if index_funcao == 5 then--ligar motor
                    SetVehicleEngineOn(carro,true,false,false)
                    FloatingHelpText('Motor ligado')
                end
                if index_funcao == 6 then--desligar motor
                    SetVehicleEngineOn(carro,false,false,false)
                    FloatingHelpText('Motor desligado')
                end
                if index_funcao == 7 then--WAYPOINT
                    local WaypointHandle = GetFirstBlipInfoId(8)

				    if DoesBlipExist(WaypointHandle) then
				        local WaypointPos = GetBlipCoords(WaypointHandle)
					    TaskVehicleDriveToCoord(PlayerPedId(), carro, WaypointPos.x, WaypointPos.y, WaypointPos.z, 18.0, 0, carro, 6, 1.0, true);
				    else
				        FloatingHelpText("~r~PLEASE SET A WAYPOINT!");
                    end
                end
                if index_funcao == 8 then--max
                     SetVehicleModKit(carro, 0)
                    for i = 0, 50 do
                        SetVehicleMod(carro, i,
                            GetNumVehicleMods(carro, i) - 1, false)
                    end
                    SetVehicleNumberPlateText(carro, "bresodev")
                    FloatingHelpText("Tunado ao maximo");
                end
                
                if index_funcao == 9 then
                    PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FREEMODE_SOUNDSET", 1)
                end
                if index_funcao == 10 then
                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FREEMODE_SOUNDSET", 1)
                end
                if index_funcao == 11 then
                    PlaySoundFrontend(-1, "SELECT", "HUD_FREEMODE_SOUNDSET", 1)
                end
                if index_funcao == 12 then
                    PlaySoundFrontend(-1, "CANCEL", "HUD_FREEMODE_SOUNDSET", 1)
                end
                if index_funcao == 13 then
                    SetEntityRenderScorched(carro, true);
                end
                if index_funcao == 15 then
                    StatSetInt('MP0_CHAR_XP_FM',123456 ,true);
                end
                




                index_funcao = 0
          
            end
        end
    end
end



RegisterCommand("opt", function(source, args)
    index_funcao = tonumber(args[1])
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        opcoesCarro() 
    end
end)