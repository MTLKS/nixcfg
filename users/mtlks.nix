{ config, lib, inputs, ... }:

{
    imports = [ ../modules/default.nix ];
    config.modules = {
        git.enable = true;
        i3.enable = true;
    };
}
