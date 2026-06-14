import Quickshell
import QtQuick

Item {
  id: wallpaperRoot
  width: 20
  height: 20

  Rectangle {
    anchors.fill: parent
    color: "red"
  }

  MouseArea {
    anchors.fill: parent
    onClicked: popup.shown = !popup.shown
  }

  PopupWindow {
    id: popup

    property bool shown: false

    visible: shown

    anchor.window: wallpaperRoot.QsWindow.window
    anchor.rect.x: 0
    anchor.rect.y: wallpaperRoot.height

    width: 500
    height: 500

    Rectangle {
      id: popupContent
      anchors.fill: parent
      color: "blue"

      opacity: popup.shown ? 1 : 0
      scale: popup.shown ? 1 : 0.95

      Behavior on opacity {
        NumberAnimation { duration: 150 }
      }

      Behavior on scale {
        NumberAnimation {
          duration: 150
          easing.type: Easing.OutCubic
        }
      }
    }
  }

}
