import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: player
    entityType: "player"
    width: 26
    height: 26
    signal collidWithGround

    SpriteSequenceVPlay {

        anchors.centerIn: parent
        rotation: collider.linearVelocity.y
        running: scene.gameState === "play"

        SpriteVPlay {
            frameCount: 3
            frameRate: 10
            frameWidth: 40
            frameHeight: 40
            source: "../../assets/img/player/stickman.png"
        }
    }
    CircleCollider {
        id: collider
        radius: 13
        bodyType: Body.Dynamic

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target
            console.debug("collided with entity", collidedEntity.entityType)
            if (collidedEntity.entityType === "yellowmonster"
                    && player.y >= 310) {
                collidedEntity.removeEntity()
                scene.score++
            } else if (collidedEntity.entityType === "pinkmonster"
                       && player.y >= 310) {
                collidedEntity.removeEntity()
                scene.score++
            } else if (collidedEntity.entityType === "bluemonster"
                       || collidedEntity.entityType === "greenmonster") {
                allFunction.stopGame()
            } else if (collidedEntity.entityType === "land"
                       || collidedEntity.entityType === "ground") {
                emit: collidWithGround()
                scene.times = 0
                console.log("emit")
            } else
                allFunction.stopGame()
        }
    }

    function push() {
        collider.body.linearVelocity = Qt.point(0, 0)
        var localForwardVector = collider.body.toWorldVector(Qt.point(0, -280))
        collider.body.applyLinearImpulse(localForwardVector,
                                         collider.body.getWorldCenter())
    }
}
