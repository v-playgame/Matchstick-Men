import QtQuick 2.0

Item {

    function startGame() {
        scene.gameState = "play"
        gameready.opacity = 0
    }

    function stopGame() {
        scene.gameState = "gameOver"
        gameover.opacity = 1
        if (scene.score < 4) {
            terrible.visible = true
        } else if (scene.score < 8 && scene.score >= 4) {
            bad.visible = true
        } else if (scene.score < 15 && scene.score >= 8) {
            justsoso.visible = true
        } else if (scene.score < 25 && scene.score >= 15) {
            well.visible = true
        } else {
            unbelievable.visible = true
        }

        hitSound.play()
    }

    function reset() {
        scene.gameState = "wait"
        pipe.x = 400
        pipe.y = 30 + Math.random() * 200
        player.x = 100
        player.y = 375
        scene.score = 0
        gameover.opacity = 0
        tap.visible = true
        terrible.visible = false
        bad.visible = false
        justsoso.visible = false
        well.visible = false
        unbelievable.visible = false
    }
}
