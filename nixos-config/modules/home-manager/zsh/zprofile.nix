{ ... }:

{
  programs.zsh.profileExtra = ''
    echo "Loading nix zprofile module... Merle welcomes you."

    if [ -f "$HOME/.local/share/swiftly/env.sh" ]; then
      source "$HOME/.local/share/swiftly/env.sh"
    fi

    if ! [[ "$PATH" =~ "$HOME/bin" ]]; then
      PATH="$HOME/bin:$PATH"
    fi

    if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
      PATH="$HOME/.local/bin:$PATH"
    fi

    export PATH

    if uwsm check may-start && uwsm select; then
      exec uwsm start default
    fi
  '';
}
