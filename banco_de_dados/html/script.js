$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.type === "obter_do_banco") {

            if (!localStorage.getItem('dinheiro')) {
                localStorage.setItem('dinheiro', 0)
            }

            if (!localStorage.getItem('zumbis_mortos')) {
                localStorage.setItem('zumbis_mortos', 0)
            }

            if (!localStorage.getItem('zumbis_mortos_sem_mirar')) {
                localStorage.setItem('zumbis_mortos_sem_mirar', 0)
            }

            if (!localStorage.getItem('headshots_com_sniper')) {
                localStorage.setItem('headshots_com_sniper', 0)
            }

            if (!localStorage.getItem('tiros_dados')) {
                localStorage.setItem('tiros_dados', 0)
            }

            if (!localStorage.getItem('headshots')) {
                localStorage.setItem('headshots', 0)
            }

            if (!localStorage.getItem('distancia_dirigindo_carro')) {
                localStorage.setItem('distancia_dirigindo_carro', 0)
            }

            if (!localStorage.getItem('distancia_correndo')) {
                localStorage.setItem('distancia_correndo', 0)
            }
            if (!localStorage.getItem('distancia_caminhando')) {
                localStorage.setItem('distancia_caminhando', 0)
            }

            if (!localStorage.getItem('tempo_de_jogo')) {
                localStorage.setItem('tempo_de_jogo', 0)
            }

            if (!localStorage.getItem('quantas_vezes_morreu')) {
                localStorage.setItem('quantas_vezes_morreu', 0)
            }


            //craft menhu
            if (!localStorage.getItem('madeira')) {
                localStorage.setItem('madeira', 0)
            }
            if (!localStorage.getItem('ferro')) {
                localStorage.setItem('ferro', 0)
            }
            if (!localStorage.getItem('cabana')) {
                localStorage.setItem('cabana', 0)
            }


            $.post("http://banco_de_dados/attDadosDoJogo", JSON.stringify({
                dinheiro: localStorage.getItem('dinheiro'),//MP0_WALLET_BALANCE
                zumbis_mortos: localStorage.getItem('zumbis_mortos'),//KILLS
                zumbis_mortos_sem_mirar: localStorage.getItem('zumbis_mortos_sem_mirar'),//KILLS_IN_FREE_AIM
                headshots_com_sniper: localStorage.getItem('headshots_com_sniper'),//SNIPERRFL_HEADSHOTS
                tiros_dados: localStorage.getItem('tiros_dados'),//SHOTS
                headshots: localStorage.getItem('headshots'),//HEADSHOTS
                distancia_dirigindo_carro: localStorage.getItem('distancia_dirigindo_carro'),//DIST_CAR
                distancia_correndo: localStorage.getItem('distancia_correndo'),//DIST_RUNNING
                distancia_caminhando: localStorage.getItem('distancia_caminhando'),//DIST_WALKING
                tempo_de_jogo: localStorage.getItem('tempo_de_jogo'),//TOTAL_PLAYING_TIME  (milisegundos)
                quantas_vezes_morreu: localStorage.getItem('quantas_vezes_morreu'),//DEATHS
                
                //craft menu
                madeira: localStorage.getItem('madeira'),//MPPLY_CREW_HEIST_CASH_0
                ferro: localStorage.getItem('ferro'),//MPPLY_CREW_HEIST_CASH_1
                cabana: localStorage.getItem('cabana'),//MPPLY_CREW_HEIST_CASH_2
            }))
      
            /*
            Stats livres:

            CHAR_MC_FAILED
            CHAR_MC_OVER
            CHAR_MC_STARTED
            CHAR_MISSION_OVER
            CHAR_MISSION_PASSED
            CHAR_MISSION_QUIT
            CHAR_MISSION_STARTED
            TOTAL_SHOP_TIME
            TOTAL_TIMES_ARRESTED
            LONGEST_PLAYING_TIME
            MPPLY_CREW_HEIST_CASH_3
            MPPLY_TOTAL_RACES_WON
            MPPLY_TOTAL_RACES_LOST
            MPPLY_TOTAL_SPENT
            MPPLY_TOTAL_SVC
            PROSTITUTES_FREQUENTED
            */

        }

        if (item.type === "atualizar_banco") {


            localStorage.setItem('dinheiro', item.dinheiro)//MP0_WALLET_BALANCE
            localStorage.setItem('zumbis_mortos', item.zumbis_mortos)//KILLS
            localStorage.setItem('zumbis_mortos_sem_mirar', item.zumbis_mortos_sem_mirar)//KILLS_IN_FREE_AIM
            localStorage.setItem('headshots_com_sniper', item.headshots_com_sniper)//SNIPERRFL_HEADSHOTS
            localStorage.setItem('tiros_dados', item.tiros_dados)//SHOTS
            localStorage.setItem('headshots', item.headshots)//HEADSHOTS
            localStorage.setItem('distancia_dirigindo_carro', item.distancia_dirigindo_carro)//DIST_CAR
            localStorage.setItem('distancia_correndo', item.distancia_correndo)//DIST_RUNNING
            localStorage.setItem('distancia_caminhando', item.distancia_caminhando)//DIST_WALKING
            localStorage.setItem('tempo_de_jogo', item.tempo_de_jogo)//TOTAL_PLAYING_TIME  (milisegundos)
            localStorage.setItem('quantas_vezes_morreu', item.quantas_vezes_morreu)//DEATHS


            //craft menu
            localStorage.setItem('madeira',item.madeira),//MPPLY_CREW_HEIST_CASH_0
            localStorage.setItem('ferro',item.ferro),//MPPLY_CREW_HEIST_CASH_1
            localStorage.setItem('cabana',item.cabana),//MPPLY_CREW_HEIST_CASH_2

            console.log('madeira DB:'+localStorage.getItem('madeira'))
            console.log('ferro DB:'+localStorage.getItem('ferro'))
            console.log('cabana DB:'+localStorage.getItem('cabana'))

             
        }
    })



})