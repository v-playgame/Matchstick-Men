import VPlay 2.0
import QtQuick 2.0
import "../common"


//主界面（最开始的界面）
SceneBase {
    id: menuScene

    signal selectGamePressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "black"
        //        color: "silver"
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 10
        font.pixelSize: 150
        //        color: "#e9e9e9"
        color: "pink"

        text: "最'有趣'的火柴人合集"
    }

    MenuButton {
        anchors.centerIn: parent
        text: "Games"
        onClicked: selectGamePressed()
    }
}
