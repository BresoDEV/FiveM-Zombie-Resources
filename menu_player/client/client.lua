----------------
local display = false
local Objeto_spawn
----------------
RegisterCommand("player", function(source, args)
    SetDisplay(not display)
end)




RegisterCommand("msg", function(source, args)
    SendNUIMessage({
        type = "alerta",
        texto = 'Esse foi um teste de alerta verde',
        tempo = 3,
        cor = 'lime'
    })
    Wait(1000)
    SendNUIMessage({
        type = "alerta",
        texto = 'Esse foi um teste de alerta vermelho',
        tempo = 3,
        cor = 'red'
    })
end)

function AlertaNUI(_cor,_msg)
    SendNUIMessage({
        type = "alerta",
        texto = _msg,
        tempo = 3,
        cor = _cor
    })
end


function Retornar_Ao_Inventario(obj)
    local stat = ''

    if obj == 'prop_beach_fire' then
        stat = 'MPPLY_CREW_LOCAL_XP_0'
    end

    if obj == 'prop_gazebo_01' then
        stat = 'MPPLY_CREW_HEIST_CASH_2'
    end

    if obj == 'prop_tool_bench02' then
        stat = 'MPPLY_CREW_NO_HEISTS_3'
    end

    if obj == 'prop_fnclink_02gate5' then
        stat = 'MPPLY_CREW_NO_HEISTS_2'
    end

    if obj == 'prop_worklight_03a' then
        stat = 'MPPLY_CREW_NO_HEISTS_4'
    end

    local _, pm = StatGetInt(stat, -1)
    local final = tonumber(pm) + 1
    StatSetInt(stat, tonumber(final), true)

end


RegisterNUICallback("voltarAoInventario", function(data)
    ---RequestModel(GetHashKey(data.prop))
    Retornar_Ao_Inventario(data.prop)
end)




RegisterNUICallback("carregarProps", function(data)
    print('Chamou a void')
    RequestModel(GetHashKey(data.prop))
    while not HasModelLoaded(GetHashKey(data.prop)) do
        Wait(500)
    end
    local props = CreateObject(GetHashKey(data.prop), tonumber(data.coord_x), tonumber(data.coord_y),
        tonumber(data.coord_z), true, true, true);

    SetEntityHeading(props, tonumber(data.coord_a))

    FreezeEntityPosition(props, true);

    if data.prop == 'prop_beach_fire' then
        AddTextEntry('MYBLIP', 'Fogueira')
        local base = AddBlipForCoord(tonumber(data.coord_x), tonumber(data.coord_y), tonumber(data.coord_z))
        BeginTextCommandSetBlipName('MYBLIP')
        SetBlipSprite(base, 436)
        AddTextComponentSubstringPlayerName('me')
        EndTextCommandSetBlipName(base)
    end

    print('objeto ' .. data.prop .. ' spawnado')
end)

----------------
RegisterNUICallback("Sair", function()
    SetDisplay(false)
end)

RegisterNUICallback("Facao", function()
   
end)
RegisterNUICallback("Taco", function()
    GiveWeaponToPed(PlayerPedId(), 2067956739, 1, 0, 1)
    AlertaNUI('lime','Arma obtida')
end)
-----------------------------------------------
RegisterNUICallback("Fogueira", function()
   
    local _,fogueira  = StatGetInt('MPPLY_CREW_LOCAL_XP_0', -1)
    if tonumber(fogueira) >= 1 then
        ----------------------------
        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.6, -1.6)
        Objeto_spawn = CreateObject(GetHashKey("prop_beach_fire"), cord2.x, cord2.y, cord2.z,
            GetEntityHeading(PlayerPedId()), true, true);
    
        SetEntityHeading(Objeto_spawn, GetEntityHeading(PlayerPedId()) + 90.0)
        FreezeEntityPosition(Objeto_spawn, true);
    
        AddTextEntry('MYBLIP', 'Fogueira')
        local base = AddBlipForCoord(cord2.x, cord2.y, cord2.z)
        BeginTextCommandSetBlipName('MYBLIP')
        SetBlipSprite(base, 436)
        AddTextComponentSubstringPlayerName('me')
        EndTextCommandSetBlipName(base)
        ----------------------------
        fogueira = tonumber(fogueira)-1
        StatSetInt('MPPLY_CREW_LOCAL_XP_0', tonumber(fogueira), true)

        AlertaNUI('lime','Fogueira criada com sucesso')
        
    else
        AlertaNUI('red','Voce nao possue uma fogueira em seu inventario')
    end

