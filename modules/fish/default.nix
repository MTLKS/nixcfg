{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.fish;
in {
  options.modules.fish= { enable = mkEnableOption "fish"; };
  config = mkIf cfg.enable {
    programs.eza.enable = true;
    programs.fish = {
      enable = true;

      functions = {
        ls = {
          body = "eza --icons always $argv";
        };

        ns = {
          body = "nix-shell --command fish $argv";
        };

        nrs = {
          body = "sudo nixos-rebuild switch --flake .#$argv";
        };

        nrt = {
          body = "sudo nixos-rebuild test --flake .#$argv";
        };

        fish_greeting = {
          body = "";
        };
      };
    };
  };
}
