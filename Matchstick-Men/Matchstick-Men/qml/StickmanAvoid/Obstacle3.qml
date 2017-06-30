import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: obstacle3
    entityType: "obstacle3"
    Rectangle {
        id: o1
        width: 5
        height: 150
        color: "black"
    }

    MovementAnimation {
        id: mv
        target: o1
        property: "x"
        running: {

            scene.gameState === "play"
        }
        minPropertyValue: -2000
        maxPropertyValue: 2000
        velocity: -100

        onLimitReached: {
            x = scene.width + 100
        }
    }

    RotationAnimation {
        target: o1
        running: true
        from: 0
        to: 360
        duration: 800
        loops: Animation.Infinite
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
        anchors.fill: o1
        bodyType: Body.Static
    }
}
