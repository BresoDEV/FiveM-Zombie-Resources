local itens = {
{
    ped = "csb_ramp_marine",
    X = 267.8185,
    Y = -1112.8239,
    Z = 87.8147,
    Angulo = 269.1361,
    Scenario = "WORLD_HUMAN_CLIPBOARD"
}, {
    ped = "mp_m_exarmy_01",
    X = 275.7228,
    Y = -1112.8824,
    Z = 87.8147,
    Angulo = 91.8613,
    Scenario = "WORLD_HUMAN_DRINKING"
}, {
    ped = "csb_ramp_marine",
    X = 285.1465,
    Y = -1112.6266,
    Z = 82.0100,
    Angulo = 48.7976,
    Scenario = "WORLD_HUMAN_SMOKING"
}, {
    ped = "g_m_m_chemwork_01",
    X = 285.2354,
    Y = -1109.0088,
    Z = 82.0100,
    Angulo = 99.4301,
    Scenario = "WORLD_HUMAN_STAND_MOBILE"
}
}

function SpawnPed(pedsss, x, y, z, a, scenario)
    --local hash = GetHashKey(pedsss)
    --RequestModel(hash)
    --while not HasModelLoaded(hash) do
    --    Wait(500)
    --end
    --local Ped = CreatePed(26, hash, x, y, z, 0, 1, 0)
    --while not DoesEntityExist(Ped) do
    --    Wait(500)
    --end
    --SetEntityHeading(Ped, a)
    --FreezeEntityPosition(Ped, true)
    --SetEntityInvincible(Ped, true)
    --SetBlockingOfNonTemporaryEvents(Ped, true)
    --SetModelAsNoLongerNeeded(hash)
	
	local hash = GetHashKey(pedsss)
    RequestModel(hash)
    

    while not HasModelLoaded(hash) do
        Wait(500)
    end
    local Ped = CreatePed(26, hash, x, y , z, 0, 1, 0)
    while not DoesEntityExist(Ped) do
        Wait(500)
    end
    SetModelAsNoLongerNeeded(hash)

    while not NetworkRequestControlOfEntity(Ped) do
        Wait(500)
    end
    
SetEntityHeading(Ped, a)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetModelAsNoLongerNeeded(hash)
    SetPedRelationshipGroupHash(Ped, 'PLAYER')
	
	--local my_group = GetPlayerGroup(PlayerPedId())
    --SetPedAsGroupLeader(PlayerPedId(), my_group)
    --SetPedAsGroupMember(Ped, my_group)
    --GiveWeaponToPed(Ped, 453432689, 9999, 0, 1)
    --SetPedNeverLeavesGroup(Ped, my_group)
    --SetPedCombatAbility(Ped, 100000)
    --SetPedCanSwitchWeapon(Ped, 1)
	
	 
	TaskStartScenarioInPlace(Ped,scenario,0,0)

end

for _, elementos in pairs(itens) do

    print(elementos.ped, elementos.X, elementos.Y, elementos.Z, elementos.Angulo, elementos.Scenario)
    SpawnPed(elementos.ped, elementos.X, elementos.Y, elementos.Z, elementos.Angulo, elementos.Scenario)

end

