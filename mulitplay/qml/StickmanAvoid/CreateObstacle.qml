import QtQuick 2.0
import VPlay 2.0

GameWindow {

    visible: false

    EntityManager {
        id: entityManager
        entityContainer: scene
    }
    Timer {
        interval: 100
        repeat: scene.n < 5
        running: scene.gameState === "play"
        onTriggered: {
            entityManager.createEntityFromComponent(obstacle)
            scene.n++
        }
    }
}
