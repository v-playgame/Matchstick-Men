﻿import VPlay 2.0
import QtQuick 2.0
import Controls 1.0
import "../StickmanColorman"
import "../common" as Common

Common.Gamebase {
    gameName: "StickmanColorman"

    id: scene

    property string gameState: "ready"
    property int score: 0
    property int times: 0
    property double num: 80

    PhysicsWorld {
       // debugDrawVisible: true // set this to false to hide the physics overlay
        gravity.y: 27
        z: 1000 // set this high enough to draw on top of everything else
    }

    Player {
        id: player
        x: 80
    }

    Ground {
        x: 80
        //y: 400
        anchors.bottom: scene.bottom
    }

    Text {
        text: scene.score
        color: "black"
        anchors.horizontalCenter: scene.horizontalCenter
        y: 30
        font.pixelSize: 30
    }

    Controls {
        id: control
        minX: scene.num > 80 ? scene.num : 80

        onMinXChanged: {
            scene.gameState === "gameOver"
        }
    }

    Component {
        id: pinkmonster

        PinkMonster {
            id: pink
        }
    }

    Component {
        id: yellowmonster

        YellowMonster {
            id: yellow
        }
    }

    Component {
        id: bluemonster
        BlueMonster {
            id: blue
        }
    }

    Component {
        id: greenmonster
        GreenMonster {
            id: green
        }
    }

    Component {
        id: lands
        Land {
            id: land

        }
    }

    Text {
        id: tap
        text: "(Tap the Jump button to start)"
        color: "silver"
        font.pixelSize: 20
        x: 30
        y: 200
        visible: false
    }

    Text {
        id: bad
        x: scene.width / 2 - bad.width / 2
        anchors.top: scene.top
        text: "BAD!!!"
        color: "red"
        font.pixelSize: 40
        visible: false
    }

    Text {
        id: terrible
        x: scene.width / 2 - bad.width / 2
        anchors.top: scene.top
        text: "Terrible!!!!!"
        color: "red"
        font.pixelSize: 40
        visible: false
    }

    Text {
        id: justsoso
        x: scene.width / 2 - justsoso.width / 2
        anchors.top: scene.top
        text: "Just So So!!"
        color: "red"
        font.pixelSize: 40
        visible: false
    }

    Text {
        id: well
        x: scene.width / 2 - well.width / 2
        anchors.top: scene.top
        text: "WELL!"
        color: "red"
        font.pixelSize: 40
        visible: false
    }

    Text {
        id: unbelievable
        x: scene.width / 2 - unbelievable.width / 2
        anchors.top: scene.top
        text: "Unbelievable"
        color: "red"
        font.pixelSize: 40
        visible: false
    }

    CreatMonster {
    }

    Function {
        id: allFunction
    }

    Common.MenuButton {
        text: "Jump"
        anchors.right: scene.right
        y: 250
        opacity: 0.5
        visible: opacity
        anchors.rightMargin: 10
        anchors.topMargin: 10
        onClicked: {
            console.log(player.y.toString())
            if (player.y > 500 || player.x < 30)
                allFunction.stopGame()
            if (scene.gameState === "wait") {
                tap.visible = false
                scene.gameState = "play"
            } else if (scene.gameState === "play" && scene.times < 5) {
                player.push()
                scene.times++
            }
        }
    }

    GameReady {
        id: gameready
    }

    GameOver {
        id: gameover
    }
}
