{ config, lib, inputs, ... }:

{
  imports = [ ../modules/default.nix ];
  config.modules = {
    alacritty.enable = true;
    firefox.enable = true;
    fish.enable = true;
    git.enable = true;
    i3.enable = true;
    libreoffice.enable = true;
    minecraft.enable = true;
    polybar.enable = true;
    rofi.enable = true;
    vesktop.enable = true;
    vscode.enable = true;
  };
}
