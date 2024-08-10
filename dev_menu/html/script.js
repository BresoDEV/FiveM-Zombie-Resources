$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)

                this.document.getElementById('X').value = item.playerX.toFixed(4)
                this.document.getElementById('Y').value = item.playerY.toFixed(4)
                this.document.getElementById('Z').value = item.playerZ.toFixed(4)
                this.document.getElementById('A').value = item.playerAngle.toFixed(4)

                this.document.getElementById('hora').value = item.horarioAtual
                 
            } else {
                display(false)
            }
        }
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