import QtQuick 2.0
import VPlay 2.0

GameWindow {

    visible: false

    EntityManager {
        id: entityManager
        entityContainer: scene
    }

    Timer {
        id: timer
        running: scene.gameState === "play"
        repeat: true
        interval: 5000

        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            //            console.debug(player.y.toString())
            entityManager.createEntityFromComponent(lands)
            entityManager.createEntityFromComponent(pinkmonster)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: 3000

        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(bluemonster)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: 7000
        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(greenmonster)
        }
    }
}
