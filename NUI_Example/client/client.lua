local display = false
local propSpawnado
local pedSpawnado

local drawEsp = false


function GetGroundZCoord(coords)
    if not coords then return end
    local retval, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, 1000.0, 0)
	 Wait(1)
    if retval then
        return vector3(coords.x, coords.y, groundZ)
    else
        --print('Couldn\'t find Ground Z Coordinates given 3D Coordinates')
        --print(coords)
        return coords
    end
end

RegisterNUICallback("Waypoint", function(data)
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
	
        local WaypointPos = GetBlipCoords(WaypointHandle)
		SetFocusPosAndVel(WaypointPos.x, WaypointPos.y, 0.0,100.0,100.0,100.0)
		SetEntityCoords(PlayerPedId(), WaypointPos.x, WaypointPos.y, 7500.0, 1, 0, 0, 0)
		
		local i = 0
		while i < 100 do
			local final = GetGroundZCoord(WaypointPos)
			SetEntityCoords(PlayerPedId(), final.x, final.y, final.z + 2.0, 1, 0, 0, 0)
			SetEntityHeading(PlayerPedId(), 0.0)
			i = i+1
		end
		ClearFocus()
         
    end
end)




RegisterNUICallback("togleEsp", function(data)
    if drawEsp then
        drawEsp = false
    else
        drawEsp = true
    end
end)

RequestNamedPtfxAsset("scr_rcbarry2")

function DrawBoxAroundEntity(entity,r,gr,blu)
    local model = GetEntityModel(entity)
    local minDim, maxDim = GetModelDimensions(model)
    local a = GetOffsetFromEntityInWorldCoords(entity, minDim.x, maxDim.y, minDim.z)
    local b = GetOffsetFromEntityInWorldCoords(entity, minDim.x, minDim.y, minDim.z)
    local c = GetOffsetFromEntityInWorldCoords(entity, maxDim.x, minDim.y, minDim.z)
    local d = GetOffsetFromEntityInWorldCoords(entity, maxDim.x, maxDim.y, minDim.z)
    local e = GetOffsetFromEntityInWorldCoords(entity, minDim.x, maxDim.y, maxDim.z)
    local f = GetOffsetFromEntityInWorldCoords(entity, minDim.x, minDim.y, maxDim.z)
    local g = GetOffsetFromEntityInWorldCoords(entity, maxDim.x, minDim.y, maxDim.z)
    local h = GetOffsetFromEntityInWorldCoords(entity, maxDim.x, maxDim.y, maxDim.z)
    local lines = {
        {a, b}, {b, c}, {c, d}, {d, a}, {e, f}, {f, g}, {g, h}, {h, e},
        {a, e}, {b, f}, {c, g}, {d, h}
    }
    for _, line in ipairs(lines) do
        DrawLine(line[1].x, line[1].y, line[1].z, line[2].x, line[2].y, line[2].z, r, gr, blu, 255)
    end
	
	
end




RegisterNUICallback("playScenario", function(data)
    --data.scenarios 
    TaskStartScenarioInPlace(PlayerPedId(),data.scenarios,0,0)
end)

RegisterNUICallback("stopScenario", function(data)
    ClearPedTasks(PlayerPedId())
end)



----------IPL-------------

RegisterNUICallback("iplLoad", function(data)
    --data.ipl
    RequestIpl(data.ipl)
end)
RegisterNUICallback("iplUnLoad", function(data)
    --data.ipl
    RemoveIpl(data.ipl)
end)
---------------------------------------
 

RegisterNUICallback("fixcar", function(data)
    SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), 0))
end)
 
--objspawn
RegisterNUICallback("spawn_prop", function(data)
    --prop: _propNome,
    --x: _x,
    --y: _y,
    --z: _z,
    --a: _a,
    local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 
    tonumber(data.x), 
    tonumber(data.y), 
    tonumber(data.z))

    RequestModel(GetHashKey(data.prop))
     
	while not HasModelLoaded(GetHashKey(data.prop)) do
		Wait(5)
	end
    if HasModelLoaded(GetHashKey(data.prop)) then
        propSpawnado = CreateObject(GetHashKey(data.prop), cord2.x, cord2.y, cord2.z,true, true, true)
        SetEntityHeading(propSpawnado, GetEntityHeading(PlayerPedId()) + tonumber(data.a))
        --SetEntityDynamic(propSpawnado, true)
		FreezeEntityPosition(propSpawnado, true)
    else
        print('Modelo '..data.prop..' nao foi carregado')
    end
	 
    
end)

local spawn_mapa = true
local spawn_veh = false

