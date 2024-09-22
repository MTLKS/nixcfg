{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "23.11";

    imports = [
        ./git
        ./i3
    ];
}

# Template

# { pkgs, lib, config, ... }:
#
# with lib;
# let
#   cfg = config.modules.<name>;
#
# in {
#   options.modules.<name> = { enable = mkEnableOption "<name>"; };
#   config = mkIf cfg.enable {
#
#   };
# }
