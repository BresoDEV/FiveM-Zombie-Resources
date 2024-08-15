local display = false

RegisterCommand("carros", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
end)

RegisterNUICallback("comprou", function(data)
    

    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
    StatSetInt('MP0_WALLET_BALANCE', tonumber(pm) - tonumber(data.dinheiro), true)
end)
-------------------------------------------------
RegisterNUICallback("encomendou_deathbike", function(data)
    StatSetInt('MPPLY_ACTIVITY_ENDED', 1, true)
    spawn('deathbike')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_enduro", function(data)
    StatSetInt('MPPLY_ACTIVITY_QUIT', 1, true)
    spawn('enduro')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_gargoyle", function(data)
    StatSetInt('MPPLY_ACTIVITY_STARTED', 1, true)
    spawn('gargoyle')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_ratbike", function(data)
    StatSetInt('MPPLY_ARMWRESTLING_TOTAL_MATCH', 1, true)
    spawn('ratbike')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_dukes2", function(data)
    StatSetInt('MPPLY_ARMWRESTLING_TOTAL_WINS', 1, true)
    spawn('dukes2')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_caddy3", function(data)
    StatSetInt('MPPLY_BAD_CREW_EMBLEM', 1, true)
    spawn('caddy3')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_zr3802", function(data)
    StatSetInt('MPPLY_BAD_CREW_MOTTO', 1, true)
    spawn('zr3802')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_dune3", function(data)
    StatSetInt('MPPLY_BAD_CREW_NAME', 1, true)
    spawn('dune3')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_insurgent", function(data)
    StatSetInt('MPPLY_BAD_CREW_STATUS', 1, true)
    spawn('insurgent')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_technical2", function(data)
    StatSetInt('MPPLY_BADSPORT_END', 1, true)
    spawn('technical2')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_apc", function(data)
    StatSetInt('MPPLY_BADSPORT_START', 1, true)
    spawn('apc')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_issi4", function(data)
    StatSetInt('MPPLY_CREW_0_ID', 1, true)
    spawn('issi4')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_barrage", function(data)
    StatSetInt('MPPLY_CREW_4_ID', 1, true)
    spawn('barrage')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_cerberus", function(data)
    StatSetInt('MPPLY_CREW_3_ID', 1, true)
    print(data.valor)
    spawn('cerberus')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_phantom2", function(data)
    StatSetInt('MPPLY_CREW_2_ID', 1, true)
    spawn('phantom2')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_thruster", function(data)
    StatSetInt('MPPLY_CREW_1_ID', 1, true)
    spawn('thruster')
end)

----------------------------------------------------------
RegisterNUICallback("encomendou_havok", function(data)
    StatSetInt('MPPLY_CREW_CHALENGE_ATTEMPTS', 1, true)
    spawn('havok')
end)

----------------------------------------------------------
-------------------------------------------------

function spawn(carro)
    Wait(1000)
    local vehicleName = carro
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)

end

RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)

    local PlayerPedId = GetPlayerName(GetPlayerIndex())

    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)

    SendNUIMessage({
        type = "ui",
        status = bool,
        d1 = pm,
        PlayerPedId = GetPlayerName(GetPlayerIndex())
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


 
--local attODinheiro = true
--
--while attODinheiro do
--    Citizen.Wait(100)
--    if IsEntityVisible(PlayerPedId())  then
--
--        if IsEntityOnScreen(PlayerPedId()) then
--            SendNUIMessage({
--                type = "attdinheiro",
--                status = true, 
--            })
--            attODinheiro = false
--        end
--    end
--
--end


