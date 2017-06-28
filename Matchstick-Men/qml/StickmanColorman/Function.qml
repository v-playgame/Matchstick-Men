import QtQuick 2.0

Item {

    function reset() {
        gameover.opacity = 0
        scene.gameState = "play"
        scene.score = 0
        player.y = 200
        player.x = 100
        terrible.visible = false
        bad.visible = false
        justsoso.visible = false
        well.visible = false
        unbelievable.visible = false
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
    }
}
