import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: obstacle
    entityType: "obstacle1"

    MultiResolutionImage {
        id: o1
        source: "/root/mulitplay/assets/img/pipe1.png"
    }
    Rectangle {
        id: re
        width: 2
        height: 2
        color: "red"
        anchors.top: o1.bottom
        anchors.right: o1.right
    }
    BoxCollider {
        anchors.fill: re
        bodyType: Body.Dynamic
    }

    MovementAnimation {
        target: o1
        property: "y"
        running: true
        minPropertyValue: -150
        maxPropertyValue: 100
        velocity: 200
        onLimitReached: {
            velocity = -velocity
        }
    }
    MovementAnimation {
        id: mv
        target: o1
        property: "x"
        running: {

            myMouse.pressed && scene.gameState === "play"
        }
        minPropertyValue: -800
        maxPropertyValue: 800
        velocity: -50

        onLimitReached: {
            x = scene.width + 100
        }
    }

    BoxCollider {
        id: bc
        anchors.fill: o1
        bodyType: Body.Static
    }
}
