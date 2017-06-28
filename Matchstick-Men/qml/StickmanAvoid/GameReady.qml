import VPlay 2.0
import QtQuick 2.0

Item {
    width: parent.width
    height: parent.height
    opacity: 1
    visible: opacity === 0 ? false : true
    enabled: visible

    MultiResolutionImage {
        id: play
        source: "../../assets/img/gameStart/必须死.png"
        x: 10
        y: 60
        MouseArea {
            anchors.fill: play
            onClicked: if (scene.gameState === "ready") {
                           scene.gameState = "wait"
                           gameReady.opacity = 0
                           tap.visible = true
                       }
        }
    }
}
