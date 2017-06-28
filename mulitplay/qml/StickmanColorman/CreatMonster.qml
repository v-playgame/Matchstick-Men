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
        interval: /*5000*/2200

        // a new target(=monster) is spawned every second
        onTriggered: {
            console.debug("create a new monster")
            entityManager.createEntityFromComponent(lands)

        }
    }

        Timer {
            running: scene.gameState === "play"
            repeat: true
            interval: /*5000*/2300 + Math.random() * 100

            // a new target(=monster) is spawned every second
            onTriggered: {
                entityManager.createEntityFromComponent(pinkmonster)
            }
        }

        Timer {
            running: scene.gameState === "play"
            repeat: true
            interval: /*5000*/3000 +Math.random() * 100

            onTriggered: {
                entityManager.createEntityFromComponent(yellowmonster)
            }
        }


        Timer {
            running: scene.gameState === "play"
            repeat: true
            interval: /*3000*/2400 + Math.random() * 100

            // a new target(=monster) is spawned every second
            onTriggered: {
                console.debug("create a new monster")
                entityManager.createEntityFromComponent(bluemonster)
            }
        }

        Timer {
            running: scene.gameState === "play"
            repeat: true
            interval: /*7000*/2300 + Math.random() * 100
            // a new target(=monster) is spawned every second
            onTriggered: {
                console.debug("create a new monster")
                entityManager.createEntityFromComponent(greenmonster)
            }
        }
}
