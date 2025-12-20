{ ... }:
{
  programs.ghostty = {
		enable = true;
    enableZshIntegration = true;
    settings = {
      font-size = 16;
      shell-integration = "zsh";
			window-decoration = "none";
			window-theme = "dark";
    };
  };
}
