import Quickshell
import QtQuick

import "modules/bar" as BarModule

Scope {
  Variants {
    model: Quickshell.screens

    BarModule.Bar {
      required property var modelData
      targetScreen: modelData
    }
  }
}
