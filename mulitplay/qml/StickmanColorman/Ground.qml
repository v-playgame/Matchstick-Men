import QtQuick 2.0
import VPlay 2.0

EntityBase {

    id: ground1
    entityType: "ground"

    width: gd.width
    height: gd.height

    MovementAnimation {
        id: movement
        target: ground1
        property: "x"
        minPropertyValue: -2000
        velocity: -120
        running: scene.gameState === "play"
    }
    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
    }
    Rectangle {
        id: gd
        anchors.centerIn: parent
        border.color: "black"
        width: 1400
        height: 100
    }
}
