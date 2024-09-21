{ config, lib, inputs, ... }:

{
    imports = [ ../modules/default.nix ];
    config.modules = {
        git.enable = true;
    };
}