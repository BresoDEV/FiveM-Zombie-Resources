local display = false

RegisterCommand("dev", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
end)

RegisterNUICallback("modelchange", function(data)
    -- data.ped
    local model = GetHashKey(data.ped)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetPedDefaultComponentVariation(PlayerPedId())
    Citizen.Wait(10)
    SetModelAsNoLongerNeeded(model)
    Citizen.Wait(10)
end)

RegisterNUICallback("adddinheiro", function(data)
    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
    local final = tonumber(pm) + tonumber(data.valor)
    StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
    -- data.valor
end)

RegisterNUICallback("corCarro", function(data)
    SetVehicleCustomPrimaryColour(GetVehiclePedIsIn(PlayerPedId(), 0), data.r, data.g, data.b)
end)

RegisterNUICallback("corCarro2", function(data)
    SetVehicleCustomSecondaryColour(GetVehiclePedIsIn(PlayerPedId(), 0), data.r, data.g, data.b)
end)

RegisterNUICallback("horario", function(data)
    NetworkOverrideClockTime(tonumber(data.hora), 30, 00)
end)
RegisterNUICallback("sempolicia", function(data)
    ClearPlayerWantedLevel(PlayerPedId())
    SetMaxWantedLevel(0)
    SetPlayerWantedLevel(PlayerId(), 0, false)
end)

RegisterNUICallback("carspawn", function(data)
    print(data.carro)
    local vehicleName = data.carro
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        return
    end
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end
    local vehicle = CreateVehicle(vehicleName, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y,
        GetEntityCoords(PlayerPedId()).z, GetEntityHeading(PlayerPedId()), true, true)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
end)

RegisterNUICallback("spawnamigo", function(data)
    local hash = GetHashKey(data.ped)
    RequestModel(hash)
    local c = GetEntityCoords(PlayerPedId(), 1)

    while not HasModelLoaded(hash) do
        Wait(500)
    end
    local Ped = CreatePed(26, hash, c.x, c.y - 10, c.z, 0, 1, 0)
    while not DoesEntityExist(Ped) do
        Wait(500)
    end
    SetModelAsNoLongerNeeded(hash)

    while not NetworkRequestControlOfEntity(Ped) do
        Wait(500)
    end
    local my_group = GetPlayerGroup(PlayerPedId())
    SetPedAsGroupLeader(PlayerPedId(), my_group)
    SetPedAsGroupMember(Ped, my_group)
    SetPedNeverLeavesGroup(Ped, my_group)
    SetPedCombatAbility(Ped, 100000)
    SetPedCanSwitchWeapon(Ped, 1)
end)

RegisterNUICallback("spawninimigo", function(data)
    local hash = GetHashKey(data.ped)
    RequestModel(hash)
    local c = GetEntityCoords(PlayerPedId(), 1)

    while not HasModelLoaded(hash) do
        Wait(500)
    end
    local Ped = CreatePed(21, hash, c.x, c.y - 10, c.z, 0, 1, 0)
    while not DoesEntityExist(Ped) do
        Wait(500)
    end
    SetModelAsNoLongerNeeded(hash)

    while not NetworkRequestControlOfEntity(Ped) do
        Wait(500)
    end
    -- GiveWeaponPed(Ped, 0x6D544C99)
    TaskCombatPed(Ped, PlayerPedId(), 0, 16)
    SetPedCanSwitchWeapon(Ped, 1)
end)

RegisterNUICallback("Clima", function(data)
    SetWeatherTypeNowPersist(data.Clima)
end)

RegisterNUICallback("tunagem", function(data)
    local carro = veh or GetVehiclePedIsIn(PlayerPedId(), 0)
    SetVehicleModKit(carro, 0)
    for i = 0, 50 do
        SetVehicleMod(carro, i, GetNumVehicleMods(carro, i) - 1, false)
    end
    SetVehicleNumberPlateText(carro, "bresodev")
end)

RegisterNUICallback("Teleport", function(data)
    local i = PlayerPedId()
    if IsPedInAnyVehicle(PlayerPedId(), 0) then
        i = GetVehiclePedIsIn(PlayerPedId(), 0)
    end
    SetEntityCoords(i, tonumber(data.x), tonumber(data.y), tonumber(data.z), 1, 0, 0, 0)
    SetEntityHeading(i, tonumber(data.a))

end)

