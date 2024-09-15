
TriggerServerEvent('spawnarPed')

RegisterNetEvent('aplicarScenarioPed')

AddEventHandler('aplicarScenarioPed', function(e,scenario)  
    while not NetworkDoesEntityExistWithNetworkId(tonumber(e)) do
        Citizen.Wait(100)  
    end
    local ped = NetworkGetEntityFromNetworkId(tonumber(e))
    if DoesEntityExist(ped) then
        TaskStartScenarioInPlace(ped,scenario,0,0)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)  
        --print('Id recebido: '..e)
        --print('scenario recebido: '..scenario)
    end
 
end)
