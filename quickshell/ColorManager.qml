pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property var fallback: ({
        primary: "#f5b2e1",
        on_primary: "#181215",

        secondary: "#dcbed0",
        on_secondary: "#181215",

        tertiary: "#f5b2e1",
        error: "#ffb4ab",

        background: "#181215",
        on_background: "#f5dee8",

        surface: "#181215",
        on_surface: "#f5dee8",

        surface_container: "#24191f",
        surface_container_high: "#30232a",

        outline: "#9b8d95"
    })

    readonly property var data: {
        try {
            const raw = colorsFile.text()

            if (!raw || raw.length === 0) {
                return fallback
            }

            return JSON.parse(raw)
        } catch (e) {
            console.warn("Failed to parse matugen colors:", e)
            return fallback
        }
    }

    FileView {
        id: colorsFile

        path: "/home/dio/.local/state/quickshell/generated/colors.json"

        blockLoading: true
        watchChanges: true

        onFileChanged: reload()
    }
}
