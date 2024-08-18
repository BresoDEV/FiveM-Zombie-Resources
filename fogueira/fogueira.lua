
local distancia_da_fogueira = 15.0

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)

        local propPool = GetGamePool("CObject")
        for _, prop in pairs(propPool) do
            
            if (GetEntityModel(prop) == GetHashKey('prop_beach_fire')) then
                
                local coords = GetEntityCoords(prop)
                if IsEntityAtCoord(PlayerPedId(), coords.x, coords.y, coords.z, distancia_da_fogueira, distancia_da_fogueira,distancia_da_fogueira, 0, 1, 0) then

                    local pedPool = GetGamePool("CPed") 
                    for _, ped in pairs(pedPool) do

                        if GetPedGroupIndex(ped) ~= GetPlayerGroup(PlayerPedId()) then

                            if IsPedHuman(ped) and not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped, true) then

                                local bateu = true
                                
                                if (GetEntityModel(ped) == GetHashKey('csb_ramp_marine')) then
                                    bateu = false     
                                end
                                if (GetEntityModel(ped) == GetHashKey('mp_m_exarmy_01')) then
                                    bateu = false     
                                end
                                if (GetEntityModel(ped) == GetHashKey('g_m_m_chemwork_01')) then
                                    bateu = false     
                                end

                                if bateu then
                                    --SetEntityHealth(ped,0)
                                    StartEntityFire(ped)
                                end


                            end

                        end

                    end

                end
                    
            end

        end

    end
end)



