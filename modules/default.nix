{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "23.11";

    imports = [
        ./alacritty
        ./firefox
        ./fish
        ./git
        ./i3
        ./libreoffice
        ./minecraft
        ./polybar
        ./rofi
        ./vesktop
        ./vscode
    ];
}
