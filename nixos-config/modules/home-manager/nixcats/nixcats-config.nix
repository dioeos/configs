{ inputs, ... }:

let
  utils = inputs.nixCats.utils;
in
{
  imports = [
    inputs.nixCats.homeModule
  ];

  config = {
    nixCats = {
      enable = true;

      packageNames = [ "myHomeModuleNvim" ];

      luaPath = ./nvim;

      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];

      categoryDefinitions.replace = { pkgs, ...}:
        let
          customColorschemes = import ./colorschemes.nix {
            inherit pkgs;
          };
        in
        {
          startupPlugins = {
            colorschemes = with pkgs.vimPlugins; [
              kanagawa-nvim
            ] ++ [
              customColorschemes.vesper
              customColorschemes.nvimgelion
            ];
          };
        };

      packageDefinitions.replace = {
        myHomeModuleNvim = { pkgs, ... }: {
          settings = {
            aliases = [ "vim" "nvim" ];
          };

          categories = {
            colorschemes = true;
          };
        };
      };
    };
  };
}
