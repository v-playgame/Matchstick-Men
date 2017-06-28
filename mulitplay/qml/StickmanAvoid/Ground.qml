import QtQuick 2.0
import VPlay 2.0

EntityBase{
    id:ground
    Rectangle{
        id:re
        border.color: "black"
        width: scene.width*2
        height: 200
    }
    BoxCollider{
        anchors.fill: re
        bodyType: Body.Static
    }
}
