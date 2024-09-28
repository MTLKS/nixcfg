{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.rofi;
in {
  options.modules.rofi  = { enable = mkEnableOption "rofi"; };
  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      theme = ./theme.rasi;
    };
  };
}
