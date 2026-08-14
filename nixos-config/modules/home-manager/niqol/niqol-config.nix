{ inputs, ... }:

{
  imports = [
    inputs.niqol.homeManagerModules.default
  ];

  services.niqol = {
    enable = false;
    package = inputs.niqol.packages.x86_64-linux.default;
  };
}
