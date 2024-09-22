{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.MODULE_NAME;
in {
  options.modules.MODULE_NAME = { enable = mkEnableOption "MODULE_NAME"; };
  config = mkIf cfg.enable {

  };
}
