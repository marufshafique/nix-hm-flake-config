{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    extraOptions = ''
      --ipv6 
      --fixed-cidr-v6="fd00:db8:1::/64"
      --experimental
      --ip6tables
      --dns="8.8.8.8"
      --dns="2001:4860:4860::8888"
    '';
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
