local spawnPos = vector3(273.4642, -1116.2220, 88.8147)



function pode_Transformar(ped)
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

    --medica
    if (GetEntityModel(ped) == GetHashKey('mp_f_meth_01')) then--a_m_y_epsilon_01
        bateu = false
    end

    --vendedor meth
    if (GetEntityModel(ped) == GetHashKey('mp_m_exarmy_01')) then
        bateu = false
    end

    --vendedor weed
    if (GetEntityModel(ped) == GetHashKey('csb_jackhowitzer')) then
        bateu = false
    end


    --asssogueiro   csb_chef    csb_chef2
   
    
    return bateu
end

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_m_trampbeac_01' -- 'a_m_m_trampbeac_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = {'Bem Vindo'}
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()

end)



--ao morrer
local spawnPosMorrer = {
    vector3(49.0876, -373.3907, 64.8009),
    vector3(47.9125, -376.2928, 64.8009),
    vector3(47.1110, -379.0600, 64.8009)
}
AddEventHandler('playerSpawned', function()
    local sc = spawnPosMorrer[math.random(1,#spawnPosMorrer)]
    SetEntityCoords(PlayerPedId(),sc.x,sc.y,sc.z,false,false,false,true)
    SetEntityHeading(PlayerPedId(),244.0)
end)



-- icone da base
AddTextEntry('MYBLIP', 'Base')
local base = AddBlipForCoord(273.4642, -1116.2220, 88.8147)
BeginTextCommandSetBlipName('MYBLIP')
SetBlipSprite(base, 176)
AddTextComponentSubstringPlayerName('me')
EndTextCommandSetBlipName(base)

local Shooting = false
local Running = false

local SafeZones = {{
    x = 273.4642,
    y = -1116.2220,
    z = 88.8147,
    radius = 80.0
} -- base
}

ApplyPedDamagePack(PlayerPedId(), 'Fall', 0.0, 1.0)

DecorRegister('RegisterZombie', 2)
AddRelationshipGroup('ZOMBIE')
SetRelationshipBetweenGroups(0, GetHashKey('ZOMBIE'), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), GetHashKey('ZOMBIE'))

function IsPlayerShooting()
    return Shooting
end

function IsPlayerRunning()
    return Running
end


RequestNamedPtfxAsset("scr_michael2")

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)

        -- Peds
        SetPedDensityMultiplierThisFrame(1.0)
        SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)

        -- Vehicles
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetVehicleDensityMultiplierThisFrame(0.0)

        SetMaxWantedLevel(0)

        DisableIdleCamera(true)
		

    end
end)

function tem_objeto_proximo(nome_prop,radius)

    local boleta = false
    local propPool = GetGamePool("CObject")
    for _, prop in pairs(propPool) do

        if (GetEntityModel(prop) == GetHashKey(nome_prop)) then

            local cord = GetOffsetFromEntityInWorldCoords(prop,0.0,0.0,0.0)

            if IsEntityAtCoord(PlayerPedId(), cord.x, cord.y,cord.z, radius, radius, radius, 0, 1, 0) then
                boleta = true;
            end

        end
        
    end
    return boleta
    
end

