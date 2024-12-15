{ config, pkgs, inputs, ... }:

{
    networking.hostName = "permafrost";
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 22 ];
    };

    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.mtlks = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        home = "/home/mtlks";
    };

    services.openssh.enable = true;

    nixpkgs.config.allowUnfree = true;
}
