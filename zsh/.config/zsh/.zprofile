# ------------------- Load profile file if exists --------------------
[ -f "$HOME/.config/shell/profile" ] && source "$HOME/.config/shell/profile"

if [ -e /home/sajid/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sajid/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

