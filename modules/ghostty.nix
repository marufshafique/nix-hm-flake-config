{ ... }:
{
  programs.ghostty = {
    enableZshIntegration = true;
    settings = {
      font-size = 18;
      # shell-integration = "zsh";
    };
  };
}
