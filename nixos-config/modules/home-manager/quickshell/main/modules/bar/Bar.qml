import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Wayland

import "../clock" as ClockModule

Scope {
  id: barRoot
  required property var targetScreen

  PanelWindow {
    screen: barRoot.targetScreen
    WlrLayershell.namespace: "quickshell_bar"
    WlrLayershell.layer: WlrLayer.Top
    color: "transparent"

    anchors {
      top: true
      left: true
      right: true
    }
    implicitHeight: 30

    Rectangle {
      id: backgroundLayer
      anchors.fill: parent
      color: "#66191919"

      Row {
        id: leftSection
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 12
        spacing: 8

        Text {
          text: "workspaces"
          color: "white"
        }
      }

      Row {
        id: centerSection
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 8

        Text {
          text: "clock / focused window"
          color: "white"
        }
      }

      Row {
        id: rightSection
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 12
        spacing: 8

        Text {
          text: "battery"
          color: "white"
        }

        Text {
          text: "wifi"
          color: "white"
        }
      }
    }
  }
}
