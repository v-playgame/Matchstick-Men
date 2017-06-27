import QtQuick 2.0

Item {

    function reset() {
        gameover.opacity = 0
        scene.gameState = "wait"
        tap.visible = true
        scene.score = 0
    }

    function stopGame() {
        scene.gameState = "gameOver"
        gameover.opacity = 1
    }

}
