local display = false

RegisterCommand("bau", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
 
    local _, inventario_madeira = StatGetInt('MPPLY_CREW_HEIST_CASH_0', -1)
    local _, inventario_ferro = StatGetInt('MPPLY_CREW_HEIST_CASH_1', -1)
    local _, inventario_cabana = StatGetInt('MPPLY_CREW_HEIST_CASH_2', -1)
    local _, inventario_polvora = StatGetInt('MPPLY_CREW_CHALENGE_WIN', -1)
    local _, inventario_gasolina = StatGetInt('MPPLY_CREW_LOCAL_TIME_4', -1)
    local _, inventario_vidro = StatGetInt('MPPLY_CREW_LOCAL_TIME_3', -1)
    local _, inventario_plastico = StatGetInt('MPPLY_CREW_LOCAL_TIME_2', -1)
    local _, inventario_papel = StatGetInt('MPPLY_CREW_LOCAL_TIME_1', -1)
    local _, inventario_agua = StatGetInt('MPPLY_CREW_LOCAL_TIME_0', -1)
    local _, inventario_pano = StatGetInt('MPPLY_CREW_LOCAL_XP_4', -1)
    local _, inventario_corda = StatGetInt('MPPLY_CREW_LOCAL_XP_3', -1)
    
    SendNUIMessage({
        type = "bau",
        status = bool,
        
        inventario_madeira = inventario_madeira,
        inventario_ferro = inventario_ferro,
        inventario_cabana = inventario_cabana,
        inventario_polvora = inventario_polvora,
        inventario_gasolina = inventario_gasolina,
        inventario_vidro = inventario_vidro,
        inventario_plastico = inventario_plastico,
        inventario_papel = inventario_papel,
        inventario_agua = inventario_agua,
        inventario_pano = inventario_pano,
        inventario_corda = inventario_corda,
    })
    
end






RegisterNUICallback("salvar", function(data)
    StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(data.inventario_madeira), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(data.inventario_ferro), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(data.inventario_cabana), true)
    StatSetInt('MPPLY_CREW_CHALENGE_WIN', tonumber(data.inventario_polvora), true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_4', tonumber(data.inventario_gasolina), true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_3', tonumber(data.inventario_vidro), true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_2', tonumber(data.inventario_plastico), true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_1', tonumber(data.inventario_papel), true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_0', tonumber(data.inventario_agua), true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_4', tonumber(data.inventario_pano), true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_3', tonumber(data.inventario_corda), true)
end)


Citizen.CreateThread(function()
    while display do
        Citizen.Wait(100)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)