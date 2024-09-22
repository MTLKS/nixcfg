{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "23.11";

    imports = [
        ./i3
        ./firefox
        ./git
    ];
}
