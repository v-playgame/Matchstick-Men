import QtQuick 2.0
import VPlay 2.0

Item {
    EntityBase {
        id: green
        entityType: "greenmonster"

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
                source: "../../assets/img/monster/greenMonster.png"
            }
        }
        x: scene.width + /*800*/ 320 + Math.floor(Math.random() * 2 + 1) * 100

        MovementAnimation {
            id: movement
            target: green
            property: "x"
            minPropertyValue: -800
            velocity: -200
            running: scene.gameState === "play"
        }

        CircleCollider {
            id: collider
            radius: 20
            anchors.fill: mst
            bodyType: Body.Dynamic
            fixture.onBeginContact: {
            var collidedEntity = other.getBody().target
            console.debug("collided with entity", collidedEntity.entityType)
                if (collidedEntity.entityType  !=="land"&&collidedEntity.entityType  !=="player")
                collidedEntity.removeEntity()
            }
        }
    }
}
