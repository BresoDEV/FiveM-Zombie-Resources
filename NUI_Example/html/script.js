
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
                document.getElementById('hora').value = item.horarioAtual
              	document.getElementById('X').value = item.playerX
		document.getElementById('Y').value = item.playerY
		document.getElementById('Z').value = item.playerZ
		document.getElementById('A').value = item.playerAngle
            } else {
                display(false)
            }
        }
    })

