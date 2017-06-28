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

    SoundEffectVPlay {
        id: pointSound
        source: "../../assets/snd/point.wav"
    }

    SoundEffectVPlay {
        id: hitSound
        source: "../../assets/snd/hit.wav"
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
