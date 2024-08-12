local display = false

RegisterCommand("armas", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
end)

RegisterNUICallback("comprouArma", function(data)
    -- arma: 'AK47',
   --balas: municaoAtual,
   --valor: precoAK47,

    if data.arma == 'Railgun' then
        GiveWeaponToPed(PlayerPedId(), 1834241177, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'Minigun' then
        GiveWeaponToPed(PlayerPedId(), 1119849093, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'HeavyShotgun' then
        GiveWeaponToPed(PlayerPedId(), 984333226, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'Pistola' then
        GiveWeaponToPed(PlayerPedId(), 453432689, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'Shotgun' then
        GiveWeaponToPed(PlayerPedId(), 1432025498, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'AK47' then
        GiveWeaponToPed(PlayerPedId(), 961495388, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'Sniper' then
        GiveWeaponToPed(PlayerPedId(), 100416529, tonumber(data.balas), 0, 1)
    end
    if data.arma == 'Machado' then
        GiveWeaponToPed(PlayerPedId(), -102973651, 1, 0, 1)
    end

    local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
    StatSetInt('MP0_WALLET_BALANCE', tonumber(pm) - tonumber(data.valor), true)
    
    SetDisplay(false)
    SetDisplay(true)
    
end)



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


 


