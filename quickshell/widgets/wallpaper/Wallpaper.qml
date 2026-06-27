import Quickshell
import QtQuick
import Quickshell.Io

import "../.." as Root

Item {
  id: wallpaperRoot
  width: 20
  height: 20

  Rectangle {
    anchors.fill: parent
    color: Root.ColorManager.data.primary
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

