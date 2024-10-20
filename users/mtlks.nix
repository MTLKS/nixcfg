{ config, lib, inputs, ... }:

{
    imports = [ ../modules/default.nix ];
    config.modules = {
        i3.enable = true;
        alacritty.enable = true;
        firefox.enable = true;
        fish.enable = true;
        git.enable = true;
        libreoffice.enable = true;
        rofi.enable = true;
        vscode.enable = true;
    };
}