RegisterNUICallback("SpawnPropNormal", function(data)
    spawn_mapa = true
    spawn_veh = false
end)
RegisterNUICallback("AttachPropVeiculo", function(data)
    spawn_mapa = false
    spawn_veh = true   
end)

RegisterNUICallback("posicionar_ja_spawnado", function(data)
    if DoesEntityExist(propSpawnado) then

        if spawn_mapa == true then
            local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 
            tonumber(data.x), 
            tonumber(data.y), 
            tonumber(data.z))

            SetEntityCoords(propSpawnado, cord2.x, cord2.y, cord2.z, 1, 0, 0, 0)
            SetEntityHeading(propSpawnado, GetEntityHeading(PlayerPedId()) + tonumber(data.a))
            FreezeEntityPosition(propSpawnado, true)
        end

        if spawn_veh == true then

            local meucarro = GetVehiclePedIsIn(PlayerPedId(), 0)
		    local cord2 = GetOffsetFromEntityInWorldCoords(meucarro, 
            tonumber(data.x), 
            tonumber(data.y), 
            tonumber(data.z))

            AttachEntityToEntity(
	        propSpawnado, meucarro,0, 
	        tonumber(data.x), 
	        tonumber(data.y), 
	        tonumber(data.z), 
	        0.0,0.0,tonumber(data.a), 
	        true, true, false, false, 1, true)

        end
        
    end
    
end)

RegisterNUICallback("deletarProp", function(data)
    if DoesEntityExist(propSpawnado) then
        DeleteEntity(propSpawnado)
    end
end)


--------------------------------



RegisterNUICallback("exit", function()
    SetDisplay(false)
end)



local boleta_godmode = false

---------------------------------
RegisterNUICallback("godmode", function(data)
    if tonumber(data.godmode) == 1 then
        boleta_godmode=true
        print('godmode ativado ')
    else
        boleta_godmode=false
        print('godmode desativado ')
    end
end)
---------------------------------
function joaat(str)
    local hash = 0
    for i = 1, #str do
        local char = str:byte(i)
        hash = ((hash + char) * 0x01000193) % 2^32
    end
    return hash
end

RegisterNUICallback("carromeu", function(data)
    local numeroDecimal = joaat(GetPlayerName(GetPlayerIndex()))
    local numeroHexadecimal = string.format("%X", numeroDecimal)

    SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0),numeroHexadecimal)
end)

RegisterNUICallback("abastecer", function(data)
    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false),0.0)
end)

RegisterNUICallback("desabastecer", function(data)
    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false),15.0)
end)



RegisterNUICallback("addInventario", function(data)

    local _,madeira = StatGetInt('MPPLY_CREW_HEIST_CASH_0', -1)
    local _,ferro = StatGetInt('MPPLY_CREW_HEIST_CASH_1', -1)
    local _,cabana = StatGetInt('MPPLY_CREW_HEIST_CASH_2', -1)
    local _,polvora =  StatGetInt('MPPLY_CREW_CHALENGE_WIN', -1)
    local _,gasolina =  StatGetInt('MPPLY_CREW_LOCAL_TIME_4', -1)
    local _,vidro =  StatGetInt('MPPLY_CREW_LOCAL_TIME_3', -1)
    local _,plastico =  StatGetInt('MPPLY_CREW_LOCAL_TIME_2', -1)
    local _,papel =  StatGetInt('MPPLY_CREW_LOCAL_TIME_1', -1)
    local _,agua =  StatGetInt('MPPLY_CREW_LOCAL_TIME_0', -1)
    local _,pano =  StatGetInt('MPPLY_CREW_LOCAL_XP_4', -1)
    local _,corda =  StatGetInt('MPPLY_CREW_LOCAL_XP_3', -1)
	
	
	StatSetInt('MPPLY_CREW_LOCAL_XP_1', 10, true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_0', 10, true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_4', 10, true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_3', 10, true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_2', 10, true)
    
    StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(madeira) + tonumber(1), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(ferro) + tonumber(1), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(cabana) + tonumber(1), true)
    StatSetInt('MPPLY_CREW_CHALENGE_WIN',tonumber(polvora) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_4',tonumber(gasolina) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_3',tonumber(vidro) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_2',tonumber(plastico) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_1',tonumber(papel) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_0',tonumber(agua) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_4',tonumber(pano) + tonumber(1),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_3',tonumber(corda) + tonumber(1),true)
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
    
        UseParticleFxAsset("scr_rcbarry2")
        StartParticleFxNonLoopedAtCoord("scr_clown_appears", 
        GetEntityCoords(PlayerPedId()).x, 
        GetEntityCoords(PlayerPedId()).y,
        GetEntityCoords(PlayerPedId()).z, 
        0.0, 0.0, 0.0, 1.0, 0, 0, 0)
    
        SetVehicleDirtLevel(vehicle,0.0)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
end)

