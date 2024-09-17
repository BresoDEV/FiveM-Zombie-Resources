local display = true

function SetDisplay(bool)
    display = bool
   
end

SetDisplay(display)





function ADD_CHECKPOINT(icone,x,y,z,rotacao)
    DrawMarker(icone, x, y, z, 0.0, 0.0, 0.0, 0.0, rotacao, 0.0, 1.0, 1.0, 1.0, 255, 0, 0,200, false, true, 2, nil, nil, false)
end

function alerta(txt)
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

function abastecimento()
    if not IsPedOnFoot(PlayerPedId()) then
        local objPool = GetGamePool("CObject") 
        for _, prop in pairs(objPool) do
        

            local bombaGasolina = false 

            -------------------------------------------------------------
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_old2')) then
                bombaGasolina = true
            end
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_1c')) then
                bombaGasolina = true
            end  
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_1a')) then
                bombaGasolina = true
            end
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_1b')) then
                bombaGasolina = true
            end
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_1d')) then
                bombaGasolina = true
            end
            if (GetEntityModel(prop) == GetHashKey('prop_gas_pump_old3')) then
                bombaGasolina = true
            end

             -------------------------------------------------------------


            if bombaGasolina then

                if GetEntityAlpha(prop) == 255 then

                    local propCoord = GetOffsetFromEntityInWorldCoords(prop, 0.0, 4.2, 1.2)

                        --local myCor = GetEntityCoords(PlayerPedId())
                        --DrawLine(myCor.x, myCor.y, myCor.z, propCoord.x, propCoord.y, propCoord.z, 0, 255, 0, 255)

                    if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 20.0, 20.0, 20.0, 0, 1, 0) then

                        ADD_CHECKPOINT(2, propCoord.x, propCoord.y, propCoord.z, 180.0)

                        if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 5.0, 5.0, 5.0, 0, 1, 0) then
                            DrawText3D('Aperte [E] para abastecer', propCoord.x, propCoord.y, propCoord.z)


                            if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 1.0, 1.0, 1.0, 0, 1, 0) then

                                if IsControlJustPressed(0,38) then
                                    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
                                    if tonumber(pm) >= 20 then
                                    
                                        SetEntityAlpha(prop, 254, false)
                                        alerta('Veiculo abastecido')
                                        SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false),0.0)
                                    
                                        local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
                                        local final = tonumber(pm) - 20
                                        StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
                                    else
                                        alerta('Voce precisa de ~b~$20~s~ para abastecer')
                                    end         
                                end         
                            end
                        end 
                    end
                end
            end
        end
    end
end

function drawText2(texto,fonte, x, y,tx,ty)
    SetTextCentre(false);
    SetTextRightJustify(false);
    SetTextColour(255, 255, 255, 255);
    SetTextFont(fonte);
    SetTextScale(tx, ty);
    BeginTextCommandDisplayText("STRING");
    AddTextComponentSubstringPlayerName(texto);
    EndTextCommandDisplayText(x, y);
end

function marcadorGasolina()
    if not IsPedOnFoot(PlayerPedId()) then
        
        local Gasosa1 = GetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false))
        local Gasosa = tonumber(string.format("%.1f", Gasosa1))

        SendNUIMessage({
            status = true,
            gasolina=Gasosa
        })

    else
        SendNUIMessage({
            status = false
        })
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        abastecimento() 
        marcadorGasolina()
    end
end)
 








Citizen.CreateThread(function()

    while display do
        Citizen.Wait(1000)
        local playerX = GetEntityCoords(PlayerPedId()).x
        local playerY = GetEntityCoords(PlayerPedId()).y
        local playerZ = GetEntityCoords(PlayerPedId()).z
        local playerAngle = GetEntityHeading(PlayerPedId())

        
    end
end)

