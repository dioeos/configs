{ pkgs, ... }:

let
  wallpaperConfig = builtins.fromJSON (builtins.readFile ../../../../merle-config.json);
in
{
  home.packages = with pkgs; [
    awww
  ];

  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "Awww daemon systemd service for wallpaper functionality";
    };

    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.awww-wallpaper = {
    Unit = {
      Description = "Set startup wallpaper with awww";
      After = [ "awww-daemon.service" ];
      Requires = [ "awww-daemon.service" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
      ExecStart = "${pkgs.awww}/bin/awww img ${wallpaperConfig.wallpaper}";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

  };
}
