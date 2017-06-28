import VPlay 2.0
import QtQuick 2.0
import "../StickmanAvoid"
import "../common" as Common

Common.Gamebase {
    gameName: "StickmanAvoid"

    id: scene

    PhysicsWorld {
        // debugDrawVisible: true
        gravity.y: 0.1
        z: 100
    }
    property string obstacleState: "run"
    property string gameState: "ready"
    property int n: 0

    Ground {
        x: -100
        y: 300
    }
    Obstacle2 {
        id: o2
        x: scene.width
    }

    Obstacle3 {
        id: obstacle3
        x: 1160
        y: 150
    }

    CreateObstacle {
    }

    Component {
        id: obstacle
        Obstacle {
            id: o1
        }
    }

    Player {
        id: player
        x: 100
        y: 300
    }

    Text {
        id: tap
        text: "(Tap the start button to start)"
        color: "silver"
        font.pixelSize: 20
        x: 30
        y: 200
        visible: false
    }

    GameReady {
        id: gameReady
    }

    GameOver {
        id: gameOver
    }

    Common.MenuButton {
        id: opposition
        text: "opposition"
        anchors.right: scene.right
        y: 250
        opacity: 0.7
        visible: opacity
        anchors.rightMargin: 10
        anchors.topMargin: 10
    }

    Common.MenuButton {
        text: "start"
        anchors.right: scene.right
        y: 50
        opacity: 0.7
        visible: opacity
        anchors.rightMargin: 10
        anchors.topMargin: 10
        onClicked: {
            if (scene.gameState === "wait") {
                tap.visible = false
                scene.gameState = "play"
            }
        }
    }

    MouseArea {
        id: myMouse
        anchors.fill: opposition
    }
}
