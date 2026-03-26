{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.claude;
in {
  options.modules.claude = { enable = mkEnableOption "claude"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      claude-code
    ];
  };
}