Citizen.CreateThread(function() -- Will only work in it's own while loop
    while true do
        Citizen.Wait(0)

        if IsPedShooting(PlayerPedId()) then
            Shooting = true
            Citizen.Wait(5000)
            Shooting = false
        end

        if IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId()) then
            if Running == false then
                Running = true
            end
        else
            if Running == true then
                Running = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    for _, zone in pairs(SafeZones) do
        local Blip = AddBlipForRadius(zone.x, zone.y, zone.z, zone.radius)
        SetBlipHighDetail(Blip, true)
        SetBlipColour(Blip, 2)
        SetBlipAlpha(Blip, 128)
    end

    while true do
        Citizen.Wait(0)

 
        
        for _, zone in pairs(SafeZones) do
            local Zombie = -1
            local Success = false
            local Handler, Zombie = FindFirstPed()

            repeat
                if GetPedGroupIndex(Zombie) ~= GetPlayerGroup(PlayerPedId()) then
                    if pode_Transformar(Zombie) then
                        if IsPedHuman(Zombie) and not IsPedAPlayer(Zombie) and not IsPedDeadOrDying(Zombie, true) then
                            local pedcoords = GetEntityCoords(Zombie)
                            local zonecoords = vector3(zone.x, zone.y, zone.z)
                            local distance = #(zonecoords - pedcoords)

                            if distance <= zone.radius then
                                SetEntityHealth(Zombie, 0)
                            end
                        end
                    end
                end

                Success, Zombie = FindNextPed(Handler)
            until not (Success)

            EndFindPed(Handler)
        end

        local Zombie = -1
        local Success = false
        local Handler, Zombie = FindFirstPed()

        repeat
            Citizen.Wait(10)

            if GetPedGroupIndex(Zombie) ~= GetPlayerGroup(PlayerPedId()) then
                if IsPedHuman(Zombie) and not IsPedAPlayer(Zombie) and not IsPedDeadOrDying(Zombie, true) then

                    if pode_Transformar(Zombie) then
                        if not DecorExistOn(Zombie, 'RegisterZombie') then

                            ClearPedTasks(Zombie)
                            ClearPedSecondaryTask(Zombie)
                            ClearPedTasksImmediately(Zombie)
                            TaskWanderStandard(Zombie, 10.0, 10)
                            SetPedRelationshipGroupHash(Zombie, 'ZOMBIE')
                            ApplyPedDamagePack(Zombie, 'Fall', 0.0, 1.0) -- BigHitByVehicle
                            SetEntityHealth(Zombie, 200)

                            RequestAnimSet('move_m@drunk@verydrunk')
                            while not HasAnimSetLoaded('move_m@drunk@verydrunk') do
                                Citizen.Wait(0)
                            end
                            SetPedMovementClipset(Zombie, 'move_m@drunk@verydrunk', 1.0)

                            SetPedConfigFlag(Zombie, 100, false)
                            DecorSetBool(Zombie, 'RegisterZombie', true)
                            SetPedAsEnemy(Zombie, true)
                        end

                        SetPedRagdollBlockingFlags(Zombie, 1)
                        SetPedCanRagdollFromPlayerImpact(Zombie, false)
                        SetPedSuffersCriticalHits(Zombie, true)
                        SetPedEnableWeaponBlocking(Zombie, true)
                        -- DisablePedPainAudio(Zombie, true)
                        -- StopPedSpeaking(Zombie, true)
                        SetPedDiesWhenInjured(Zombie, false)
                        StopPedRingtone(Zombie)
                        SetPedMute(Zombie)
                        SetPedIsDrunk(Zombie, true)
                        SetPedConfigFlag(Zombie, 166, false)
                        SetPedConfigFlag(Zombie, 170, false)
                        SetBlockingOfNonTemporaryEvents(Zombie, true)
                        SetPedCanEvasiveDive(Zombie, false)
                        RemoveAllPedWeapons(Zombie, true)
                        SetPedMoney(Zombie, 150)

                        local PlayerCoords = GetEntityCoords(PlayerPedId())
                        local PedCoords = GetEntityCoords(Zombie)
                        local Distance = #(PedCoords - PlayerCoords)
                        local DistanceTarget

                        if IsPlayerShooting() then
                            DistanceTarget = 120.0
                        elseif IsPlayerRunning() then
                            DistanceTarget = 50.0
                        else
                            DistanceTarget = 20.0
                        end




                        if not tem_objeto_proximo('prop_beach_fire',20.0) then
                            if Distance <= DistanceTarget and not IsPedInAnyVehicle(PlayerPedId(), false) then
                                TaskGoToEntity(Zombie, PlayerPedId(), -1, 0.0, 2.0, 1073741824, 0)
                            end
                        end

                        if Distance <= 1.3 then
                            if not IsPedRagdoll(Zombie) and not IsPedGettingUp(Zombie) then
                                local health = GetEntityHealth(PlayerPedId())
                                if health == 0 then
                                    ClearPedTasks(Zombie)
                                    TaskWanderStandard(Zombie, 10.0, 10)
                                else

                                    RequestAnimSet('melee@unarmed@streamed_core_fps')
                                    while not HasAnimSetLoaded('melee@unarmed@streamed_core_fps') do
                                        Citizen.Wait(10)
                                    end

                                    TaskPlayAnim(Zombie, 'melee@unarmed@streamed_core_fps', 'ground_attack_0_psycho',
                                        8.0, 1.0, -1, 48, 0.001, false, false, false)

                                    ApplyDamageToPed(PlayerPedId(), 5, false)
                                    PlayPain(Zombie, 8, 0.0, false)
                                    -- TaskCombatPed(Zombie,PlayerPedId(),0,16)
                                    SetPedAsEnemy(Zombie, true)



                                    --particula
                                    local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,0.0,0.0)
	
                                    UseParticleFxAsset("scr_michael2")
                                        StartParticleFxNonLoopedAtCoord("scr_mich2_blood_stab", 
                                        c.x, 
                                        c.y,
                                        c.z, 
                                        0.0, 0.0, 0.0, 0.3, 0, 0, 0)

                                                      
                                        UseParticleFxAsset("scr_michael2")
                                        StartParticleFxNonLoopedAtCoord("scr_abattoir_ped_sliced", 
                                        c.x, 
                                        c.y,
                                        c.z, 
                                        0.0, 0.0, 0.0, 0.3, 0, 0, 0)




                                end
                            end

                        end

                        if not NetworkGetEntityIsNetworked(Zombie) then
                            SetEntityHealth(Zombie, 0)
                        end
                    end
                end
            end
            Success, Zombie = FindNextPed(Handler)
        until not (Success)

        EndFindPed(Handler)
    end
end)
