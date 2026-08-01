import Quickshell
import Quickshell.Io
import QtQuick

import "../.." as Root

Item {
  id: clockRoot

  property string time: ""
  implicitWidth: clockText.implicitWidth + 12

  Rectangle {
    anchors.fill: parent
    color: "transparent"

    Text {
      id: clockText
      anchors.centerIn: parent
      text: clockRoot.time
      font.pixelSize: Root.FontManager.fontNormal
      font.family: Root.FontManager.ndot57FontFamily
      color: Root.ColorManager.colors.primary
    }
  }

  Process {
    id: dateProcess

    command: ["date", "+%I:%M %p - %a %d"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: clockRoot.time = this.text.trim()
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProcess.running = true
  }
}
