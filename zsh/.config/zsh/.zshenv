# TODO remove when error resolved
# resolve error: /home/sajid/.nix-profile/bin/manpath: can't set the locale; make sure $LC_* and $LANG are correct
# export LOCALE_ARCHIVE=$(nix-build '<nixpkgs>' -A glibcLocales)/lib/locale/locale-archive

# ------------------- load shell env if exists --------------------
[ -f "$HOME/.config/shell/env" ] && source "$HOME/.config/shell/env"

# -------------------- $HOME dir clean up --------------------
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
