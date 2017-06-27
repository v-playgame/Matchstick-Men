import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: pink
    entityType: "pinkmonster"

    SpriteSequenceVPlay {
        id: mst
        anchors.centerIn: parent
        rotation: collider.linearVelocity.y
        running: scene.gameState === "play"

        SpriteVPlay {
            frameCount: 3
            frameRate: 10
            frameWidth: 40
            frameHeight: 43
            source: "/root/mulitplay/assets/img/pinkMonster.jpg"
        }
    }

    x: scene.width + 1000 + Math.floor(Math.random() * 2 + 1) * 100

    MovementAnimation {
        id: movement
        target: pink
        property: "x"
        minPropertyValue: -800
        velocity: -120
        running: scene.gameState === "play"
    }
    BoxCollider {
        id: collider
        anchors.bottom: mst.bottom
        width: 20
        height: scene.height + 45
        bodyType: Body.Dynamic
    }
}
