{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.i3;
  mod = "Mod4";
  menu = "rofi -show-icons -show drun";
in {
  options.modules.i3 = { enable = mkEnableOption "i3"; };
  config = mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;
        gaps = {
          inner = 10;
          outer = 5;
        };
        terminal = "alacritty";
        menu = menu;
        keybindings = lib.mkOptionDefault {
          "${mod}+space" = "exec ${menu}";
        };
      };
    };
    services.picom.enable = true;
  };
}
