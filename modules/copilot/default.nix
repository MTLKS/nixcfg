{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.copilot;
in {
  options.modules.copilot = { enable = mkEnableOption "copilot"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      github-copilot-cli
    ];
  };
}
