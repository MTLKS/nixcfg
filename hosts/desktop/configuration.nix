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

    networking.hostName = "glacier";
    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    users.users.mtlks = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        home = "/home/mtlks";
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git
        vim
    ];

    system.stateVersion = "23.11";
}
