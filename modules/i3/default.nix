{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.i3;
  mod = "Mod4";
  menu = "rofi -show-icons -show drun";
  terminal = "alacritty";
in {
  options.modules.i3 = { enable = mkEnableOption "i3"; };
  config = mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;
        terminal = terminal;
        menu = menu;
        window = {
          border = 2;
          titlebar = false;
        };
        gaps = {
          inner = 10;
          outer = 5;
        };
        keybindings = {
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+Escape" = "kill";
          "${mod}+space" = "exec ${menu}";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+f" = "fullscreen toggle";
          "${mod}+q" = "floating toggle";
          "${mod}+a" = "focus parent";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";

          "${mod}+Shift+c" = "reload";
          "${mod}+r" = "mode resize";

          "Print" = "exec --no-startup-id maim --select | xclip -selection clipboard -t image/png";
        };
      };
      extraConfig = ''
        client.focused          #e6e4d9 #e6e4d9 #100f0f #e6e4d9 #e6e4d9
        client.focused_inactive #343331 #343331 #cecdc3 #343331 #343331
        client.unfocused        #282726 #282726 #cecdc3 #282726 #282726
      '';
    };

    services = {
      picom.enable = true;
    };

    home.packages = with pkgs; [
      maim
      xclip
    ];
  };
}
