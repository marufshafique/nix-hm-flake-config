{ pkgs, ... }:

{
  imports = [
    ./modules
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

    dig
    lazygit
    neofetch
    tmux
    vim
    helix

		postman

    yazi
    fzf
    tree

    gcc
    nodejs
		bun
    go
    goose
    gopls
    nil
    nixd
    stylua
    lua-language-server
    vue-language-server
    typescript

		xwayland-satellite

    postgresql

    fd
    ripgrep
    firefox

		bibata-cursors
		adwaita-icon-theme

    bitwarden-desktop

    chromium
    google-chrome

    golangci-lint-langserver

    cloudflared
  ];

  programs.git = {
    enable = true;
    userName = "shm-wtag";
    userEmail = "maruf.shafique@welldev.io";
  };

  programs.zen-browser = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
