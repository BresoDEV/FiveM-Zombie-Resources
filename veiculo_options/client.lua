
local index_funcao = 0
local distancia_do_veiculo = 5.0

function FloatingHelpText(txt)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(txt)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function DrawText3D(text, x, y, z)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
     
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
 
end

function trim(placa)
    return (string.gsub(placa,"^%s*(.-)%s*$","%1"))
end

RegisterCommand("placa", function(source, args)
     
	 SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0),GetPlayerName(GetPlayerIndex()))
end)

function opcoesCarro()
    if IsPedOnFoot(PlayerPedId()) then

        local VehiclePool = GetGamePool("CVehicle")  
        for _, carro in pairs(VehiclePool) do

            if GetPlayerName(GetPlayerIndex()) == trim(string.lower(GetVehicleNumberPlateText(carro))) then

                local minha_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                local carro_pos = GetOffsetFromEntityInWorldCoords(carro, 0.0, 0.0, 0.0)
            
                if IsEntityAtCoord(PlayerPedId(), carro_pos.x, carro_pos.y, carro_pos.z, distancia_do_veiculo, distancia_do_veiculo, distancia_do_veiculo, 0, 1, 0) then


                        DrawText3D('1-Trancar e Destrancar\n2-Abre e Fecha o porta malas\n3-Consertar por $25\n4-particula\n5-alerta',carro_pos.x, carro_pos.y, carro_pos.z)

                        if index_funcao == 1 then--trancar
                            if GetVehicleDoorLockStatus(carro) == 2 then
                                SetVehicleDoorsLocked(carro,1)
                                FloatingHelpText('Veiculo destrancado')
                            else
                                SetVehicleDoorsLocked(carro,2)
                                FloatingHelpText('Veiculo trancado')
                            end
                        end
                        if index_funcao == 2 then--abrir porrtamalas

                            if GetVehicleDoorAngleRatio(carro,5) > 0.0 then
                                SetVehicleDoorShut(carro,5,false)
                                FloatingHelpText('Porta malas fechado')
                            else
                                SetVehicleDoorOpen(carro,5,false,false)
                                FloatingHelpText('Porta malas aberto')
                            end

                        end
                        if index_funcao == 3 then--consertar

                            local _,dinheiro = StatGetInt('MP0_WALLET_BALANCE', -1)
                            if 25 <= tonumber(dinheiro) then
                                SetVehicleFixed(carro)
                                StatSetInt('MP0_WALLET_BALANCE', tonumber(dinheiro)-25, true)
                                FloatingHelpText('Veiculo consertado')
                            else
                                FloatingHelpText('Kit de Reparo custa ~g~$25~s~')
                            end

                        end

                        if index_funcao == 4 then--max
                            RequestNamedPtfxAsset("scr_rcbarry1")
	                        UseParticleFxAsset("scr_rcbarry1")
	                        StartParticleFxNonLoopedAtCoord("scr_alien_teleport", carro_pos.x, carro_pos.y, carro_pos.z, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)
	
                        end
                        if index_funcao == 5 then--max
                            --DIA_ZOMBIE1
                            --CHAR_DEFAULT vazio
                            --CHAR_BRYONY assistente
                            --CHAR_HUNTER vizinhno do trevor
                            --CHAR_JIMMY_BOSTON
                            --CHAR_JOE
                            --CHAR_JOSEF
                            --CHAR_MALC
                            --CHAR_MP_ARMY_CONTACT
                            local foto = "CHAR_MP_ARMY_CONTACT"
                            BeginTextCommandThefeedPost("STRING")--ok
	                        AddTextComponentSubstringPlayerName("Ola, tudo bem?")
	                        EndTextCommandThefeedPostMessagetextWithCrewTagAndAdditionalIcon(foto, foto, true, 4, 'Chris - Base', ' ', 1.0, "", 4,0)
	                        
                            EndTextCommandThefeedPostTicker(true, true)
                        end
                    
                    




                        index_funcao = 0
                    
                end
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