{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sone
  ];
}
