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
        running: scene.gameState === "play"

        SpriteVPlay {
            frameCount: 3
            frameRate: 20
            frameWidth: 40
            frameHeight: 40
            source: {

                scene.gameState === "play"
                        && myMouse.pressed ? "../../assets/img/player/stickman1.png" : "../../assets/img/player/stickman.png"
            }
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
                    || collidedEntity.entityType === "obstacle2"
                    || collidedEntity.entityType === "obstacle3") {
                scene.gameState = "gameOver"
                console.log(scene.gameState.toString())
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
