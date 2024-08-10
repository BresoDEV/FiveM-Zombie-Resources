local display = false

RegisterCommand("craft", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function()
    SetDisplay(false)
end)






RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
end)


RegisterNUICallback("attStats", function(data)
    
     
    StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(data.madeira), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(data.ferro), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(data.cabana), true)
    print('recebeu o arrstatus')
    print('madeira: '..data.madeira)
    print('ferro: '..data.ferro)
    print('cabana: '..data.cabana)
    print('--------------')


end)





function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
 
    local _,madeira = StatGetInt('MPPLY_CREW_HEIST_CASH_0', -1)
    local _,ferro = StatGetInt('MPPLY_CREW_HEIST_CASH_1', -1)
    local _,cabana = StatGetInt('MPPLY_CREW_HEIST_CASH_2', -1)

    print("---------------------------")
    print("salvo no stat madeira: "..madeira)
    print("salvo no stat ferro: "..ferro)
    print("salvo no stat cabana: "..cabana)
    print("---------------------------")

    SendNUIMessage({
        type = "ui",
        status = bool,
        
        madeira = madeira,
        ferro = ferro,
        cabana = cabana,
        
    }) 
end

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

