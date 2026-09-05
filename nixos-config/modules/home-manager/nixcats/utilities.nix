{ pkgs }:

{
  xeno = pkgs.vimUtils.buildVimPlugin {
    pname = "xeno.nvim";
    version = "1.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "kyzabuilds";
      repo = "xeno.nvim";
      rev = "4d41f04fa207e6516f5b8f545432ce7978529133";
      hash = "sha256-sgdZxiI+YnCpIqD7jCNSsAnLen6CBQQ4eo8X+pyYpps=";
    };

    patches = [
      ./custom-patches/xeno-duplicate-tag.patch
    ];
  };
}
