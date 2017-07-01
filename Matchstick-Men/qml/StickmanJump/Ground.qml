import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: ground
    entityType: "ground"
    width: sprite.width
    height: sprite.height

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
    }

    SpriteSequenceVPlay {
        id: sprite

        running: scene.gameState === "play"

        SpriteVPlay {
            frameCount: 2
            frameRate: 10
            frameWidth: 368
            frameHeight: 77
            source: "../../assets/img/BgAndButton/land.png"
        }
    }

}
