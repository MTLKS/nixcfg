{ config, lib, inputs, ... }:

{
    imports = [ ../modules/default.nix ];
    config.modules = {
        fish.enable = true;
        git.enable = true;
    };
}
