import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: yellow
    entityType: "yellowmonster"

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
            source: "/root/mulitplay/assets/img/monster/yellowMonster.png"
        }
    }

    x: scene.width + /*1000*/ 400 + Math.floor(Math.random() * 2 + 1) * 100

    MovementAnimation {
        id: movement
        target: yellow
        property: "x"
        minPropertyValue: -800
        velocity: -150
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
