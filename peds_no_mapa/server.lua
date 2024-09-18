local itens = {{
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
}, { -- medico
    ped = "mp_f_meth_01",
    X = 50.2941,
    Y = -381.1460,
    Z = 63.8009,
    Angulo = 325.0,
    Scenario = "WORLD_HUMAN_STAND_MOBILE"
}, { -- weedfarm
    ped = "csb_jackhowitzer",
    X = 329.8747,
    Y = -1103.8857,
    Z = 38.3512,
    Angulo = 211.6953,
    Scenario = "WORLD_HUMAN_DRINKING"
}, { -- beco
    ped = "mp_m_exarmy_01",
    X = 359.1521,
    Y = -1111.7668,
    Z = 28.4064,
    Angulo = 162.1531,
    Scenario = "WORLD_HUMAN_SMOKING"
}, { -- traficante meth
    ped = "mp_m_exarmy_01",
    X = -1109.1860,
    Y = -1641.3240,
    Z = 3.6405,
    Angulo = 294.5190,
    Scenario = "WORLD_HUMAN_STAND_MOBILE"
}}

local pedsForamCriados = false

RegisterNetEvent('spawnarPed')

AddEventHandler('spawnarPed', function()

    if pedsForamCriados == false then
        for _, elementos in pairs(itens) do

            local hash = GetHashKey(elementos.ped)
            local Ped = CreatePed(26, hash, elementos.X, elementos.Y, elementos.Z, 0, 1, 0)

            while not DoesEntityExist(Ped) do
                Wait(500)
            end
            SetEntityHeading(Ped, elementos.Angulo)
            FreezeEntityPosition(Ped, true)
            local vehNetId = NetworkGetNetworkIdFromEntity(Ped)
            local sources = source

            -- print('vehNetId: '..vehNetId)
            -- print('Scenario: '..elementos.Scenario)

            TriggerClientEvent('aplicarScenarioPed', -1, vehNetId, elementos.Scenario)

            Wait(500)

        end
        pedsForamCriados = true
    end
end)



