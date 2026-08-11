{ pkgs }:

{
  fast-note-sync = pkgs.stdenv.mkDerivation {
    pname = "fast-note-sync";
    version = "2.4.0";

    dontUnpack = true;

    manifest = pkgs.fetchurl {
      url = "https://github.com/haierkeys/obsidian-fast-note-sync/releases/download/2.4.0/manifest.json";
      hash = "sha256:ae291d946cf147ed23a9336c998e597077e2a1de0200a762f353c1f2f3defe81";
    };
    main = pkgs.fetchurl {
      url = "https://github.com/haierkeys/obsidian-fast-note-sync/releases/download/2.4.0/main.js";
      hash = "sha256:24fdef9efb9da7efcc0b2e1df09308e48a53522d768da4705e9bc35422b7bc4f";
    };
    styles = pkgs.fetchurl {
      url = "https://github.com/haierkeys/obsidian-fast-note-sync/releases/download/2.4.0/styles.css";
      hash = "sha256:bce9ead5a96daea52ab573eff9e7f3a4824828835bd778ddd4424803f2655cb9";
    };

    installPhase = ''
      mkdir -p $out
      cp $manifest $out/manifest.json
      cp $main $out/main.js
      cp $styles $out/styles.css
    '';
  };

  omnisearch = pkgs.stdenv.mkDerivation {
    pname = "omnisearch";
    version = "1.29.3";

    dontUnpack = true;

    manifest = pkgs.fetchurl {
      url = "https://github.com/scambier/obsidian-omnisearch/releases/download/1.29.3/manifest.json";
      hash = "sha256:f9b2791c44ea02e6347383cd02719309f59792eb39361f32ccaafc6f49753b7b";
    };
    main = pkgs.fetchurl {
      url = "https://github.com/scambier/obsidian-omnisearch/releases/download/1.29.3/main.js";
      hash = "sha256:d87ceddfe9fc429fe0b64f3d480be488c1e491f2889d24370061d3a2e5afcf4c";
    };
    styles = pkgs.fetchurl {
      url = "https://github.com/scambier/obsidian-omnisearch/releases/download/1.29.3/styles.css";
      hash = "sha256:818e6b361e426ab3a868a4524a20df5a6416bf614876b61ede340d0f78c9ebc8";
    };

    installPhase = ''
      mkdir -p $out
      cp $manifest $out/manifest.json
      cp $main $out/main.js
      cp $styles $out/styles.css
    '';
  };

  obsidian-to-anki = pkgs.stdenv.mkDerivation {
    pname = "obsidian-to-anki";
    version = "3.6.0";

    dontUnpack = true;

    manifest = pkgs.fetchurl {
      url = "https://github.com/ObsidianToAnki/Obsidian_to_Anki/releases/download/3.6.0/manifest.json";
      hash = "sha256-SzzKQjJmqKyIKTVAXvCDRS/tVJmzOBGohke1NkWX+z4=";
    };
    main = pkgs.fetchurl {
      url = "https://github.com/ObsidianToAnki/Obsidian_to_Anki/releases/download/3.6.0/main.js";
      hash = "sha256-3MpVnIABoEH/EaXe9Mb5CWlpUUJJ0ZONt47Gp+5Vv+8=";
    };
    styles = pkgs.fetchurl {
      url = "https://github.com/ObsidianToAnki/Obsidian_to_Anki/releases/download/3.6.0/styles.css";
      hash = "sha256-iv3uGArAQeYdLA0FPhyVOqR22VxjKiu+Yz6lfD7/LBM=";
    };

    installPhase = ''
      mkdir -p $out
      cp $manifest $out/manifest.json
      cp $main $out/main.js
      cp $styles $out/styles.css
    '';
  };
}
