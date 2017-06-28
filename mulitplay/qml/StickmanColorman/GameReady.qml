import VPlay 2.0
import QtQuick 2.0

Item {
    width: parent.width
    height: parent.height
    opacity: 1
    visible: opacity === 0 ? false : true
    enabled: visible

    //    Text {
    //        text: "  Get Ready"
    //        color: "black"
    //        font.pixelSize: 60
    //        x: 5
    //        y: 100
    //    }

    //    MultiResolutionImage {
    //        id: play
    //        source: "/root/mulitplay/assets/img/play.png"
    //        x: scene.width / 3
    //        y: scene.height / 2
    //        MouseArea {
    //            anchors.fill: play
    //            onClicked: if (scene.gameState === "ready") {
    //                           scene.gameState = "wait"
    //                           gameready.opacity = 0
    //                           tap.visible = true
    //                       }
    //        }
    //    }
    MultiResolutionImage {
        id: play
        source: "/root/mulitplay/assets/img/gameStart/彩色忍者.png"
        x: 10
        y: 80
        MouseArea {
            anchors.fill: play
            onClicked: if (scene.gameState === "ready") {
                           scene.gameState = "wait"
                           gameready.opacity = 0
                           tap.visible = true
                       }
        }
    }
}
