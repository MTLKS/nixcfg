{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.vscode;
in {
  options.modules.vscode  = { enable = mkEnableOption "vscode"; };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        github.copilot
        viktorqvarfordt.vscode-pitch-black-theme
      ];
      userSettings = {
        "[nix]" = {
          "editor.tabSize" = 2;
        };
        "editor.fontFamily" = "'CommitMono Nerd Font', monospace";
        "editor.renderWhitespace" = "all";
        "terminal.integrated.defaultProfile.linux" = "fish";
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Pitch Black";
        "workbench.colorCustomizations" = {
          "editorWhitespace.foreground" = "#4B5263";
          "sideBar.border" = "#222222";
        };
      };
    };
  };
}
