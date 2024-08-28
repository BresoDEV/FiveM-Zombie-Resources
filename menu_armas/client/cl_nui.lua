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



local tempoWait = 2000

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(tempoWait)

        local x =269.7560
        local y =-1112.7880
        local z =88.8146

        if IsEntityAtCoord(PlayerPedId(), x, y, z, 7.0, 7.0,7.0, 0, 1, 0) then
            
            tempoWait = 5

            DrawMarker(0, x,y,z, 
            0.0,0.0, 0.0, 0.0, 0.0, 0.0, 
            1.0, 1.0, 1.0,
            255, 0, 0, 160, 
            false, true, 2, nil, nil, false)
        
            if IsEntityAtCoord(PlayerPedId(), x, y, z, 3.0, 3.0,3.0, 0, 1, 0) then
            
                local onScreen, _x, _y = World3dToScreen2d(x, y, z)
                local px, py, pz = table.unpack(GetGameplayCamCoords())
                
                SetTextScale(0.35, 0.35)
                SetTextFont(4)
                SetTextProportional(1)
                SetTextColour(255, 255, 255, 215)
                SetTextEntry("STRING")
                SetTextCentre(1)
                AddTextComponentString('Aperte [E] para comprar armas')
                DrawText(_x, _y)
        
                if IsEntityAtCoord(PlayerPedId(), x, y, z, 1.0, 1.0,1.0, 0, 1, 0) then
                    if IsControlJustPressed(0,38) then
                        SetDisplay(not display)
						
                    end
                end
            end

           
            
        else
            tempoWait = 2000
        end



       
       
    end
end)


 