RegisterNUICallback("dararmas", function(data)
    GiveWeaponToPed(PlayerPedId(), 1432025498, 9999, 0, 1)
    GiveWeaponToPed(PlayerPedId(), 984333226, 9999, 0, 1)
    GiveWeaponToPed(PlayerPedId(), 961495388, 9999, 0, 1)
    GiveWeaponToPed(PlayerPedId(), 100416529, 9999, 0, 1) -- sniperrifle
    GiveWeaponToPed(PlayerPedId(), 1834241177, 9999, 0, 1) -- rail
    GiveWeaponToPed(PlayerPedId(), 1119849093, 9999, 0, 1) -- minigun
    GiveWeaponToPed(PlayerPedId(), 615608432, 9999, 0, 1) -- molotov
    GiveWeaponToPed(PlayerPedId(), 1233104067, 1, 0, 1) -- flare
    GiveWeaponToPed(PlayerPedId(), 883325847, 1, 0, 1) -- galao
    GiveWeaponToPed(PlayerPedId(), 2067956739, 1, 0, 1) -- pe de cabra
    GiveWeaponToPed(PlayerPedId(), -1951375401, 1, 0, 1) -- lanterna
    GiveWeaponToPed(PlayerPedId(), -102973651, 1, 0, 1) -- machado
    GiveWeaponToPed(PlayerPedId(), 453432689, 9999, 0, 1) -- pistola

end)

RegisterNUICallback("addzumbimorto", function(data)
    local _, pm = StatGetInt("MP0_KILLS", -1)
    local final = tonumber(pm) + 1
    StatSetInt('MP0_KILLS', tonumber(final), true)
end)

RegisterNUICallback("trajes", function(data)

   
    SetPedComponentVariation(PlayerPedId(), 0, tonumber(data.Cabeca), tonumber(data.Cabeca_t), 0)
    SetPedComponentVariation(PlayerPedId(), 1, tonumber(data.Mascara), tonumber(data.Mascara_t), 1)
    SetPedComponentVariation(PlayerPedId(), 2, tonumber(data.Cabelo), tonumber(data.Cabelo_t), 0)
    SetPedComponentVariation(PlayerPedId(), 3, tonumber(data.Torso), tonumber(data.Torso_t), 0)
    SetPedComponentVariation(PlayerPedId(), 4, tonumber(data.Pernas), tonumber(data.Pernas_t), 0)
    SetPedComponentVariation(PlayerPedId(), 5, tonumber(data.Misc), tonumber(data.Misc_t), 0)
    SetPedComponentVariation(PlayerPedId(), 6, tonumber(data.Sapatos), tonumber(data.Sapatos_t), 0)
    SetPedComponentVariation(PlayerPedId(), 7, tonumber(data.Misc2),tonumber(data.Misc2_t), 0)
    SetPedComponentVariation(PlayerPedId(), 8, tonumber(data.Casacos), tonumber(data.Casacos_t), 0)
    SetPedComponentVariation(PlayerPedId(), 9, tonumber(data.Emblemas), tonumber(data.Emblemas_t), 0)

    SetPedPropIndex(PlayerPedId(), 0,tonumber(data.Chapeus), tonumber(data.Chapeus_t), 1)
    SetPedPropIndex(PlayerPedId(), 1, tonumber(data.Oculos), tonumber(data.Oculos_t), 1)

end)

RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)

    local playerX = GetEntityCoords(PlayerPedId()).x
    local playerY = GetEntityCoords(PlayerPedId()).y
    local playerZ = GetEntityCoords(PlayerPedId()).z
    local playerAngle = GetEntityHeading(PlayerPedId())
    local horarioAtual = GetClockHours()

    SendNUIMessage({
        type = "ui",
        status = bool,
        playerX = GetEntityCoords(PlayerPedId()).x,
        playerY = GetEntityCoords(PlayerPedId()).y,
        playerZ = GetEntityCoords(PlayerPedId()).z,
        playerAngle = GetEntityHeading(PlayerPedId()),
        horarioAtual = GetClockHours()

    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)

