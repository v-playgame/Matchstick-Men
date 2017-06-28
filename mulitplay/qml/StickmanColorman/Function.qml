import QtQuick 2.0

Item {

    function reset() {
        gameover.opacity = 0
        scene.gameState = "play"
//        tap.visible = true
        scene.score = 0
        player.y = 200
        player.x = 100
    }

    function stopGame() {
        scene.gameState = "gameOver"
        gameover.opacity = 1
    }

}
