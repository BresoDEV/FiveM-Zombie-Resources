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
        if (item.type === "ui") {
            if (item.status == true) {



                ///this.document.getElementById('X').value = item.playerX.toFixed(4)
                ///this.document.getElementById('Y').value = item.playerY.toFixed(4)
                ///this.document.getElementById('Z').value = item.playerZ.toFixed(4)
                ///this.document.getElementById('A').value = item.playerAngle.toFixed(4)
                ///
                ///this.document.getElementById('hora').value = item.horarioAtual

                // this.print(item.d1)
                //this.print(item.d2)
                //this.print(item.PlayerPedId)

                if (!localStorage.getItem('dinheiro')) {
                    localStorage.setItem('dinheiro', 0)
                }
                localStorage.setItem('dinheiro', item.d1)

                localStorage.setItem('nomeJogador', item.PlayerPedId)


                display(true)

            } else {
                display(false)
            }
        }

        //chamado 1x ao entrar no jogo, pra att o dinheiro
       //if (item.type === "attdinheiro") {
       //    if (!localStorage.getItem('dinheiro')) {
       //        localStorage.setItem('dinheiro', 0)
       //    }

       //    $.post("http://veiculosGUI/comprou", JSON.stringify({
       //        dinheiro: localStorage.getItem('dinheiro')
       //    }))

       //}
    })

    // document.onkeyup = function(data) {
    //     if (data.which == 27) {
    //         $.post("http://nui/exit", JSON.stringify({}));
    //         return
    //     }
    // };
    // $("#close").click(function () {
    //     $.post('http://nui/exit', JSON.stringify({}));
    //     return
    // })



    //$("#submit").click(function () {
    //    let inputValue = $("#input").val()
    //    let cor = $("#cor").val()
    //    if (inputValue.length >= 100) {
    //        $.post("http://nui/error", JSON.stringify({
    //            error: "Input was greater than 100"
    //        }))
    //        return
    //    } else if (!inputValue) {
    //        $.post("http://nui/error", JSON.stringify({
    //            error: "There was no value in the input field"
    //        }))
    //        return
    //    }
    //    $.post("http://nui/main", JSON.stringify({
    //        text: inputValue,
    //        rgb: cor
    //    }));
    //    return;
    //})


})