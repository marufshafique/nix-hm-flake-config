{ pkgs, lib, ... }:

{
  imports = [
    # ./modules/nvf.nix
    # ./modules/tmuxconf.nix
    ./modules/neovim.nix
  ];

  home.username = "marufs";
  home.homeDirectory = "/Users/marufs";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    go

		nil
		stylua
		lua-language-server
		vue-language-server
		typescript

		fd
		ripgrep
		deno
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.zsh = {
    enable = true;
		initContent = ''
			unset TMUX
			export NVM_DIR="$HOME/.nvm"
				[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
				[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

			export EDITOR="hx"
			export VISUAL="hx"
			export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
			export PATH=$PATH:$(npm bin -g)
			export DPRINT_INSTALL="/Users/marufs/.dprint"
			export PATH="$DPRINT_INSTALL/bin:$PATH"

			# pnpm
			export PNPM_HOME="/Users/marufs/Library/pnpm"
			case ":$PATH:" in
				*":$PNPM_HOME:"*) ;;
				*) export PATH="$PNPM_HOME:$PATH" ;;
			esac
			# pnpm end

			[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env" 
		'';
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
