import Quickshell
import Quickshell.Io
import QtQuick

import "../clock" as ClockWidget

Scope {
  id: barRoot
  required property var targetScreen

  PanelWindow {
    screen: barRoot.targetScreen

    anchors {
      top: true
      left: true
      right: true
    }
    implicitHeight: 30

    Rectangle {
      id: backgroundLayer
      anchors.fill: parent
      color: "#FF0000"
    }

    //bar content
    ClockWidget.Clock {
      id: clock
      anchors.centerIn: parent
    }
  }
}
