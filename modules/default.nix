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
    ./obsidian
    ./pavucontrol
    ./polybar
    ./rofi
    ./thunar
    ./vesktop
    ./vscode
  ];
}
