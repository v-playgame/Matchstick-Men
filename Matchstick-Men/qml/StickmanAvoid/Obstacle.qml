import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: obstacle
    entityType: "obstacle1"
    x: scene.width + 400
    y: 0

    Rectangle {
        id: o1
        width: 5
        height: 100
        color: "black"
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
        maxPropertyValue: 150
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

            scene.gameState === "play"
        }
        minPropertyValue: -800
        maxPropertyValue: 800
        velocity: -100

        onLimitReached: {
            x = scene.width + 100
        }
    }

    MovementAnimation {
        id: mvs
        target: o1
        property: "x"
        running: {

            myMouse.pressed && scene.gameState === "play"
        }
        minPropertyValue: -800
        maxPropertyValue: 800
        velocity: 100

        onLimitReached: {
            x = -200
        }
    }

    BoxCollider {
        id: bc
        anchors.fill: o1
        bodyType: Body.Static
    }
}
