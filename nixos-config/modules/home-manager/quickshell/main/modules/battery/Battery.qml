import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

import "../.." as Root

Item {
  id: batteryRoot

  property string batteryPercentage: ""

  Rectangle {
    anchors.fill: parent

    Text {
      id: batteryText
      anchors.centerIn: parent
      text: Math.round(UPower.displayDevice.percentage * 100) + "%"
      color: Root.ColorManager.colors.primary
      // color: UPower.displayDevice.energyRate < 0
      //   ? "white"
      //   : Root.ColorManager.data.primary
      // font.family: Root.FontManager.nothingFontFamily
      font.family: Root.FontManager.ndot57FontFamily
      font.pixelSize: Root.FontManager.fontNormal
    }
  }
}

