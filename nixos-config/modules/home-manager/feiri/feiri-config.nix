{ inputs, ... }:

{
  imports = [
    inputs.feiri.homeManagerModules.default
  ];

  services.feiri = {
    enable = true;
    package = inputs.feiri.packages.x86_64-linux.daemon;

    ui = {
      enable = true;
      package = inputs.feiri.packages.x86_64-linux.ui;
    };

    environment.RUST_LOG = "feiri_daemon=trace,feiri=debug,feiri_ipc=debug,feiri_cli=debug";
  };
}
