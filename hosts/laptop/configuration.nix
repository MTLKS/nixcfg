{ config, pkgs, inputs, ... }:

{
  environment.defaultPackages = [];
  services.xserver.desktopManager.xterm.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  networking.networkmanager.enable = true;

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
  ];

  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  system.stateVersion = "23.11";
}
