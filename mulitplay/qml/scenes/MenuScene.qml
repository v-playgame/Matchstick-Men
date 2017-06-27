import VPlay 2.0
import QtQuick 2.0
import "../common"

//主界面（最开始的界面）
SceneBase {
    id:menuScene

    signal selectLevelPressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "MultiSceneMultiLevel"
    }

    MenuButton {
        anchors.centerIn: parent
        text: "Games"
        onClicked: selectLevelPressed()
    }

}
