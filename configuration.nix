{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/nixos
  ];

	# Niri specific environment variables
	# Safe to revmove on other DE
	environment.variables.MOZ_ENABLE_WAYLAND = "1";
	environment.variables = {
		XCURSOR_THEME = "Adwaita";
		XCURSOR_SIZE = "24";
		GREENLIGHT_DB_DNS = "postgres://greenlight:4514@localhost/greenlight?sslmode=disable";
	};
	environment.systemPackages = with pkgs; [
		cacert
	];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

	services.udev.extraRules = ''
	  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666"
	'';

  services.displayManager.cosmic-greeter = {
    enable = false;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };

	services.postgresql.enable = true;

  programs.niri = {
    enable = true;
  };

  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    # enableClipboard = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  programs.dsearch = {
    enable = true;

    systemd = {
      enable = true;
    };
  };

  services.desktopManager.cosmic = {
    enable = false;
		xwayland.enable = true;
  };

  services.tailscale = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

	fonts.packages = with pkgs; [ 
		nerd-fonts.droid-sans-mono
	];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
