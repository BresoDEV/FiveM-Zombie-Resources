
function addLootAleatorio()

    --madeira
    local _, pm = StatGetInt("MPPLY_CREW_HEIST_CASH_0", -1)
    local final = tonumber(pm) + tonumber(GetRandomIntInRange(0,3))
    StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(final), true)

    --ferro
    local _, pm = StatGetInt("MPPLY_CREW_HEIST_CASH_1", -1)
    local final = tonumber(pm) + tonumber(GetRandomIntInRange(0,3))
    StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(final), true)
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


function drawLineProps()
    local pedPool = GetGamePool("CObject")
    local coords = GetEntityCoords(PlayerPedId())
    local closestPed = -1
    local closestDist = -1
    for _, ped in pairs(pedPool) do
        

        local Lixeira = false
        local ATM = false

        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_02a')) then
            Lixeira = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_3a')) then
            Lixeira = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_4a')) then
            Lixeira = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_4b')) then
            Lixeira = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_dumpster_01a')) then
            Lixeira = true
        end
        if (GetEntityModel(ped) == GetHashKey('prop_atm_01')) then
            ATM = true
        end

        if Lixeira == true then
            if GetEntityAlpha(ped) == 255 then
                local myCor = GetEntityCoords(PlayerPedId())
                local pedCor = GetOffsetFromEntityInWorldCoords(ped, 0.0, -1.0, 1.0)
               
               -- DrawLine(myCor.x, myCor.y, myCor.z, pedCor.x, pedCor.y, pedCor.z, 0, 255, 0, 255)

                DrawMarker(2, pedCor.x, pedCor.y, pedCor.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0,
                    200, false, true, 2, nil, nil, false)

                if IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 10.0, 10.0, 10.0, 0, 1, 0) then

                    DrawText3D('Se aproxime para coletar', pedCor.x, pedCor.y, pedCor.z)

                    if IsPedOnFoot(PlayerPedId()) and
                        IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 1.0, 1.0, 1.0, 0, 1, 0) then
                        
                        SetEntityAlpha(ped, 254, false)
                        alerta('Recursos Coletados')
                        addLootAleatorio()
                    end
                end

            end

        end


        
        if ATM == true then
            if GetEntityAlpha(ped) == 255 then
                local myCor = GetEntityCoords(PlayerPedId())
                local pedCor = GetOffsetFromEntityInWorldCoords(ped, 0.0, -0.5, 1.5)
                
                --DrawLine(myCor.x, myCor.y, myCor.z, pedCor.x, pedCor.y, pedCor.z, 0, 255, 0, 255)

                DrawMarker(2, pedCor.x, pedCor.y, pedCor.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0,
                    180, false, true, 2, nil, nil, false)

                if IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 10.0, 10.0, 10.0, 0, 1, 0) then

                    DrawText3D('Se aproxime para roubar', pedCor.x, pedCor.y, pedCor.z)

                    if IsPedOnFoot(PlayerPedId()) and
                        IsEntityAtCoord(PlayerPedId(), pedCor.x, pedCor.y, pedCor.z, 1.0, 1.0, 1.0, 0, 1, 0) then
                        
                        
                        SetEntityAlpha(ped, 254, false)
                        
                        alerta('Dinheiro Coletados')

                        local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
                        local final = tonumber(pm) + tonumber(GetRandomIntInRange(1,50))
                        StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
                    end
                end

            end

        end
    end
end


CreateThread(function()
    while true do
        Wait(5)
        drawLineProps()
    end
end)