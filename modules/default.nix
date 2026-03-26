{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./alacritty
    ./claude
    ./copilot
    ./direnv
    ./firefox
    ./fish
    ./git
    ./gnucash
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
