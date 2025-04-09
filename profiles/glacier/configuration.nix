{ config, pkgs, inputs, ... }:

{
  networking.hostName = "glacier";

  time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ms_MY.UTF-8/UTF-8" ];

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

    displayManager.lightdm = {
    enable = true;
    greeters.mini = {
      enable = true;
      user = "mtlks";
      extraConfig = ''
      [greeter]
      show-password-label = false
      invalid-password-text = hello?
      password-alignment = center

      [greeter-theme]
      font = Commit Mono Nerd Font
      font-size = 14
      font-weight = bold
      text-color = #CECDC3
      error-color = #D14D41
      background-image =
      background-color = #282726
      window-color = #100F0F
      border-color = #E6E4D9
      border-width = 2px
      layout-space = 15
      password-color = #CECDC3
      password-background-color = #1C1B1A
      password-border-width = 0px
      '';
    };
    };
    videoDrivers = ["nvidia"];
    windowManager.i3.enable = true;
    xkb.options = "caps:escape";
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };

  virtualisation.docker.enable = true;
}
