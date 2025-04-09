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
  };

  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "23.11";
}
