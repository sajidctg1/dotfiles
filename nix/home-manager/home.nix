{ config, pkgs, ... }:

{
  home.username = "sajid";
  home.homeDirectory = "/home/sajid";
  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  # fonts.fontconfig.enable = lib.mkForce true;

  home.packages = with pkgs; [
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.sauce-code-pro
    nerd-fonts.symbols-only

    # packages
    bat
    btop
    commitizen
    delta
    eza
    fd
    fzf
    gh
    # gh-dash
    glow
    gum
    lazygit
    luarocks
    neovim
    ripgrep
    # sesh
    stow
    # sxiv
    tealdeer
    tmux
    tmuxp
    yazi
    # zathura
    zoxide
  ];

  home.file = {
    # ".test" = {
    #   source = config.lib.file.mkOutOfStoreSymlink ..config/nivm
    # };
    # ".config/alacritty".source = ~/dotfiles/.config/alacritty;
    # ".config/nvim".source = ~/dotfiles/.config/nvim;
    # ".config/sesh".source = ~/dotfiles/.config/sesh;
    # ".config/tmux".source = ~/dotfiles/.config/tmux;
    # ".config/shell".source = ~/dotfiles/.config/shell;
    # ".zprofile".source = ~/dotfiles/.config/zsh/.zprofile;
    # ".config/zsh/.zshrc".source = ~/dotfiles/.config/zsh/.zshrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sajid/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
