{ inputs, ... }:

{
  imports = [
    inputs.pi-flake.homeManagerModules.default
  ];
  programs.pi-coding-agent = {
    enable = true;

    agentFiles = {
      settings = {
        value = {
          theme = "dark";
          defaultProjectTrust = "ask";
        };
      };
    };
  };
}
