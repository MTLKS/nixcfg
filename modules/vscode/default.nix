{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.vscode;
in {
  options.modules.vscode  = { enable = mkEnableOption "vscode"; };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          github.copilot
          humao.rest-client
          viktorqvarfordt.vscode-pitch-black-theme
        ];
        userSettings = {
          "[nix]" = {
            "editor.tabSize" = 2;
          };
          "debug.console.fontFamily" = "'CommitMono Nerd Font', monospace";
          "editor.fontFamily" = "'CommitMono Nerd Font', monospace";
          "editor.fontWeight" = "bold";
          "editor.renderWhitespace" = "all";
          "terminal.integrated.defaultProfile.linux" = "fish";
          "terminal.integrated.fontFamily" = "'CommitMono Nerd Font', monospace";
          "terminal.integrated.fontWeightBold" = "bold";
          "window.titleBarStyle" = "custom";
          "workbench.colorTheme" = "Pitch Black";
          "workbench.colorCustomizations" = {
            "editorWhitespace.foreground" = "#4B5263";
            "sideBar.border" = "#222222";
          };
        };
      };
    };
  };
}
