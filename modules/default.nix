{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./alacritty
    ./direnv
    ./firefox
    ./fish
    ./git
    ./i3
    ./libreoffice
    ./minecraft
    ./pavucontrol
    ./polybar
    ./rofi
    ./vesktop
    ./vscode
  ];
}