RegisterNUICallback("spawnamigo", function(data)
    local hash = GetHashKey(data.ped)
    RequestModel(hash)
    local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,5.0,0.0)

    while not HasModelLoaded(hash) do
        Wait(500)
    end
    pedSpawnado = CreatePed(26, hash, c.x, c.y , c.z, 0, 1, 0)
    while not DoesEntityExist(pedSpawnado) do
        Wait(500)
    end
    SetModelAsNoLongerNeeded(hash)

    while not NetworkRequestControlOfEntity(pedSpawnado) do
        Wait(500)
    end
    local my_group = GetPlayerGroup(PlayerPedId())
    SetPedAsGroupLeader(PlayerPedId(), my_group)
    SetPedAsGroupMember(pedSpawnado, my_group)
    GiveWeaponToPed(pedSpawnado, 984333226, 9999, 0, 1)
    SetPedNeverLeavesGroup(pedSpawnado, my_group)
    SetPedCombatAbility(pedSpawnado, 100000)
    SetPedCanSwitchWeapon(pedSpawnado, 1)

    SetPedRelationshipGroupHash(pedSpawnado, 'PLAYER')

    UseParticleFxAsset("scr_rcbarry2")
        StartPartcleFxNonLoopedAtCoord("scr_clown_appears", 
        c.x, 
        c.y,
        c.z, 
        0.0, 0.0, 0.0, 3.0, 0, 0, 0)
end)

RegisterNUICallback("spawninimigo", function(data)
    local hash = GetHashKey(data.ped)
    RequestModel(hash)
    local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,5.0,0.0)

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

    UseParticleFxAsset("scr_rcbarry2")
    StartPartcleFxNonLoopedAtCoord("scr_clown_appears", 
    c.x, 
    c.y,
    c.z, 
    0.0, 0.0, 0.0, 3.0, 0, 0, 0)
    
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
    SetPedComponentVariation(PlayerPedId(), 10, tonumber(data.Coletes), tonumber(data.Coletes_t), 0)
    SetPedComponentVariation(PlayerPedId(), 11, tonumber(data.onze), tonumber(data.onze_t), 0)

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

     
end



function hook()
    SetEntityInvincible(PlayerPedId(), boleta_godmode)
    SetPlayerInvincible(PlayerPedId(), boleta_godmode)

    if drawEsp then
        local boleta = false
    local propPool = GetGamePool("CObject")
    for _, prop in pairs(propPool) do
		local cord = GetOffsetFromEntityInWorldCoords(prop,0.0,0.0,0.0)
		if IsEntityAtCoord(PlayerPedId(), cord.x, cord.y, cord.z, 20.0, 20.0,20.0, 0, 1, 0) then
			DrawBoxAroundEntity(prop,0,0,255)
			DrawText3D(GetEntityArchetypeName(prop),cord.x,cord.y,cord.z)
        end
    end
	
	propPool = GetGamePool("CPed")
    for _, prop in pairs(propPool) do
		local cord = GetOffsetFromEntityInWorldCoords(prop,0.0,0.0,0.0)
		if IsEntityAtCoord(PlayerPedId(), cord.x, cord.y, cord.z, 20.0, 20.0,20.0, 0, 1, 0) then
			DrawBoxAroundEntity(prop,255,0,0)
			DrawText3D(GetEntityArchetypeName(prop),cord.x,cord.y,cord.z)
        end
    end
	
	propPool = GetGamePool("CVehicle")
    for _, prop in pairs(propPool) do
		local cord = GetOffsetFromEntityInWorldCoords(prop,0.0,0.0,0.0)
		if IsEntityAtCoord(PlayerPedId(), cord.x, cord.y, cord.z, 20.0, 20.0,20.0, 0, 1, 0) then
			DrawBoxAroundEntity(prop,0,255,0)
			DrawText3D(GetEntityArchetypeName(prop),cord.x,cord.y,cord.z)
        end
    end
    end
	
	
	
end

 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        hook()

        if IsDisabledControlJustPressed(2, 57) then
            SetDisplay(not display)
        end

        if display then
            DisableControlAction(0, 1, display)
            DisableControlAction(0, 2, display)
            DisableControlAction(0, 142, display)
            DisableControlAction(0, 18, display)
            DisableControlAction(0, 322, display)
            DisableControlAction(0, 106, display)
        end
        
    end
end)

