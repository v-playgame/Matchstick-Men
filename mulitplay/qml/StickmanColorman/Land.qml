import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: land
    entityType: "land"
    Rectangle {
        id: ld
        border.color: "black"
        width: /*250*/220 + Math.random() * 100
        height: 200
    }
    y: 350 + Math.random() * 100

    x: scene.width + /*800*/250 + Math.floor(Math.random() * 2 + 1) * 60

    MovementAnimation {
        id: movement
        target: land
        property: "x"
        minPropertyValue: -800
        velocity: -150
        running: scene.gameState === "play"
    }
    BoxCollider {
        anchors.fill: ld
        bodyType: Body.Static
    }
}
