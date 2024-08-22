
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

local timerLoop = 5


function opcoesCarro()
    if IsPedOnFoot(PlayerPedId()) then

        local VehiclePool = GetGamePool("CVehicle")  
        for _, carro in pairs(VehiclePool) do

            if GetPlayerName(GetPlayerIndex()) == trim(string.lower(GetVehicleNumberPlateText(carro))) then

                local minha_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                local carro_pos = GetOffsetFromEntityInWorldCoords(carro, 0.0, 0.0, 0.0)
            
                if IsEntityAtCoord(PlayerPedId(), carro_pos.x, carro_pos.y, carro_pos.z, distancia_do_veiculo, distancia_do_veiculo, distancia_do_veiculo, 0, 1, 0) then
                        
                    timerLoop =5

                    DrawText3D('4-Trancar e Destrancar\n5-Abre e Fecha o porta malas\n6-Consertar por $25',carro_pos.x, carro_pos.y, carro_pos.z)
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
                        local _,dinheiro = StatGetInt('MP0_WALLET_BALANCE', -1)
                        if 25 <= tonumber(dinheiro) then
                            SetVehicleFixed(carro)
                            StatSetInt('MP0_WALLET_BALANCE', tonumber(dinheiro)-25, true)
                            FloatingHelpText('Veiculo consertado')
                        else
                            FloatingHelpText('Kit de Reparo custa ~g~$25~s~')
                        end
                    end
                        
                  
                else
                     timerLoop=1000
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