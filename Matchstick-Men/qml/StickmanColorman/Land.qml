import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: land
    entityType: "land"
    Rectangle {
        id: ld
        border.color: "black"
        width: /*250*/ 220 + Math.random() * 100
        height: 200
    }
    Rectangle{
        id:re
        width: 1
        height: 1
        anchors.left: ld.right
        color: "red"
        anchors.top: ld.top
    }
    BoxCollider{
        anchors.fill: re
        bodyType: Body.Static
    }
    MovementAnimation {
        id: movement1
        target: re
        property: "x"
        minPropertyValue: -800
        velocity: -150
        running: scene.gameState === "play"
    }

    y: 350 /*+ Math.random() * 100*/

    x: scene.width + /*800*/ 290 /*+ Math.floor(Math.random() * 2 + 1) * 40*/

    MovementAnimation {
        id: movement
        target: land
        property: "x"
        minPropertyValue: -800
        velocity: -200
        running: scene.gameState === "play"
    }
    BoxCollider {
        anchors.fill: ld
        bodyType: Body.Static
    }
}
