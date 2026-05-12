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

                width: 30
                height: 20
                radius: 4

                color: modelData === SashaRoot.SashaManager.focusedWorkspaceIdx
                    ? Root.ColorManager.cyberGreen
                    : "#333333"

            }
        }
    }
}
