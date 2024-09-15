
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
    return string.gsub(placa, "%s+", "")
end

local timerLoop = 5

local numeroDecimal
local numeroHexadecimal

function joaat(str)
    local hash = 0
    for i = 1, #str do
        local char = str:byte(i)
        hash = ((hash + char) * 0x01000193) % 2^32
    end
    return hash
end

 


function opcoesCarro()
    if IsPedOnFoot(PlayerPedId()) then

        local VehiclePool = GetGamePool("CVehicle")  
        for _, carro in pairs(VehiclePool) do

            numeroDecimal = joaat(GetPlayerName(GetPlayerIndex()))
            numeroHexadecimal = string.format("%X", numeroDecimal)

			 
            if tostring(trim(numeroHexadecimal)) == trim(GetVehicleNumberPlateText(carro)) then
				 
                local minha_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                local carro_pos = GetOffsetFromEntityInWorldCoords(carro, 0.0, 0.0, 0.0)
            
                if IsEntityAtCoord(PlayerPedId(), carro_pos.x, carro_pos.y, carro_pos.z, distancia_do_veiculo, distancia_do_veiculo, distancia_do_veiculo, 0, 1, 0) then
                         

                    DrawText3D('4-Trancar e Destrancar\n5-Abre e Fecha o porta malas\n6-Consertar\n7-Abastecer',carro_pos.x, carro_pos.y, carro_pos.z)
                    if IsDisabledControlJustPressed(2, 108) then--4
                        if GetVehicleDoorLockStatus(carro) == 2 then
                            SetVehicleDoorsLocked(carro,1)
                            FloatingHelpText('Veiculo destrancado')
                        else
                            SetVehicleDoorsLocked(carro,2)
                            FloatingHelpText('Veiculo trancado')
                        end
                    end
                    if IsDisabledControlJustPressed(2, 110) then--5
                        if GetVehicleDoorAngleRatio(carro,5) > 0.0 then
                            SetVehicleDoorShut(carro,5,false)
                            FloatingHelpText('Porta malas fechado')
                        else
                            SetVehicleDoorOpen(carro,5,false,false)
                            FloatingHelpText('Porta malas aberto')
                        end
                    end
                    if IsDisabledControlJustPressed(2, 109) then--6
                        
                        local _, kit_reparo = StatGetInt('MPPLY_CREW_LOCAL_XP_1', -1)
                        if 1 <= tonumber(kit_reparo) then
                            SetVehicleFixed(carro)
                            StatSetInt('MPPLY_CREW_LOCAL_XP_1', tonumber(kit_reparo)-1, true)
                            FloatingHelpText('Veiculo consertado')
                        else
                            FloatingHelpText('Voce nao possue ~b~kit de reparos')
                        end

                    end
                    if IsDisabledControlJustPressed(2, 117) then--7
                        local _, gasolina = StatGetInt('MPPLY_CREW_LOCAL_TIME_4', -1)
                        if 1 <= tonumber(gasolina) then
                            SetVehicleDirtLevel(carro,0.0)
                            StatSetInt('MPPLY_CREW_LOCAL_TIME_4', tonumber(gasolina)-1, true)
                            FloatingHelpText('Veiculo abastecido')
                        else
                            FloatingHelpText('Voce nao possue ~b~gasolina')
                        end
                    end
                        
                   
                end
            end
        end
    end
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(timerLoop)
        opcoesCarro() 
    end
end)