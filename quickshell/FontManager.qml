pragma Singleton
import QtQuick

Item {
  // ==========
  // SPECIAL FONTS
  // ==========
  FontLoader {
    id: ndot57
    source: "./assets/Ndot57-Regular.otf"
  }
  property string nothingFontFamily: ndot57.name

  FontLoader {
    id: lettera
    source: "./assets/LetteraMonoLL-Regular.otf"
  }
  property string letteraFontFamily: lettera.name

  FontLoader {
    id: ntype82
    source: "./assets/NType82-Regular.otf"
  }
  property string ntype82FontFamily: ntype82.name

  property int fontSmall: 12
  property int fontNormal: 16
  property int fontLarge: 24
}
