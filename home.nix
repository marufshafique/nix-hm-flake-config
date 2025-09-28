{ pkgs, ... }:

{
  imports = [
    ./modules/tmuxconf.nix
    ./modules/neovim.nix
    ./modules/helix.nix
    ./modules/hyprland
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # home.username = "marufs";
  # home.homeDirectory = "/home/marufs";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    xclip
    wl-clipboard

    lazygit
    neofetch
    tmux
    helix

    yazi
    fzf

    go
    nil
    stylua
    lua-language-server
    vue-language-server
    typescript

    fd
    ripgrep
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # };

  # home.sessionVariables = {
  # EDITOR = "emacs";
  # };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  # programs.git = {
  #   enable = true;
  #   userName = "shm-wtag";
  #   userEmail = "maruf.shafique@welldev.io";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
