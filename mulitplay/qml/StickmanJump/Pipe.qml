import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: pipe
    entityType: "pipe"

    height: 120
    width: 1

    MovementAnimation {
        id: movementX
        target: pipe
        property: "x"
        minPropertyValue: -150
        velocity: -140
        running: scene.gameState === "play"
        onLimitReached: {
            pipe.x = 400
            pipe.y = 30 + Math.random() * 200
        }
    }

    MovementAnimation {
        id: movementY
        target: pipe
        property: "y"
        minPropertyValue: 50
        maxPropertyValue: 250
        velocity: 30
        running: scene.gameState === "play"
        onLimitReached: {
            velocity = -velocity
        }
    }

    BoxCollider {
        anchors.fill: upperPipe
        bodyType: Body.Static
        collisionTestingOnlyMode: false
        fixture.onBeginContact: {
            allFunction.stopGame()
        }
    }

    BoxCollider {
        anchors.fill: lowerPipe
        bodyType: Body.Static
        collisionTestingOnlyMode: false
        fixture.onBeginContact: {
            allFunction.stopGame()
        }
    }
    BoxCollider {
        anchors.fill: pipe
        bodyType: Body.Static
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {
            scene.score++
            pointSound.play()
        }
    }

    MultiResolutionImage {
        id: lowerPipe
        source: "../../assets/img/barrier/pipe.png"
        mirror: true
        rotation: 180
        anchors.top: pipe.bottom
        anchors.horizontalCenter: pipe.horizontalCenter
    }

    MultiResolutionImage {
        id: upperPipe
        source: "../../assets/img/barrier/pipe.png"
        anchors.bottom: pipe.top
        anchors.horizontalCenter: pipe.horizontalCenter
    }

    function stopGame() {
        scene.gameState = "gameOver"
        gameover.opacity = 1
        hitSound.play()
    }
}
