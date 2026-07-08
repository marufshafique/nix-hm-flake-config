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
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    dig
    lazygit
    fastfetch
    tmux
    vim
    helix

    ddcutil

    postman

    yazi
    fzf
    tree

    gcc
    nodejs_latest
    yarn
    bun
    go
    goose
    gopls
    cobra-cli
    golangci-lint

    nil
    nixd
    nixfmt
    stylua
    lua-language-server

    # cargo
    # rustup
    # rust-analyzer

    prettier
    vue-language-server
    typescript
    typescript-language-server
    tailwindcss-language-server
    emmet-ls
    sqlite
    go-migrate
    gofumpt
    wlr-which-key

    steam

    tailscale

    vlc
    mpv

    file

    # cmake
    gnumake

    (kicad.override {
      with3d = true;
    })

    evince
    nautilus

    xwayland
    xwayland-satellite

    postgresql

    fd
    ripgrep
    firefox

    bibata-cursors
    adwaita-icon-theme

    chromium
    google-chrome

    golangci-lint-langserver

    cloudflared

    ollama-vulkan

    vscode-langservers-extracted
    eslint
    eslint_d

    discord
    devenv

    tree-sitter
    pi-coding-agent

    pavucontrol
    audacity
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "shm-wtag";
        email = "maruf.shafique@welldev.io";
      };
    };
  };

  programs.zen-browser = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