end)

RegisterNUICallback("Cabana", function()
    local _,cabana  = StatGetInt('MPPLY_CREW_HEIST_CASH_2', -1)
    if tonumber(cabana) >= 1 then
        ----------------------------
        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.7, -1.0)
        Objeto_spawn = CreateObject(GetHashKey("prop_gazebo_01"), cord2.x, cord2.y, cord2.z,
        GetEntityHeading(PlayerPedId()), true, true);
        SetEntityHeading(Objeto_spawn, GetEntityHeading(PlayerPedId()))
        FreezeEntityPosition(Objeto_spawn, true);
        ----------------------------
        cabana = tonumber(cabana)-1
        StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(cabana), true)

        AlertaNUI('lime','Cabana criada com sucesso')
        
    else
        AlertaNUI('red','Voce nao possue uma cabana em seu inventario')
    end
end)

RegisterNUICallback("MesadeTrabalho", function()
    local _,mesa  = StatGetInt('MPPLY_CREW_NO_HEISTS_3', -1)
    if tonumber(mesa) >= 1 then
        ----------------------------
        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.6, -1.0)
        Objeto_spawn = CreateObject(GetHashKey("prop_tool_bench02"), cord2.x, cord2.y, cord2.z,
        GetEntityHeading(PlayerPedId()), true, true);

        SetEntityHeading(Objeto_spawn, GetEntityHeading(PlayerPedId()) + 90.0)
        FreezeEntityPosition(Objeto_spawn, true);
        ----------------------------
        mesa = tonumber(mesa)-1
        StatSetInt('MPPLY_CREW_NO_HEISTS_3', tonumber(mesa), true)

        AlertaNUI('lime','Mesa criada com sucesso')
        
    else
        AlertaNUI('red','Voce nao possue uma mesa de trabalho em seu inventario')
    end
end)

RegisterNUICallback("Cerca", function()
    local _,cerca  = StatGetInt('MPPLY_CREW_NO_HEISTS_2', -1)
    if tonumber(cerca) >= 1 then
        ----------------------------
        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -2.0, 0.6, -1.0)
        Objeto_spawn = CreateObject(GetHashKey("prop_fnclink_02gate5"), cord2.x, cord2.y, cord2.z,
        GetEntityHeading(PlayerPedId()), true, true);
        SetEntityHeading(Objeto_spawn, GetEntityHeading(PlayerPedId()))
        FreezeEntityPosition(Objeto_spawn, true);
        ----------------------------
        cerca = tonumber(cerca)-1
        StatSetInt('MPPLY_CREW_NO_HEISTS_2', tonumber(cerca), true)

        AlertaNUI('lime','Cerca criada com sucesso')
        
    else
        AlertaNUI('red','Voce nao possue uma cerca em seu inventario')
    end
end)

RegisterNUICallback("Iluminacao", function()
    local _,luz  = StatGetInt('MPPLY_CREW_NO_HEISTS_4', -1)
    if tonumber(luz) >= 1 then
        ----------------------------
        local cord2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.6)
        Objeto_spawn = CreateObject(GetHashKey("prop_worklight_03a"), cord2.x, cord2.y, cord2.z,
        true, true, true);
        SetEntityHeading(Objeto_spawn, GetEntityHeading(PlayerPedId()) + 180.0)
        FreezeEntityPosition(Objeto_spawn, true);
        ----------------------------
        luz = tonumber(luz)-1
        StatSetInt('MPPLY_CREW_NO_HEISTS_4', tonumber(luz), true)

        AlertaNUI('lime','Luz criada com sucesso')
        
    else
        AlertaNUI('red','Voce nao possue uma luz em seu inventario')
    end
end)
 


RegisterNUICallback("SalvarUltimoProp", function()

    if DoesEntityExist(Objeto_spawn) then
        local cord2 = GetOffsetFromEntityInWorldCoords(Objeto_spawn, 0.0, 0.0, 0.0)
   
        SendNUIMessage({
            type = "salvar_prop",
            prophash = GetEntityArchetypeName(Objeto_spawn),
            propx = cord2.x,
            propy = cord2.y,
            propz = cord2.z,
            propa = GetEntityHeading(Objeto_spawn)
        })
    else
        SendNUIMessage({
            type = "alerta",
            texto = 'Objeto nao existe',
            tempo = 3,
            cor = 'red'
        })
    end
   
end)
RegisterNUICallback("ApagarUltimoProp", function()
    if DoesEntityExist(Objeto_spawn) then
        
        DeleteEntity(Objeto_spawn)

        Retornar_Ao_Inventario(GetEntityArchetypeName(Objeto_spawn))

        SendNUIMessage({
            type = "alerta",
            texto = 'Objeto deletado',
            tempo = 3,
            cor = 'lime'
        })
        SendNUIMessage({
            type = "alerta",
            texto = 'Itens de criação do objeto deletado, voltaram ao inventario',
            tempo = 3,
            cor = 'lime'
        })
    else
        SendNUIMessage({
            type = "alerta",
            texto = 'Objeto nao existe',
            tempo = 3,
            cor = 'red'
        })
    end
end)
------------------------------------------
RequestModel(0xB4A24065) --vida

