import VPlay 2.0
import QtQuick 2.0
import "../common"

//游戏界面

SceneBase {
    id:gameScene

    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property variant activeLevel

    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
    }

    MenuButton {
        text: "Back to menu"
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backButtonPressed()
            activeLevel = undefined
            activeLevelFileName = ""
        }
    }

    // load levels at runtime
    Loader {
        id: loader
        source: activeLevelFileName !== "" ? "../Stickman/" + activeLevelFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeLevel = item
        }
    }


    Text {
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        color: "black"
        font.pixelSize: 10
        text: activeLevel !== undefined ? activeLevel.levelName : ""
    }


}
