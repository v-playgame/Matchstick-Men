import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    screenWidth: 320
    screenHeight: 480

    EntityManager {
      id: entityManager
    }


    // menu scene
    MenuScene {
        id: menuScene
        onSelectLevelPressed: gameWindow.state = "selectLevel"
    }

    // scene for selecting levels
    SelectLevelScene {
        id: selectLevelScene
        onLevelPressed: {//Passing the selected Level to the GameScene
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.setLevel(selectedLevel)
            gameWindow.state = "game"
        }
        onBackButtonPressed: gameWindow.state = "menu"
    }

    // game scene to play a level
    GameScene {
        id: gameScene
        onBackButtonPressed: gameWindow.state = "selectLevel"
    }

    // 默认状态是菜单menu
    state: "menu"

    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene/*将焦点放在当前场景上*/}
        },
        State {
            name: "selectLevel"
            PropertyChanges {target: selectLevelScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectLevelScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]

}
