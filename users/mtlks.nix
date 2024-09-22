{ config, lib, inputs, ... }:

{
    imports = [ ../modules/default.nix ];
    config.modules = {
        i3.enable = true;
        alacritty.enable = true;
        firefox.enable = true;
        git.enable = true;
    };
}
