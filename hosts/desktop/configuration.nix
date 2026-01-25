{ config, pkgs, inputs, ... }:

{
  environment.defaultPackages = [];
  services.xserver.desktopManager.xterm.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    timeout = 1;
  };

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    blueman.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    ntfs3g
  ];

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.open = true;
  };

  system.stateVersion = "23.11";
}
