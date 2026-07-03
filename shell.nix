{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ 
    tig
    lua-language-server
  ];

  shellHook = ''
    echo "Entered dotfiles development shell..."
  '';
}

