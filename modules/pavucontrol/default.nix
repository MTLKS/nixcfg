{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.pavucontrol;
in {
  options.modules.pavucontrol = { enable = mkEnableOption "pavucontrol"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      pavucontrol
    ];
  };
}
