import Quickshell
import QtQuick
import Quickshell.Io

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
    onClicked: popupWindowModule.shown = !popupWindowModule.shown
  }

  PopupModule {
    id: popupWindowModule
    anchor.window: wallpaperRoot.QsWindow.window
  }
}

