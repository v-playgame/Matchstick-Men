import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: player
    entityType: "player"
    width: 26
    height: 26

    SpriteSequenceVPlay {
        id: bird
        anchors.centerIn: parent
        rotation: collider.linearVelocity.y
        running: true

        SpriteVPlay {
            frameCount: 3
            frameRate: 10
            frameWidth: 40
            frameHeight: 40
            source: "/root/mulitplay/assets/img/stickman.png"
        }
    }

    CircleCollider {
        id: collider
        radius: 13
        bodyType: Body.Dynamic
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target
            console.debug("collided with entity", collidedEntity.entityType)
            if (collidedEntity.entityType === "obstacle1"
                    || collidedEntity.entityType === "obstacle2") {
                scene.gameState = "gameOver"
            }
        }
    }

    function reset() {
        gameover.opacity = 0
        scene.gameState = "play"
        player.x = 160
        player.y = 375
        scene.score = 0
    }
}
