import QtQuick 2.0
import VPlay 2.0
Item{
    //    id:ground1

    //    width: gd.width
    //    height: gd.height
    //    MovementAnimation {
    //        id: movement
    //        target: gd
    //        property: "x"
    //        minPropertyValue: -400
    //        velocity: -120
    //        running: scene.gameState === "stand"
    //        onLimitReached: {
    //            pipe.x = 30+Math.random()*200
    //        }
    //    }




    //    BoxCollider {
    //      anchors.fill: parent
    //      bodyType: Body.Static
    //    }
    Rectangle{
        id:gd
        border.color: "black"
        width: 30 + Math.random() * 200
        height: 160
    }

}
