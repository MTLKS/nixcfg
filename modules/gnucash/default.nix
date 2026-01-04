{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.gnucash;
in {
  options.modules.gnucash = { enable = mkEnableOption "gnucash"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnucash
    ];
  };
}
