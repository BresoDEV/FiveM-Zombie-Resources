 

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
    StatSetInt('MPPLY_CREW_CHALENGE_WIN',tonumber(data.polvora),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_4',tonumber(data.gasolina),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_3',tonumber(data.vidro),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_2',tonumber(data.plastico),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_1',tonumber(data.papel),true)
    StatSetInt('MPPLY_CREW_LOCAL_TIME_0',tonumber(data.agua),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_4',tonumber(data.pano),true)
    StatSetInt('MPPLY_CREW_LOCAL_XP_3',tonumber(data.corda),true)


    --veiculos comprados
    StatSetInt('MPPLY_ACTIVITY_ENDED',tonumber(data.deathbike),true)
    StatSetInt('MPPLY_ACTIVITY_QUIT',tonumber(data.enduro),true)
    StatSetInt('MPPLY_ACTIVITY_STARTED',tonumber(data.gargoyle),true)
    StatSetInt('MPPLY_ARMWRESTLING_TOTAL_MATCH',tonumber(data.ratbike),true)
    StatSetInt('MPPLY_ARMWRESTLING_TOTAL_WINS',tonumber(data.dukes2),true)
    StatSetInt('MPPLY_BAD_CREW_EMBLEM',tonumber(data.caddy3),true)
    StatSetInt('MPPLY_BAD_CREW_MOTTO',tonumber(data.zr3802),true)
    StatSetInt('MPPLY_BAD_CREW_NAME',tonumber(data.dune3),true)
    StatSetInt('MPPLY_BAD_CREW_STATUS',tonumber(data.insurgent),true)
    StatSetInt('MPPLY_BADSPORT_END',tonumber(data.technical2),true)
    StatSetInt('MPPLY_BADSPORT_START',tonumber(data.apc),true)
    StatSetInt('MPPLY_CREW_0_ID',tonumber(data.issi4),true)
    StatSetInt('MPPLY_CREW_4_ID',tonumber(data.barrage),true)
    StatSetInt('MPPLY_CREW_3_ID',tonumber(data.cerberus),true)
    StatSetInt('MPPLY_CREW_2_ID',tonumber(data.phantom2),true)
    StatSetInt('MPPLY_CREW_1_ID',tonumber(data.thruster),true)
    StatSetInt('MPPLY_CREW_CHALENGE_ATTEMPTS',tonumber(data.havok),true)
    


--MPPLY_CREW_LOCAL_XP_2
--MPPLY_CREW_LOCAL_XP_1
--MPPLY_CREW_LOCAL_XP_0
--MPPLY_CREW_NO_HEISTS_4
--MPPLY_CREW_NO_HEISTS_3
--MPPLY_CREW_NO_HEISTS_2
--MPPLY_CREW_NO_HEISTS_1
--MPPLY_CREW_NO_HEISTS_0
--MPPLY_CURRENT_CREW_RANK
--MPPLY_DARTS_TOTAL_MATCHES
--MPPLY_DARTS_TOTAL_WINS
--MPPLY_GOLD_INTPLY_3
--MPPLY_GOLD_INTPLY_2
--MPPLY_GOLD_INTPLY_1
--MPPLY_GOLD_INTPLY_0
--MPPLY_GOLF_WINS
--MPPLY_HELPFUL
--MPPLY_GRIEFING
--MPPLY_PLAYERMADE_DESC
--MPPLY_PLAYERMADE_TITLE
--MPPLY_POWER_OFF_TDM
--MPPLY_POWER_OFF_RACE
--MPPLY_POWER_OFF_DM
--MPPLY_POWER_OFF_BJ
--MPPLY_RACE_CHEAT_TALLY
--MPPLY_RACE_CHEAT_END
--MPPLY_RACE_CHEAT_QUIT
--MPPLY_RACE_CHEAT_START
--MPPLY_UNIQUE_CONTACT_6
--MPPLY_UNIQUE_CONTACT_5
--MPPLY_UNIQUE_CONTACT_4
--MPPLY_UNIQUE_CONTACT_3
--MPPLY_UNIQUE_CONTACT_2
--MPPLY_UNIQUE_CONTACT_1
--MPPLY_UNIQUE_CONTACT_0
--MPPLY_UNIQUE_VERSUS
--MPPLY_UNIQUE_SURVIVAL
--MPPLY_UNIQUE_RACES
--MPPLY_UNIQUE_LTS
--MPPLY_UNIQUE_DMS
--MPPLY_UNIQUE_CTF
--MPPLY_UNIQUE_VERSUS_V
--MPPLY_UNIQUE_SURVIVAL_V
--MPPLY_UNIQUE_RACES_V
--MPPLY_UNIQUE_LTS_V
--MPPLY_UNIQUE_DMS_V
--MPPLY_UNIQUE_CTF_V

    
    

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
        local _,polvora =  StatGetInt('MPPLY_CREW_CHALENGE_WIN', -1)
        local _,gasolina =  StatGetInt('MPPLY_CREW_LOCAL_TIME_4', -1)
        local _,vidro =  StatGetInt('MPPLY_CREW_LOCAL_TIME_3', -1)
        local _,plastico =  StatGetInt('MPPLY_CREW_LOCAL_TIME_2', -1)
        local _,papel =  StatGetInt('MPPLY_CREW_LOCAL_TIME_1', -1)
        local _,agua =  StatGetInt('MPPLY_CREW_LOCAL_TIME_0', -1)
        local _,pano =  StatGetInt('MPPLY_CREW_LOCAL_XP_4', -1)
        local _,corda =  StatGetInt('MPPLY_CREW_LOCAL_XP_3', -1)
        

        --veiculos
        local _,deathbike = StatGetInt('MPPLY_ACTIVITY_ENDED',-1)
        local _,enduro = StatGetInt('MPPLY_ACTIVITY_QUIT',-1)
        local _,gargoyle = StatGetInt('MPPLY_ACTIVITY_STARTED',-1)
        local _,ratbike = StatGetInt('MPPLY_ARMWRESTLING_TOTAL_MATCH',-1)
        local _,dukes2 = StatGetInt('MPPLY_ARMWRESTLING_TOTAL_WINS',-1)
        local _,caddy3 = StatGetInt('MPPLY_BAD_CREW_EMBLEM',-1)
        local _,zr3802 = StatGetInt('MPPLY_BAD_CREW_MOTTO',-1)
        local _,dune3 = StatGetInt('MPPLY_BAD_CREW_NAME',-1)
        local _,insurgent = StatGetInt('MPPLY_BAD_CREW_STATUS',-1)
        local _,technical2 = StatGetInt('MPPLY_BADSPORT_END',-1)
        local _,apc = StatGetInt('MPPLY_BADSPORT_START',-1)
        local _,issi4 = StatGetInt('MPPLY_CREW_0_ID',-1)
        local _,barrage = StatGetInt('MPPLY_CREW_4_ID',-1)
        local _,cerberus = StatGetInt('MPPLY_CREW_3_ID',-1)
        local _,phantom2 = StatGetInt('MPPLY_CREW_2_ID',-1)
        local _,thruster = StatGetInt('MPPLY_CREW_1_ID',-1)
        local _,havok = StatGetInt('MPPLY_CREW_CHALENGE_ATTEMPTS',-1)

        
        
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
            polvora=polvora,
            gasolina=gasolina,
            vidro=vidro,
            plastico=plastico,
            papel=papel,
            agua=agua,
            pano=pano,
            corda=corda,

            --veiculos
            deathbike=deathbike,
            enduro=enduro,
            gargoyle=gargoyle,
            ratbike=ratbike,
            dukes2=dukes2,
            caddy3=caddy3,
            zr3802=zr3802,
            dune3=dune3,
            insurgent=insurgent,
            technical2=technical2,
            apc=apc,
            issi4=issi4,
            barrage=barrage,
            cerberus=cerberus,
            phantom2=phantom2,
            thruster=thruster,
            havok=havok,
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