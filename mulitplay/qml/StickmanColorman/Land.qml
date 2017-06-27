import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: land
    entityType: "land"
    Rectangle {
        id: ld
        border.color: "black"
        width: 400
        height: 200 + Math.random() * 100
    }
    y: 300

    x: scene.width + 800 + Math.floor(Math.random() * 2 + 1) * 100

    MovementAnimation {
        id: movement
        target: land
        property: "x"
        minPropertyValue: -800
        velocity: -120
        running: scene.gameState === "play"
    }
    BoxCollider {
        anchors.fill: ld
        bodyType: Body.Static
    }
}
