import Quickshell
import Quickshell.Io
import QtQuick

Item {
  id: niriWindowRoot

  property string focusedTitle: "No focused window"
  property string focusedAppId: ""
  property string rawJson: ""

  Socket {
    id: sashaSocket
    path: "/run/user/1000/sasha.sock"
    connected: true

    parser: SplitParser {
      splitMarker: "\n"

      onRead: data => {
        rawJson = data

        const event = JSON.parse(data)

        if (event.SashaWindowFocusedChanged) {
          niriWindowRoot.focusedTitle =
            event.SashaWindowFocusedChanged.window_name ?? "No focused window"

          niriWindowRoot.focusedAppId =
            event.SashaWindowFocusedChanged.id ?? ""
        }
      }
    }

    onError: error => {
      console.log("Sasha socket error:", error)
    }
  }

  Text {
    text: niriWindowRoot.focusedTitle
    color: "white"
  }
}
