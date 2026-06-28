{ ... }:

{
  imports = [
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-s";
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -g base-index 1
      setw -g pane-base-index 1
    '';
  };
}
