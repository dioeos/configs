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

      Row {
        anchors.fill: parent
        spacing: 4

        Rectangle {
          width: parent.width / 2
          height: parent.height

          MouseArea {
            anchors.fill: parent
            onClicked: {
              Quickshell.execDetached({
                command: ["awww", "img", "/home/dio/Downloads/black-abstract.png"]
              })
            }
            Image {
              source: "/home/dio/Downloads/black-abstract.png"
              anchors.fill: parent
              fillMode: Image.PreserveAspectCrop
            }
          }
        }

        Rectangle {
          width: parent.width / 2
          height: parent.height

          MouseArea {
            anchors.fill: parent
            onClicked: {
              Quickshell.execDetached({
                command: ["awww", "img", "/home/dio/Downloads/green-eyes.png"]
              })
            }

            Image {
              source: "/home/dio/Downloads/green-eyes.png"
              anchors.fill: parent
              fillMode: Image.PreserveAspectCrop
            }
          }


        }

      }
    }
  }

}
