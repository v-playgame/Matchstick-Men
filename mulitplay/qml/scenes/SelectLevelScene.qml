import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
  id:selectLevelScene


  // 信号表明已经选择了一个级别
  signal levelPressed(string selectedLevel)

  Rectangle {
    anchors.fill: parent.gameWindowAnchorItem
    color: "#ece468"
  }


  // levels to be selected
  Grid {
    anchors.centerIn: parent
    spacing: 10
    columns: 5
    MenuButton {
      text: "1"
      width: 50
      height: 50
      onClicked: {
        levelPressed("StickmanJump.qml")
      }
    }
    MenuButton {
      text: "2"
      width: 50
      height: 50
      onClicked: {
        levelPressed("StickmanStick.qml")
      }
    }
    MenuButton {
      text: "3"
      width: 50
      height: 50
      onClicked: {
        levelPressed("StickmanColorman.qml")
      }
    }
  }

  MenuButton {
    text: "Back"
    anchors.right: selectLevelScene.gameWindowAnchorItem.right
    anchors.rightMargin: 10
    anchors.top: selectLevelScene.gameWindowAnchorItem.top
    anchors.topMargin: 10
    onClicked: backButtonPressed()
  }

}
