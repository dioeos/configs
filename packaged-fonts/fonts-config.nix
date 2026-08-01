{ pkgs, ... }:

let
  array-font = pkgs.stdenvNoCC.mkDerivation {
    pname = "array-font";
    version = "1.0";

    src = ./Array-Regular.ttf;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp $src $out/share/fonts/truetype/Array-Regular.ttf
    '';
  };

  ndot57-font = pkgs.stdenvNoCC.mkDerivation {
    pname = "ndot57-font";
    version = "1.0";

    src = ./Ndot57-Regular.otf;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      cp $src $out/share/fonts/opentype/Ndot57-Regular.otf
    '';
  };
in
{
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    array-font
    ndot57-font
  ];
}
