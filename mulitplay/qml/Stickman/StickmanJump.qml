import QtQuick 2.0
import VPlay 2.0
import "../StickmanJump"
import "../common" as Common

Common.Gamebase {
    gameName: "StickmanJump"
    id: scene

    property string gameState: "ready"
    property int score: 0

    width: 320
    height: 480

    PhysicsWorld {
        //debugDrawVisible: true // set this to false to hide the physics overlay
        gravity.y: 27
        z: 1000 // set this high enough to draw on top of everything else
    }

    Pipe {
        id: pipe
        x: 400
        y: 30 + Math.random() * 200
    }

    Player {
        id: player
        x: 147
    }

    Ground {
        id: ground
        anchors.horizontalCenter: scene.horizontalCenter
        anchors.bottom: scene.bottom
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
        text: scene.score
        color: "black"
        anchors.horizontalCenter: scene.horizontalCenter
        y: 30
        font.pixelSize: 30
    }

    Common.MenuButton {
        id: back
        text: "Jump"
        anchors.right: scene.right
        anchors.rightMargin: 10
        anchors.bottom: ground.top
        anchors.topMargin: 10
        onClicked: {
            if (scene.gameState === "wait") {
                tap.visible = false
                scene.gameState = "play"
            } else if (scene.gameState === "play")
                player.push()
        }
    }

    //            MouseArea {
    ////                anchors.fill: scene
    ////                mouseX:
    //                onClicked: {
    //                    if(scene.gameState === "wait") {
    //                        tap.visible = false
    //                        scene.gameState = "play"
    //                    } else if(scene.gameState === "play")
    //                        player.push()
    //                }
    //            }
    SoundEffectVPlay {
        id: pointSound
        source: "/root/mulitplay/assets/snd/point.wav"
    }

    SoundEffectVPlay {
        id: hitSound
        source: "/root/mulitplay/assets/snd/hit.wav"
    }

    Function {
        id: allFunction
    }

    GameReady {
        id: gameready
    }

    GameOver {
        id: gameover
    }
}
