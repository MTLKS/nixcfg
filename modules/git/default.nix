{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.git;

in {
  options.modules.git = { enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "MTLKS";
      userEmail = "43807318+MTLKS@users.noreply.github.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
