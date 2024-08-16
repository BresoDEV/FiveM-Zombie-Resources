
local tempoWait = {
    valor= 5
}


function addLootAleatorio()

    local stats = {
        'MPPLY_CREW_HEIST_CASH_0', --madeira
        'MPPLY_CREW_HEIST_CASH_1', --ferro
        'MPPLY_CREW_LOCAL_TIME_3', --vidro
        'MPPLY_CREW_LOCAL_TIME_2', --plastico
        'MPPLY_CREW_LOCAL_XP_4', --pano
        'MPPLY_CREW_LOCAL_XP_3', --corda
        'MPPLY_CREW_CHALENGE_WIN', --polvora
    }

    local indice = math.random(1, #stats)

    local _, pm = StatGetInt(stats[indice], -1)
    local final = tonumber(pm) + tonumber(GetRandomIntInRange(0,3))
    StatSetInt(stats[indice], tonumber(final), true)

    
    indice = math.random(1, #stats)

    local _, pm = StatGetInt(stats[indice], -1)
    local final = tonumber(pm) + tonumber(GetRandomIntInRange(0,3))
    StatSetInt(stats[indice], tonumber(final), true)

    indice = math.random(1, #stats)

    local _, pm = StatGetInt(stats[indice], -1)
    local final = tonumber(pm) + tonumber(GetRandomIntInRange(0,3))
    StatSetInt(stats[indice], tonumber(final), true)
  
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

function alerta(txt)
    SetTextFont(0)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(txt)
    DrawNotification(false, true)
end

function ADD_CHECKPOINT(icone,x,y,z,rotacao)
    if icone == 29 then
        DrawMarker(icone, x, y, z, 0.0, 0.0, 0.0, 0.0, rotacao, 0.0, 1.0, 1.0, 1.0, 0, 255, 0,200, false, true, 2, nil, nil, false)
    end 
    if icone == 2 then
        DrawMarker(icone, x, y, z, 0.0, 0.0, 0.0, 0.0, rotacao, 0.0, 1.0, 1.0, 1.0, 255, 0, 0,200, false, true, 2, nil, nil, false)
    end
    
end

function drawLineProps()
    local objPool = GetGamePool("CObject")
    local coords = GetEntityCoords(PlayerPedId())
    for _, prop in pairs(objPool) do
        

        local Lixeira = false
        local ATM = false

        -------------------------------------------------------------
        if (GetEntityModel(prop) == GetHashKey('prop_dumpster_02a')) then
            Lixeira = true
        end
        if (GetEntityModel(prop) == GetHashKey('prop_dumpster_3a')) then
            Lixeira = true
        end
        if (GetEntityModel(prop) == GetHashKey('prop_dumpster_4a')) then
            Lixeira = true
        end
        if (GetEntityModel(prop) == GetHashKey('prop_dumpster_4b')) then
            Lixeira = true
        end
        if (GetEntityModel(prop) == GetHashKey('prop_dumpster_01a')) then
            Lixeira = true
        end
        -------------------------------------------------------------
        if (GetEntityModel(prop) == GetHashKey('prop_atm_01')) then
            ATM = true
        end

        -------------------------------------------------------------



        if Lixeira or ATM then

            if GetEntityAlpha(prop) == 255 then
-------------------------------------------------------------------------------------------
                if Lixeira then
                    local propCoord = GetOffsetFromEntityInWorldCoords(prop, 0.0, -1.0, 1.0)

                    --local myCor = GetEntityCoords(PlayerPedId())
                    --DrawLine(myCor.x, myCor.y, myCor.z, propCoord.x, propCoord.y, propCoord.z, 0, 255, 0, 255)

                    if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 20.0, 20.0, 20.0, 0, 1, 0) then
                        
                        tempoWait.valor = 5
                        ADD_CHECKPOINT(2, propCoord.x, propCoord.y, propCoord.z, 180.0)

                        if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 5.0, 5.0, 5.0, 0, 1, 0) then
                            DrawText3D('Aperte [E] para coletar', propCoord.x, propCoord.y, propCoord.z)

                            if IsPedOnFoot(PlayerPedId()) then
                                if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 1.0, 1.0, 1.0, 0, 1, 0) then

                                    if IsControlJustPressed(0,38) then
                                        SetEntityAlpha(prop, 254, false)
                                        alerta('Recursos Coletados')
                                        addLootAleatorio()
                                    end
                                end
                            end
                        end    
                    end
                end
-------------------------------------------------------------------------------------------
                if ATM then
                    local propCoord = GetOffsetFromEntityInWorldCoords(prop, 0.0, -0.5, 1.5)
                
                    --local myCor = GetEntityCoords(PlayerPedId())
                    --DrawLine(myCor.x, myCor.y, myCor.z, propCoord.x, propCoord.y, propCoord.z, 0, 255, 0, 255)
                
                    if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 20.0, 20.0, 20.0, 0, 1, 0) then
                        
                        tempoWait.valor = 5
                        ADD_CHECKPOINT(29, propCoord.x, propCoord.y, propCoord.z, 0.0)
                    
                        if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 5.0, 5.0, 5.0, 0, 1, 0) then
                            DrawText3D('Aperte [E] para coletar', propCoord.x, propCoord.y, propCoord.z)
                        
                            if IsPedOnFoot(PlayerPedId()) then
                                if IsEntityAtCoord(PlayerPedId(), propCoord.x, propCoord.y, propCoord.z, 1.0, 1.0, 1.0, 0, 1, 0) then
                                
                                    if IsControlJustPressed(0,38) then
                                        SetEntityAlpha(prop, 254, false)
                                        alerta('~g~Dinheiro~s~ Coletado')
                                        
                                        local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
                                        local final = tonumber(pm) + tonumber(GetRandomIntInRange(1,50))
                                        StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
                                    end
                                end
                            end
                        end
                    end
                end
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

            end
        end
    end
end


CreateThread(function()
    while true do
        Wait(tempoWait.valor)
        drawLineProps()
    end
end)