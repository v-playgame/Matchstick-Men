import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: player
    entityType: "player"
    width: 26
    height: 26

    SpriteSequenceVPlay {
        id: fireman
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
        radius: 14
    }

    function push() {
        collider.body.linearVelocity = Qt.point(0, 0)
        var localForwardVector = collider.body.toWorldVector(Qt.point(0, -280))
        collider.body.applyLinearImpulse(localForwardVector,
                                         collider.body.getWorldCenter())
    }
}
