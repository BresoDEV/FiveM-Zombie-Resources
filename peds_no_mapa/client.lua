

RegisterNetEvent('aplicarScenarioPed')

AddEventHandler('aplicarScenarioPed', function(e, scenario)
    while not NetworkDoesEntityExistWithNetworkId(tonumber(e)) do
        Citizen.Wait(100)
    end
    local ped = NetworkGetEntityFromNetworkId(tonumber(e))
    if DoesEntityExist(ped) then
        TaskStartScenarioInPlace(ped, scenario, 0, 0)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        -- print('Id recebido: '..e)
        -- print('scenario recebido: '..scenario)
    end

end)

local boleta = true

Citizen.CreateThread(function()
    while boleta do
        Citizen.Wait(5)
        print('rodando')

        if IsEntityOnScreen(PlayerPedId()) then

            if IsPedWalking(PlayerPedId()) then

                --if IsPlayerPlaying(PlayerPedId()) then
                    print('trigando')
                    TriggerServerEvent('spawnarPed')
                    print('trigado')
                    boleta = false
                --end
            end
        end

    end
end)

