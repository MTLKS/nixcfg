{ config, pkgs, inputs, ... }:

{
    networking.hostName = "glacier";

    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.mtlks = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" "docker" ];
        home = "/home/mtlks";
    };

    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
      nerd-fonts.commit-mono
      source-han-mono
    ];

    services.xserver = {
      enable = true;
      windowManager.i3.enable = true;
      videoDrivers = ["nvidia"];
    };

    services.displayManager = {
      defaultSession = "none+i3";
    };

    virtualisation.docker.enable = true;
}
