{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ 
    tig
    lua-language-server
    nixd
    nixfmt
  ];

  shellHook = ''
    echo "Entered dotfiles development shell..."
  '';
}

