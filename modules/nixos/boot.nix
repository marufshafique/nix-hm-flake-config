{ ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = true;
    "net.ipv6.conf.default.forwarding" = true;

    "net.ipv6.conf.all.accept_ra" = 2;
    "net.ipv6.conf.default.accept_ra" = 2;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
