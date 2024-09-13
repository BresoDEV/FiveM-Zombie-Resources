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

local meuID = PlayerPedId()

RegisterCommand("portao", function(source, args)
    local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, 0.5, -1.0)

    RequestModel(GetHashKey('prop_fnclink_03gate4'))

    while not HasModelLoaded(GetHashKey('prop_fnclink_03gate4')) do
        Wait(5)
    end
    if HasModelLoaded(GetHashKey('prop_fnclink_03gate4')) then
        local propSpawnado = CreateObject(GetHashKey('prop_fnclink_03gate4'), cord2.x, cord2.y, cord2.z, true, true,
            true)
        SetEntityHeading(propSpawnado, GetEntityHeading(PlayerPedId()))
        -- SetEntityDynamic(propSpawnado, true)
        FreezeEntityPosition(propSpawnado, true)
        SetEntityMaxHealth(propSpawnado,meuID)
    else
        print('Modelo ' .. data.prop .. ' nao foi carregado')
    end
    print('meuID: '..meuID)
end)

local grade = false

CreateThread(function()
    while true do
        Wait(5)

        local objPool = GetGamePool("CObject")
        for _, propSpawnado in pairs(objPool) do

            if (GetEntityModel(propSpawnado) == GetHashKey('prop_fnclink_03gate4')) and GetEntityMaxHealth(propSpawnado) == meuID then
                grade = true
            end

            if grade then

                local cord2 = GetOffsetFromEntityInWorldCoords(propSpawnado, 0.0, 0.0, 0.0)
                if IsEntityAtCoord(PlayerPedId(), cord2.x, cord2.y, cord2.z, 10.0, 10.0, 10.0, 0, 1, 0) then

                    DrawText3D('Aperte [E] para abrir e fechar', cord2.x, cord2.y, cord2.z)

                    if IsControlJustPressed(0, 38) then

                        
                        local anguloFinalmin = math.floor(GetEntityHeading(propSpawnado) + 180.0)
                        if anguloFinalmin > 360 then
                            anguloFinalmin = anguloFinalmin - 360
                        end
                        local abrindo = true

                        print('GetEntityMaxHealth: '..GetEntityMaxHealth(propSpawnado))
                        while abrindo do

                            SetEntityCollision(propSpawnado, false, false)
                            Wait(1)
                            if math.floor(GetEntityHeading(propSpawnado)) == anguloFinalmin then
                                abrindo = false
                                grade = false

                                SetEntityCollision(propSpawnado, true, true)
                            else
                                SetEntityHeading(propSpawnado, GetEntityHeading(propSpawnado) + 1.0)
                            end
                        end

                    end

                end

            end
        end
        grade = false
    end
end)

