{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.vesktop;
in {
  options.modules.vesktop = { enable = mkEnableOption "vesktop"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
