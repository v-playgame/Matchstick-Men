import QtQuick 2.0
import VPlay 2.0
import "../StickmanStick"
import "../common" as Common

Common.Levelbase {
    levelName: "StickmanStick.qml"

    LevelBase {
        id: scene
        property string gameState: "wait"
        property string groundState: "stop"

    Ground {
        id: ground
        x: 10 + Math.random() * 100
        y: 320
    }

    MouseArea {
        id: mymouse
        anchors.fill: ground
        onClicked: scene.groundState = "move"
    }

    }
}