RegisterNUICallback("Comida", function()
   
end)
RegisterNUICallback("Agua", function()
    local _, pm = StatGetInt("MPPLY_CREW_LOCAL_TIME_0", -1)
    if tonumber(pm) >= 1 then
        ---------------------
        local playerPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,0.0,1.0)
        CreateAmbientPickup(0x2C014CA6, playerPosition.x , playerPosition.y, playerPosition.z + 2, 0, 2500, 0xB4A24065, false, true)
        ---------------------
        local final = tonumber(pm) - 1
        StatSetInt('MPPLY_CREW_LOCAL_TIME_0', tonumber(final), true)
        AlertaNUI('lime','Vida renovada')
        AlertaNUI('lime','-1x agua')
    else
        AlertaNUI('red','Voce nao possue agua no inventario')
    end
end)
RegisterNUICallback("Fumar", function()
   
end)
-------------------------------------
function spawnCar(carro)
    local vehicleName = carro
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
end

RegisterNUICallback("HelicopteroAlugar", function()
   
end)
RegisterNUICallback("VeiculoMilitarAlugar", function()
   
end)
RegisterNUICallback("CarroAlugar", function()
   
end)
RegisterNUICallback("MotoAlugar", function()
   
end)
RegisterNUICallback("TransporteBasicoAlugar", function()
    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
    if tonumber(pm) >= 500 then
        ---------------------
        spawnCar('caddy3')
        ---------------------
        local final = tonumber(pm) - 500
        StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
        AlertaNUI('lime','Veiculo alugado')
    else
        AlertaNUI('red','Aluguel custa $500')
    end
end)
----------------------------------------------
function spawnAmigo(nome)
    local hash = GetHashKey(nome)
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
	
	if IsPedHuman(pedSpawnado) then
		GiveWeaponToPed(pedSpawnado, 984333226, 9999, 0, 1)
	end
	 
    
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
end


RegisterNUICallback("Chop", function()
    spawnAmigo('a_c_chop')
end)
RegisterNUICallback("Pantera", function()
   --A_C_MtLion
   spawnAmigo('A_C_MtLion')
end)
RegisterNUICallback("Civil", function()
   
end)
RegisterNUICallback("Assasino", function()
   
end)
RegisterNUICallback("Soldado", function()
   
end)
RegisterNUICallback("Policial", function()
   
end)
---------------------------------------------
RegisterNUICallback("SobreviventeHomem", function()
   
end)
RegisterNUICallback("SobreviventeMulher", function()
   
end)
RegisterNUICallback("InicianteHomem", function()
   
end)
RegisterNUICallback("InicianteMulher", function()
   
end)
RegisterNUICallback("ExperienteHomem", function()
   
end)
RegisterNUICallback("ExperienteMulher", function()
   
end)
RegisterNUICallback("GuerrilheiroHomem", function()
   
end)
RegisterNUICallback("GuerrilheiroMulher", function()
   
end)
RegisterNUICallback("VeteranoHomem", function()
   
end)
RegisterNUICallback("VeteranoMulher", function()
   
end)
---------------------------------------------


 
----------------
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    --envia infos pro html
    local horarioAtual = GetClockHours()
    --Envia a chamada pro html enviando a hora
    SendNUIMessage({
        type = "ui",
        status = bool, 
    })
end
----------------
Citizen.CreateThread(function()
    while display do
        Citizen.Wait(5)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)

local taCarregandoProps = true

Citizen.CreateThread(function()
    while taCarregandoProps do
		Wait(1000)
        if IsEntityVisible(PlayerPedId()) then
            if IsEntityOnScreen(PlayerPedId()) then
                SendNUIMessage({
                    type = "propload",
                    status = true
                })
                taCarregandoProps = false
            end
        end
    end
end)
