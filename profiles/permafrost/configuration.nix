{ config, pkgs, inputs, ... }:

{
    networking.hostName = "permafrost";

    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.mtlks = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        home = "/home/mtlks";
    };

    nixpkgs.config.allowUnfree = true;
}
