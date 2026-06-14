import Quickshell
import QtQuick
import Quickshell.Io

import "../.." as Root

PopupWindow {
  id: popupWindow
  property bool shown: false
  visible: shown

  anchor.window: wallpaperRoot.QsWindow.window
  width: anchor.window.screen.width
  height: anchor.window.screen.height
  color: "transparent"

  MouseArea {
    anchors.fill: parent
    onClicked: popupWindow.shown = !popupWindow.shown
  }

  Rectangle {
    id: content

    width: parent.width * 0.8
    height: parent.height * 0.15
    z: 2
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    color: Root.ColorManager.data.primary
    border.width: 2
    border.color: "#afff4f"

    Row {
      anchors.fill: parent
      anchors.margins: 2
      spacing: 0

      Rectangle {
        width: parent.width / 4
        height: parent.height

        MouseArea {
          anchors.fill: parent
          onClicked: {
            Quickshell.execDetached({
              command: [
                "bash",
                "-lc",
                "/home/dio/dotfiles/scripts/system/update-wall.sh /home/dio/Backgrounds/green.png && /home/dio/dotfiles/scripts/system/switchwall.sh"
              ]
            })
          }
          Image {
            source: "/home/dio/Backgrounds/green.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
          }
        }
      }
      Rectangle {
        width: parent.width / 4
        height: parent.height

        MouseArea {
          anchors.fill: parent
          onClicked: {
            Quickshell.execDetached({
              command: [
                "bash",
                "-lc",
                "/home/dio/dotfiles/scripts/system/update-wall.sh /home/dio/Backgrounds/blue-eyes.png && /home/dio/dotfiles/scripts/system/switchwall.sh"
              ]
            })
          }
          Image {
            source: "/home/dio/Backgrounds/blue-eyes.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
          }
        }
      }

      Rectangle {
        width: parent.width / 4
        height: parent.height

        MouseArea {
          anchors.fill: parent
          onClicked: {
            Quickshell.execDetached({
              command: [
                "bash",
                "-lc",
                "/home/dio/dotfiles/scripts/system/update-wall.sh /home/dio/Backgrounds/green-eyes.png && /home/dio/dotfiles/scripts/system/switchwall.sh"
              ]
            })
          }
          Image {
            source: "/home/dio/Backgrounds/green-eyes.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
          }
        }
      }
      Rectangle {
        width: parent.width / 4
        height: parent.height

        MouseArea {
          anchors.fill: parent
          onClicked: {
            Quickshell.execDetached({
              command: [
                "bash",
                "-lc",
                "/home/dio/dotfiles/scripts/system/update-wall.sh /home/dio/Backgrounds/black-abstract.png && /home/dio/dotfiles/scripts/system/switchwall.sh"
              ]
            })
          }
          Image {
            source: "/home/dio/Backgrounds/black-abstract.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
          }
        }
      }


    }
  }

  
}
