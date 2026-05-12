import Quickshell
import QtQuick

import ".." as SashaRoot
import "../../.." as Root

Item {
    id: niriWorkspacesRoot

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    Row {
        id: row
        spacing: 8

        Repeater {
            model: SashaRoot.SashaManager.workspaceIdxs

            delegate: Rectangle {
                required property int modelData

                width: 24
                height: 24
                radius: 4

                color: modelData === SashaRoot.SashaManager.focusedWorkspaceIdx
                    ? Root.ColorManager.netRed
                    : "#333333"

                Text {
                    anchors.centerIn: parent
                    text: modelData
                    color: "white"
                }
            }
        }
    }
}
