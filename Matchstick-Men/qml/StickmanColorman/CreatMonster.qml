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
        interval: /*5000*/ 2000

        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(lands)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: /*5000*/ 5432 + Math.random() * 100

        // a new target(=monster) is spawned every second
        onTriggered: {
            entityManager.createEntityFromComponent(pinkmonster)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: /*5000*/ 2375 + Math.random() * 100

        onTriggered: {
            entityManager.createEntityFromComponent(yellowmonster)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: /*3000*/ 4267 + Math.random() * 100

        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(bluemonster)
        }
    }

    Timer {
        running: scene.gameState === "play"
        repeat: true
        interval: /*7000*/3978 + Math.random() * 100
        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(greenmonster)
        }
    }
}
