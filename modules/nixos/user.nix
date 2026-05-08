{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    extraOptions = "--iptables=false";
  };

  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marufs = {
    isNormalUser = true;
    description = "Maruf Shafique";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
			"video"
			"input"
      "docker"
      "docker-compose"
			"i2c"
    ];
    packages = with pkgs; [
      docker
      docker-compose
    ];
  };
}
