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
                player.stop()
                console.log(scene.gameState.toString())
            }
        }
    }

    function reset() {
        gameOver.opacity = 0
        scene.gameState = "play"
        //        tap.opacity = 1
        player.x += 10
    }

    function stop() {
        scene.gameState = "gameover"
        gameOver.opacity = 1
    }
}
