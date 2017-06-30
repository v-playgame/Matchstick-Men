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
        onSelectGamePressed: gameWindow.state = "selectGame"
    }

    // scene for selecting games
    SelectGameScene {
        id: selectGameScene
        onGamePressed: {//Passing the selected Game to the GameScene
            gameScene.setGame(selectedGame)
            gameWindow.state = "game"
        }
        onBackButtonPressed: gameWindow.state = "menu"
    }

    // game scene to play
    GameScene {
        id: gameScene
        onBackButtonPressed: gameWindow.state = "selectGame"
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
            name: "selectGame"
            PropertyChanges {target: selectGameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectGameScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]

}
