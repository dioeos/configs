{ pkgs }:

# sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=

{
  vesper = pkgs.vimUtils.buildVimPlugin {
    pname = "vesper.nvim";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "datsfilipe";
      repo = "vesper.nvim";
      rev = "1717b1ad657c94bec3fc2bdebb0c55452d9fe46d";
      hash = "sha256-Tx621yTfTu3dLctXKPaJy6rZn2YvWP8eFAJoVvEeR/c=";
    };

    nvimSkipModule = [
      "init"
    ];
  };

  ashen = pkgs.vimUtils.buildVimPlugin {
    pname = "ashen.nvim";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "ficd0";
      repo = "ashen.nvim";
      rev = "bfb04bd50b69d863469b2deb9fb361cf0d945ba7";
      hash = "sha256-yC9V58zieE8YvEuAnJhEOgONrudUJgQFqC59cKo97/g=";
    };
  };

  guts = pkgs.vimUtils.buildVimPlugin {
    pname = "guts.nvim";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "vossenwout";
      repo = "guts.nvim";
      rev = "a834d0f06a7439594f8ab76635dcaa9440b68aff";
      hash = "sha256-w2jeUgD7BFWusu2WRJQNbksjZddeTvLO69KDVfapzrY=";
    };
  };
}
