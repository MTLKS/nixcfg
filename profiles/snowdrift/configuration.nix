{ config, pkgs, inputs, ... }:

{
    networking.hostName = "snowdrift";

    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.mtlks = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        home = "/home/mtlks";
    };

    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [
        "CommitMono"
      ];})
      source-han-mono
    ];

    services.xserver = {
      enable = true;
      windowManager.i3.enable = true;
    };

    services.displayManager = {
      defaultSession = "none+i3";
    };
}
