function trim(placa)
    return (string.gsub(placa,"^%s*(.-)%s*$","%1"))
end

function alerta(txt)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(txt)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

--client
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(3000)

        if IsPedInAnyVehicle(PlayerPedId(), false) then


            local meu_carro = GetVehiclePedIsIn(PlayerPedId(), 0)
            local placa = trim(string.lower(GetVehicleNumberPlateText(meu_carro)))


			

            if placa == 'money' then
                -------------------------------------------------
                local _, pm = StatGetInt("MP0_WALLET_BALANCE", -1)
                local final = tonumber(pm) + tonumber(1000)
                StatSetInt('MP0_WALLET_BALANCE', tonumber(final), true)
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Voce ganhou ~g~$1000~s~')










            elseif placa == 'body' then
                -------------------------------------------------
                local hash = GetHashKey('csb_ramp_marine')
                RequestModel(hash)
                local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,5.0,0.0)

                while not HasModelLoaded(hash) do
                    Wait(500)
                end
                local Ped = CreatePed(26, hash, c.x, c.y , c.z, 0, 1, 0)
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
                GiveWeaponToPed(Ped, 453432689, 9999, 0, 1)
                SetPedNeverLeavesGroup(Ped, my_group)
                SetPedCombatAbility(Ped, 100000)
                SetPedCanSwitchWeapon(Ped, 1)
            
                SetPedRelationshipGroupHash(Ped, 'PLAYER')
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Ajudante adicionado temporariamente')
            







            elseif placa == 'itens' then
                -------------------------------------------------
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
                
                StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(madeira) + tonumber(5), true)
                StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(ferro) + tonumber(5), true)
                StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(cabana) + tonumber(5), true)
                StatSetInt('MPPLY_CREW_CHALENGE_WIN',tonumber(polvora) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_TIME_4',tonumber(gasolina) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_TIME_3',tonumber(vidro) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_TIME_2',tonumber(plastico) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_TIME_1',tonumber(papel) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_TIME_0',tonumber(agua) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_XP_4',tonumber(pano) + tonumber(5),true)
                StatSetInt('MPPLY_CREW_LOCAL_XP_3',tonumber(corda) + tonumber(5),true)
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Voce ganhou itens do ADM')
            
            elseif placa == 'base' then
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                SetEntityCoords(PlayerPedId(), 273.4642, -1116.2220, 88.8147, 1, 0, 0, 0)
                SetEntityHeading(PlayerPedId(), 0.0)
                alerta('Teleportado ate a base pelo ADM')
            
            elseif placa == 'rat' then
                -------------------------------------------------
                StatSetInt('MPPLY_ARMWRESTLING_TOTAL_MATCH',1,true)
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Veiculo desbloqueado: ~b~Ratbike~s~')
            
            elseif placa == 'heli' then
                -------------------------------------------------
                StatSetInt('MPPLY_CREW_CHALENGE_ATTEMPTS',1,true)
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Veiculo desbloqueado: ~b~Helicoptero~s~')
            
            elseif placa == 'insur' then
                -------------------------------------------------
                StatSetInt('MPPLY_BAD_CREW_STATUS',1,true)
                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('Veiculo desbloqueado: ~b~Insurgent~s~')
            
            elseif placa == 'aaaaaa' then
                -------------------------------------------------

                -------------------------------------------------
                while DoesEntityExist(meu_carro) do
                    DeleteEntity(meu_carro)
                end
                alerta('')
            
            
            end 


        end
    end
end)

--Comandos:
--/adm itens
--/adm body
--/adm money
--/adm base
--/adm rat
--/adm heli
--/adm insur

RegisterCommand("adm", function(source, args)
   
    local comandoValido = false

    if args[1] ~= '' then
        if args[1] == 'itens' then
            comandoValido = true
        end
        if args[1] == 'body' then
            comandoValido = true
        end
        if args[1] == 'money' then
            comandoValido = true
        end
        if args[1] == 'base' then
            comandoValido = true
        end
        if args[1] == 'rat' then
            comandoValido = true
        end
        if args[1] == 'heli' then
            comandoValido = true
        end
        if args[1] == 'insur' then
            comandoValido = true
        end
        
    end

    if comandoValido then
        local vehicleName = 'speedo2'
        if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
            return
        end
        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end
        local c = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,5.0,0.0)
        local vehicle = CreateVehicle(vehicleName, c.x, c.y,c.z, GetEntityHeading(PlayerPedId()), true, true)
       
        while not DoesEntityExist(vehicle) do
            Wait(500)
        end
        SetVehicleNumberPlateText(vehicle,args[1])
    
    
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)
    else
        print('Comando invalido')
    end
    
end)
























    
