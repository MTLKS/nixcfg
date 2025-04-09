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
            timeoutStyle = "hidden";
        };
        timeout = 1;
    };

    boot.kernelPackages = pkgs.linuxPackages_6_14;

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
