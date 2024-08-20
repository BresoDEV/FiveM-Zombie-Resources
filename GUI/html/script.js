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

