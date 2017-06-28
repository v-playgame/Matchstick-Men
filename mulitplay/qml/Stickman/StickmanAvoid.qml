import QtQuick 2.0
import VPlay 2.0
import "../StickmanAvoid"
import "../common" as Common

Common.Gamebase {
    gameName: "StickmanAvoid"
    id: scene

    //    property string gameState: "ready"
    property int score: 0

    width: 320
    height: 480
    PhysicsWorld {
        //debugDrawVisible: true
        gravity.y: 9.8
        z: 100
    }

    //    Scene {
    //        id: scene
    //        width: 320
    //        height: 480
    property string obstacleState: "run"
    property string gameState: "play"

    Ground {
        x: -100
        y: 300
    }
    Obstacle2 {
        id: o2
        x: scene.width
    }
    Obstacle {
        id: oo1
        x: scene.width + 300
        MovementAnimation {
            target: oo1
            property: "y"
            running: true
            minPropertyValue: -150
            maxPropertyValue: 200
            velocity: 200
            onLimitReached: {
                velocity = -velocity
            }
        }
    }
    Obstacle {
        id: oo2
        x: scene.width + 300 + 40
        MovementAnimation {
            target: oo2
            property: "y"
            running: true
            minPropertyValue: -150
            maxPropertyValue: 200
            velocity: 250
            onLimitReached: {
                velocity = -velocity
            }
        }
    }
    Obstacle {
        id: oo3
        x: scene.width + 300 + 80
        MovementAnimation {
            target: oo3
            property: "y"
            running: true
            minPropertyValue: -150
            maxPropertyValue: 200
            velocity: 300
            onLimitReached: {
                velocity = -velocity
            }
        }
    }
    Obstacle {
        id: oo4
        x: scene.width + 420
        MovementAnimation {
            target: oo4
            property: "y"
            running: true
            minPropertyValue: -150
            maxPropertyValue: 200
            velocity: 200
            onLimitReached: {
                velocity = -velocity
            }
        }
    }
    Obstacle {
        id: oo5
        x: scene.width + 460
        MovementAnimation {
            target: oo5
            property: "y"
            running: true
            minPropertyValue: -150
            maxPropertyValue: 200
            velocity: 330
            onLimitReached: {
                velocity = -velocity
            }
        }
    }

    Player {
        id: player
        x: 100
        y: 200
    }
    MouseArea {
        id: myMouse
        anchors.fill: parent
        onPressed: {
            scene.obstacleState === "norun"
        }
    }
} //}
