import VPlay 2.0
import QtQuick 2.0
import "../common"


//游戏界面
SceneBase {
    id: gameScene

    // the filename of the current level gets stored here, it is used for loading the
    property string activeGameFileName
    // the currently loaded level gets stored here
    property variant activeGame

    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setGame(fileName) {
        activeGameFileName = fileName
    }

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
    }

    MenuButton {
        text: "Back to menu"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backButtonPressed()
            activeGame = undefined
            activeGameFileName = ""
        }
    }

    // load game at runtime
    Loader {
        id: loader
        source: activeGameFileName !== "" ? "../Stickman/" + activeGameFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeGame = item
        }
    }

    Text {
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        color: "black"
        font.pixelSize: 10
        text: activeGame !== undefined ? activeGame.gameName : ""
    }
}
