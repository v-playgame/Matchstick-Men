import QtQuick 2.0

Item {

    function startGame() {
        scene.gameState = "play"
        gameready.opacity = 0
    }

    function stopGame() {
        scene.gameState = "gameOver"
        gameover.opacity = 1
        hitSound.play()
    }

    function reset() {
        scene.gameState = "wait"
        pipe.x = 400
        pipe.y = 30+Math.random()*200
        player.x = 100
        player.y = 375
        scene.score = 0
        gameover.opacity = 0
        tap.visible = true
    }

}
