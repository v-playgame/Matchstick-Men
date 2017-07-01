import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: obstacle
    entityType: "obstacle2"

    MultiResolutionImage {
        id: o1
        source: "../../assets/img/barrier/view-filter.png"
    }

    MovementAnimation {
        target: o1
        property: "y"
        running: scene.gameState === "play"
        minPropertyValue: 0
        maxPropertyValue: 200
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
        maxPropertyValue: 200
        velocity: -150

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
        maxPropertyValue: 200
        velocity: 200

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
