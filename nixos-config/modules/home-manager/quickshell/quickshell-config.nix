{ ... }:

{
  programs.quickshell = {
    enable = true;
    activeConfig = "main";

    configs = {
      main = ./main;
    };
  };
}
