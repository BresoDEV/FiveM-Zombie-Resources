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
    StatSetInt('MPPLY_CREW_CHALENGE_WIN',tonumber(data.polvora),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_4',tonumber(data.gasolina),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_3',tonumber(data.vidro),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_2',tonumber(data.plastico),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_1',tonumber(data.papel),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_0',tonumber(data.agua),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_4',tonumber(data.pano),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_3',tonumber(data.corda),true)

    StatSetInt('MPPLY_CREW_LOCAL_XP_1', tonumber(data.kit_reparo), true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_0', tonumber(data.fogueira), true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_4', tonumber(data.luz), true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_3', tonumber(data.mesa_trabalho), true)
    StatSetInt('MPPLY_CREW_NO_HEISTS_2', tonumber(data.grade), true)

end)





function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
 
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

        local _,kit_reparo  = StatGetInt('MPPLY_CREW_LOCAL_XP_1', -1)
        local _,fogueira  = StatGetInt('MPPLY_CREW_LOCAL_XP_0', -1)
        local _,luz  = StatGetInt('MPPLY_CREW_NO_HEISTS_4', -1)
        local _,mesa_trabalho  = StatGetInt('MPPLY_CREW_NO_HEISTS_3', -1)
        local _,grade  = StatGetInt('MPPLY_CREW_NO_HEISTS_2', -1)
   

    SendNUIMessage({
        type = "ui",
        status = bool,
        
        madeira = madeira,
            ferro = ferro,
            cabana = cabana,
            polvora=polvora,
            gasolina=gasolina,
            vidro=vidro,
            plastico=plastico,
            papel=papel,
            agua=agua,
            pano=pano,
            corda=corda,
            kit_reparo  = kit_reparo,
            fogueira  = fogueira,
            luz  = luz,
            mesa_trabalho  = mesa_trabalho,
            grade  = grade,
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

