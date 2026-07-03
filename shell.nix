{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ 
    tig
    lua-language-server
    nixd
    nixfmt
    qt6.qtdeclarative
  ];

  shellHook = ''
    echo "Entered dotfiles development shell..."
    export QML2_IMPORT_PATH="${pkgs.quickshell}/lib/qt-6/qml:${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml:$QML2_IMPORT_PATH"
    export QMLLS_BUILD_DIRS="$QML2_IMPORT_PATH"
  '';
}

