import VPlay 2.0
import QtQuick 2.0

Item {
    width: parent.width
    height: parent.height
    opacity: 0
    visible: opacity === 0 ? false : true
    enabled: visible

    Text {
        id: go
        text: " Game Over"
        color: "black"
        font.pixelSize: 60
        x: 7
        y: 100
    }

    MultiResolutionImage {
        id: restart
        source: "../../assets/img/BgAndButton/restart.png"
        x: scene.width / 3
        y: scene.height / 2
        MouseArea {
            anchors.fill: restart
            onClicked: {
                if (scene.gameState === "gameOver") {
                    gameover.opacity = 0
                    allFunction.reset()
                }
            }
        }
    }
}
