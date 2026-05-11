import Quickshell
import Quickshell.Io
import QtQuick

import "../../.." as Root

Item {
  id: niriWindowRoot

  property string focusedTitle: "No focused window"
  property string focusedAppId: ""

  implicitWidth: focusedText.implicitWidth
  implicitHeight: focusedText.implicitHeight


  Socket {
    id: sashaSocket
    path: "/run/user/1000/sasha.sock"
    connected: true

    parser: SplitParser {
      splitMarker: "\n"

      onRead: data => {

        const event = JSON.parse(data)

        if (event.SashaWindowFocusedChanged) {
          niriWindowRoot.focusedTitle =
            event.SashaWindowFocusedChanged.window_name ?? "No focused window"

          niriWindowRoot.focusedAppId =
            event.SashaWindowFocusedChanged.id ?? ""
        }

        if (event.SashaWindowOpenedOrChanged) {
          niriWindowRoot.focusedTitle =
            event.SashaWindowOpenedOrChanged.window_name ?? "No focused window"
        }
      }
    }

    onError: error => {
      console.log("Sasha socket error:", error)
    }
  }

  Timer {
    id: reconnectTimer
    interval: 1000
    repeat: false
    onTriggered: {
      sashaSocket.connected = true
    }
  }

  Text {
    id: focusedText
    text: niriWindowRoot.focusedTitle
    color: Root.ColorManager.netRed
    font.family: Root.FontManager.ntype82FontFamily
    font.pixelSize: Root.FontManager.fontNormal
  }
}
