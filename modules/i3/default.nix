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
        startup = [
          { command = "autorandr --change"; }
        ];
      };
      extraConfig = ''
        client.focused          #e6e4d9 #e6e4d9 #100f0f #e6e4d9 #e6e4d9
        client.focused_inactive #343331 #343331 #cecdc3 #343331 #343331
        client.unfocused        #282726 #282726 #cecdc3 #282726 #282726
      '';
    };

    programs = {
      autorandr = {
        enable = true;
        profiles = {
          default = {
            config = {
              "HDMI-0" = {
                enable = true;
                mode = "3840x2160";
                rate = "120";
                position = "1080x0";
                primary = true;
              };
              "DP-1" = {
                enable = true;
                mode = "1920x1080";
                rate = "60";
                position = "0x240";
                rotate = "left";
              };
              "DP-3" = {
                enable = true;
                mode = "1920x1080";
                rate = "60";
                position = "4920x240";
                rotate = "right";
              };
            };
            fingerprint = {
              "HDMI-0" = "00ffffffffffff001c54043201010101011e0103804627783ae1b5ad5045a0250d5054bfcf00714f81c081408180d1c0d1fc9500b30008e80030f2705a80b0588a00b9882100001a565e00a0a0a0295030203500b9882100001a000000fd0030901eff86000a202020202020000000fc004769676162797465204d3332550262020361f2575d5e5f6061014003111213040e0f1d1e1f903f75762f2023090707830100006d030c001000383c2000600102036dd85dc40178c0330f3090c3340c6d1a0000020b3090e605653c653ce305c301e40f180018e6060501656512e200d56fc200a0a0a0555030203500b9882100001a00000000000000000000000004701279000003013c9a080284ff0e9f002f801f006f08990002000400c9ac0104ff0e9f002f801f006f087e0002000400fb7e00047f07870017801f003704110002800400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007c90";
              "DP-1" = "00ffffffffffff0005e301242d1500002f1e010380351e782a9105a3554fa1260e5054bfef00d1c0b30095008180814081c001010101023a801871382d40582c45000f282100001e2a4480a070382740302035000f282100001a000000fc003234423157310a202020202020000000fd00324c1e5311000a202020202020016102031ef14b101f051404130312021101230907078301000065030c0010008c0ad08a20e02d10103e96000f2821000018011d007251d01e206e2855000f282100001e8c0ad090204031200c4055000f2821000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e";
              "DP-3" = "00ffffffffffff0005e30124731400002f1e010380351e782a9105a3554fa1260e5054bfef00d1c0b30095008180814081c001010101023a801871382d40582c45000f282100001e2a4480a070382740302035000f282100001a000000fc003234423157310a202020202020000000fd00324c1e5311000a202020202020011c02031ef14b101f051404130312021101230907078301000065030c0010008c0ad08a20e02d10103e96000f2821000018011d007251d01e206e2855000f282100001e8c0ad090204031200c4055000f2821000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000004e";
            };
          };
        };
      };
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
