{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;

    ensureDatabases = [
      "dio"
    ];

    ensureUsers = [
      {
        name = "dio";
        ensureDBOwnership = true;
      }
    ];
  };
}
