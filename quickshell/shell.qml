import Quickshell
import QtQuick

import "widgets/bar" as BarWidget

Scope {
  Variants {
    model: Quickshell.screens

    BarWidget.Bar {
      required property var modelData
      targetScreen: modelData
    }
  }
}
