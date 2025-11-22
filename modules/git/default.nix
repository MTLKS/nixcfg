{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.git;
in {
  options.modules.git = { enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "MTLKS";
          email = "43807318+MTLKS@users.noreply.github.com";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
