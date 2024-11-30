{ config, pkgs, inputs, ... }:

{
    environment.defaultPackages = [];
    services.xserver.desktopManager.xterm.enable = false;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader = {
        grub = {
            enable = true;
            device = "/dev/sda";
            useOSProber = true;
        };
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
        ntfs3g
    ];

    hardware.graphics.enable = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.open = true;

    system.stateVersion = "23.11";
}
