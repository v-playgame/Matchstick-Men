import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: selectGameScene

    // 信号表明已经选择了一个级别
    signal gamePressed(string selectedGame)

    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        opacity: 0.3
        color: "#666666"
    }

    Grid {
        id: gameType
        anchors.centerIn: parent
        spacing: 10
        columns: 5

        MultiResolutionImage {
            id: jump
            source: "../../assets/img/gameScene/极限跳跃.png"
            MouseArea {
                anchors.fill: jump
                onClicked: gamePressed("StickmanJump.qml")
            }
        }

        MultiResolutionImage {
            id: stick
            source: "../../assets/img/gameScene/火柴人必须死.png"
            MouseArea {
                anchors.fill: stick
                onClicked: gamePressed("StickmanAvoid.qml")
            }
        }

        MultiResolutionImage {
            id: color
            source: "../../assets/img/gameScene/彩色忍者.png"
            MouseArea {
                anchors.fill: color
                onClicked: gamePressed("StickmanColorman.qml")
            }
        }
    }

    Grid {
        anchors.top: gameType.bottom
        x: 30
        spacing: 15
        columns: 3

        Text {
            id: game1
            font.pixelSize: 30
            text: "极限跳跃"
            color: "black"
        }

        Text {
            id: game2
            font.pixelSize: 30
            text: "火柴人必须死"
            color: "black"
        }

        Text {
            id: game3
            font.pixelSize: 30
            text: "彩色忍者"
            color: "black"
        }
    }

    MenuButton {
        text: "Back"
        anchors.right: selectGameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectGameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }
}
