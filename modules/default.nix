{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "23.11";

    imports = [
        ./i3
        ./alacritty
        ./firefox
        ./fish
        ./git
        ./rofi
    ];
}
