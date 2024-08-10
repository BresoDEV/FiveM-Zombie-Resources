 

RegisterNUICallback("attDadosDoJogo", function(data)
    StatSetInt('MP0_WALLET_BALANCE', tonumber(data.dinheiro), true)
    StatSetInt('MP0_KILLS', tonumber(data.zumbis_mortos), true)
    StatSetInt('MP0_KILLS_IN_FREE_AIM', tonumber(data.zumbis_mortos_sem_mirar), true)
    StatSetInt('MP0_SNIPERRFL_HEADSHOTS', tonumber(data.headshots_com_sniper), true)
    StatSetInt('MP0_SHOTS', tonumber(data.tiros_dados), true)
    StatSetInt('MP0_HEADSHOTS', tonumber(data.headshots), true)
    StatSetFloat('MP0_DIST_CAR', tonumber(data.distancia_dirigindo_carro), true)
    StatSetFloat('MP0_DIST_RUNNING', tonumber(data.distancia_correndo), true)
    StatSetFloat('MP0_DIST_WALKING', tonumber(data.distancia_caminhando), true)
    StatSetInt('MP0_TOTAL_PLAYING_TIME', tonumber(data.tempo_de_jogo), true)--(milisegundos)
    StatSetInt('MP0_DEATHS', tonumber(data.quantas_vezes_morreu), true)
   
    --craft menu
    StatSetInt('MPPLY_CREW_HEIST_CASH_0', tonumber(data.madeira), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_1', tonumber(data.ferro), true)
    StatSetInt('MPPLY_CREW_HEIST_CASH_2', tonumber(data.cabana), true)
    --StatSetInt('', tonumber(data.), true)
    
    
    
    
    

end)


 



function update()

    while true do
        Citizen.Wait(10000)

        local _,dinheiro = StatGetInt('MP0_WALLET_BALANCE', -1)
        local _,zumbis_mortos = StatGetInt('MP0_KILLS', -1)
        local _,zumbis_mortos_sem_mirar = StatGetInt('MP0_KILLS_IN_FREE_AIM', -1)
        local _,headshots_com_sniper = StatGetInt('MP0_SNIPERRFL_HEADSHOTS', -1)
        local _,tiros_dados = StatGetInt('MP0_SHOTS', -1)
        local _,headshots = StatGetInt('MP0_HEADSHOTS', -1)
        local _,distancia_dirigindo_carro = StatGetFloat('MP0_DIST_CAR', -1)
        local _,distancia_correndo = StatGetFloat('MP0_DIST_RUNNING', -1)
        local _,distancia_caminhando = StatGetFloat('MP0_DIST_WALKING', -1)
        local _,tempo_de_jogo = StatGetInt('MP0_TOTAL_PLAYING_TIME',-1)--(milisegundos)
        local _,quantas_vezes_morreu = StatGetInt('MP0_DEATHS', -1)
        
        --craft menu
        local _,madeira = StatGetInt('MPPLY_CREW_HEIST_CASH_0', -1)
        local _,ferro = StatGetInt('MPPLY_CREW_HEIST_CASH_1', -1)
        local _,cabana = StatGetInt('MPPLY_CREW_HEIST_CASH_2', -1)


        
        SendNUIMessage({
            type = "atualizar_banco",
    
            dinheiro = dinheiro,
            zumbis_mortos = zumbis_mortos,
            zumbis_mortos_sem_mirar = zumbis_mortos_sem_mirar,
            headshots_com_sniper = headshots_com_sniper,
            tiros_dados = tiros_dados,
            headshots = headshots,
            distancia_dirigindo_carro = distancia_dirigindo_carro,
            distancia_correndo = distancia_correndo,
            distancia_caminhando = distancia_caminhando,
            tempo_de_jogo = tempo_de_jogo,--(milisegundos)
            quantas_vezes_morreu = quantas_vezes_morreu,

            --craft menu
            madeira = madeira,
            ferro = ferro,
            cabana = cabana,
        })
         
        
    end

end


local attDados = true

while attDados do
    Citizen.Wait(100)
    if IsEntityVisible(PlayerPedId())  then

        if IsEntityOnScreen(PlayerPedId()) then
            SendNUIMessage({
                type = "obter_do_banco",
                status = true, 
            })
            attDados = false
            update()
        end
    end

end