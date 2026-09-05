{ inputs, ... }:

{
  imports = [
    inputs.niqol.homeManagerModules.default
  ];

  services.niqol = {
    enable = true;
    package = inputs.niqol.packages.x86_64-linux.default;

    # environment.RUST_LOG = "niqol_daemon=debug";
    environment.RUST_LOG = "niqol_niri=debug,niqol_core=debug,niqol_cli=debug,niqol_daemon=debug";
  };
}
