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
        terminal.shell.program = "fish";

        window = {
          padding = {
            x = 10;
            y = 10;
          };
        };

        font = {
          size = 10;
          normal = {
            family = "Commit Mono Nerdfont";
            style = "Bold";
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
            background = "#100F0F";
            foreground = "#E6E4D9";
          };

          normal = {
            black   = "#100F0F";
            red     = "#D14D41";
            green   = "#879A39";
            yellow  = "#D0A215";
            blue    = "#4385BE";
            magenta = "#CE5D97";
            cyan    = "#3AA99F";
            white   = "#CECDC3";
          };

          bright = {
            black   = "#282726";
            red     = "#E8705F";
            green   = "#A0AF54";
            yellow  = "#DFB431";
            blue    = "#66A0C8";
            magenta = "#E47DA8";
            cyan    = "#5ABDAC";
            white   = "#E6E4D9";
          };
        };
      };
    };
  };
}
