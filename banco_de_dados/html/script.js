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
            if (!localStorage.getItem('polvora')) {
                localStorage.setItem('polvora', 0)
            }
            if (!localStorage.getItem('gasolina')) {
                localStorage.setItem('gasolina', 0)
            }
            if (!localStorage.getItem('vidro')) {
                localStorage.setItem('vidro', 0)
            }
            if (!localStorage.getItem('plastico')) {
                localStorage.setItem('plastico', 0)
            }
            if (!localStorage.getItem('papel')) {
                localStorage.setItem('papel', 0)
            }
            if (!localStorage.getItem('agua')) {
                localStorage.setItem('agua', 0)
            }
            if (!localStorage.getItem('pano')) {
                localStorage.setItem('pano', 0)
            }
            if (!localStorage.getItem('corda')) {
                localStorage.setItem('corda', 0)
            }

            //veiculos
            if (!localStorage.getItem('deathbike')) {
                localStorage.setItem('deathbike', 0)
            }
            if (!localStorage.getItem('enduro')) {
                localStorage.setItem('enduro', 0)
            }
            if (!localStorage.getItem('gargoyle')) {
                localStorage.setItem('gargoyle', 0)
            }
            if (!localStorage.getItem('ratbike')) {
                localStorage.setItem('ratbike', 0)
            }
            if (!localStorage.getItem('dukes2')) {
                localStorage.setItem('dukes2', 0)
            }
            if (!localStorage.getItem('caddy3')) {
                localStorage.setItem('caddy3', 0)
            }
            if (!localStorage.getItem('zr3802')) {
                localStorage.setItem('zr3802', 0)
            }
            if (!localStorage.getItem('dune3')) {
                localStorage.setItem('dune3', 0)
            }
            if (!localStorage.getItem('insurgent')) {
                localStorage.setItem('insurgent', 0)
            }
            if (!localStorage.getItem('technical2')) {
                localStorage.setItem('technical2', 0)
            }
            if (!localStorage.getItem('apc')) {
                localStorage.setItem('apc', 0)
            }
            if (!localStorage.getItem('issi4')) {
                localStorage.setItem('issi4', 0)
            }
            if (!localStorage.getItem('barrage')) {
                localStorage.setItem('barrage', 0)
            }
            if (!localStorage.getItem('cerberus')) {
                localStorage.setItem('cerberus', 0)
            }
            if (!localStorage.getItem('phantom2')) {
                localStorage.setItem('phantom2', 0)
            }
            if (!localStorage.getItem('thruster')) {
                localStorage.setItem('thruster', 0)
            }
            if (!localStorage.getItem('havok')) {
                localStorage.setItem('havok', 0)
            }




            //----------------------------------------


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
                polvora: localStorage.getItem('polvora'),
                gasolina: localStorage.getItem('gasolina'),
                vidro: localStorage.getItem('vidro'),
                plastico: localStorage.getItem('plastico'),
                papel: localStorage.getItem('papel'),
                agua: localStorage.getItem('agua'),
                pano: localStorage.getItem('pano'),
                corda: localStorage.getItem('corda'),


                //veiculos
                deathbike: localStorage.getItem('deathbike'),
                enduro: localStorage.getItem('enduro'),
                gargoyle: localStorage.getItem('gargoyle'),
                ratbike: localStorage.getItem('ratbike'),
                dukes2: localStorage.getItem('dukes2'),
                caddy3: localStorage.getItem('caddy3'),
                zr3802: localStorage.getItem('zr3802'),
                dune3: localStorage.getItem('dune3'),
                insurgent: localStorage.getItem('insurgent'),
                technical2: localStorage.getItem('technical2'),
                apc: localStorage.getItem('apc'),
                issi4: localStorage.getItem('issi4'),
                barrage: localStorage.getItem('barrage'),
                cerberus: localStorage.getItem('cerberus'),
                phantom2: localStorage.getItem('phantom2'),
                thruster: localStorage.getItem('thruster'),
                havok: localStorage.getItem('havok'),
            }))




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
            localStorage.setItem('madeira', item.madeira)//MPPLY_CREW_HEIST_CASH_0
                localStorage.setItem('ferro', item.ferro)//MPPLY_CREW_HEIST_CASH_1
                localStorage.setItem('cabana', item.cabana)//MPPLY_CREW_HEIST_CASH_2

                localStorage.setItem('polvora', item.polvora),
                localStorage.setItem('gasolina', item.gasolina),
                localStorage.setItem('vidro', item.vidro),
                localStorage.setItem('plastico', item.plastico),
                localStorage.setItem('papel', item.papel),
                localStorage.setItem('agua', item.agua),
                localStorage.setItem('pano', item.pano),
                localStorage.setItem('corda', item.corda),



                //veiculos
                localStorage.setItem('deathbike', item.deathbike)
                localStorage.setItem('enduro', item.enduro)
                localStorage.setItem('gargoyle', item.gargoyle)
                localStorage.setItem('ratbike', item.ratbike)
                localStorage.setItem('dukes2', item.dukes2)
                localStorage.setItem('caddy3', item.caddy3)
                localStorage.setItem('zr3802', item.zr3802)
                localStorage.setItem('dune3', item.dune3)
                localStorage.setItem('insurgent', item.insurgent)
                localStorage.setItem('technical2', item.technical)
                localStorage.setItem('apc', item.apc)
                localStorage.setItem('issi4', item.issi4)
                localStorage.setItem('barrage', item.barrage)
                localStorage.setItem('cerberus', item.cerberus)
                localStorage.setItem('phantom2', item.phantom2)
                localStorage.setItem('thruster', item.thruster)
                localStorage.setItem('havok', item.havok)
                    
        }
    })



})