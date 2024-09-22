{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.alacritty;
in {
  options.modules.alacritty = { enable = mkEnableOption "alacritty"; };
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        shell.program = "fish";

        window = {
          opacity = 0.9;
          padding = {
            x = 10;
            y = 10;
          };
        };

        font = {
          size = 12;
          normal = {
            family = "Commit Mono Nerdfont";
            style = "Regular";
          };
        };

        mouse.hide_when_typing = true;

        keyboard.bindings = [
          {
            key = "Return";
            mods = "Control|Shift";
            action = "SpawnNewInstance";
          }
        ];

        colors = {
          primary = {
            background = "#0c0e0f";
            foreground = "#edeff0";
          };

          normal = {
            black   = "#232526";
            red     = "#df5b61";
            green   = "#78b892";
            yellow  = "#de8f78";
            blue    = "#6791c9";
            magenta = "#bc83e3";
            cyan    = "#67afc1";
            white   = "#e4e6e7";
          };

          bright = {
            black   = "#2c2e2f";
            red     = "#e8646a";
            green   = "#81c19b";
            yellow  = "#e79881";
            blue    = "#709ad2";
            magenta = "#bc83e3";
            cyan    = "#70b8ca";
            white   = "#f2f4f5";
          };
        };
      };
    };
  };
}
