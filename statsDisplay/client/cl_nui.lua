local display = true

function SetDisplay(bool)
    display = bool
    -- SetNuiFocus(bool, bool)

end

SetDisplay(display)

Citizen.CreateThread(function()

    while display do
        Citizen.Wait(5000)
       
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
            type = "ui",
            status = true,
           
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
end)

