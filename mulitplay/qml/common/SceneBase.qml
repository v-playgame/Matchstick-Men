import VPlay 2.0
import QtQuick 2.0

Scene {
  id: sceneBase
  //最开始建立的窗口是隐藏的
  opacity: 0
   visible: opacity > 0
   enabled: visible
}
