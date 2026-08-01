{ pkgs, ... }:

let
  wallpaperConfig = builtins.fromJSON (builtins.readFile ../../../../merle-config.json);

  startAwww = pkgs.writeShellScript "start-awww" ''
    set -eu

    systemctl --user import-environment \
      WAYLAND_DISPLAY \
      XDG_RUNTIME_DIR \
      XDG_CURRENT_DESKTOP \
      XDG_SESSION_TYPE \
      NIRI_SOCKET

    dbus-update-activation-environment --systemd \
      WAYLAND_DISPLAY \
      XDG_RUNTIME_DIR \
      XDG_CURRENT_DESKTOP \
      XDG_SESSION_TYPE \
      NIRI_SOCKET

    WAYLAND_SOCKET="$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY"

    until [ -S "$WAYLAND_SOCKET" ]; do
      sleep 0.1
    done

    systemctl --user reset-failed awww-daemon.service awww-wallpaper.service || true
    systemctl --user start awww-daemon.service
    sleep 1
    systemctl --user start awww-wallpaper.service
  '';
in
{
  home.packages = with pkgs; [
    awww
  ];

  home.file.".local/bin/start-awww".source = startAwww;

  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "Awww daemon systemd service for wallpaper functionality";
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
      RestartSec = 2;
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
      ExecStart = "${pkgs.awww}/bin/awww img ${wallpaperConfig.wallpaper}";
    };
  };
}
