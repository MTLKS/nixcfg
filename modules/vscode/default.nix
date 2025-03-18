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
          "workbench.colorTheme" = "Default Dark+";
          "workbench.colorCustomizations" = {
            "activityBar.background" = "#100F0F";
            "activityBar.border" = "#100F0F";
            "activityBarBadge.background" = "#205EA6";
            "editor.background" = "#100F0F";
            "editor.findMatchBackground" = "#CB612066";
            "editor.findMatchHighlightBackground" = "#CB612066";
            "editor.foreground" = "#CECDC3";
            "editor.inactiveSelectionBackground" = "#403E3CEE";
            "editor.selectionBackground" = "#205EA6EE";
            "editor.selectionHighlightBackground" = "#B7B5AC26";
            "editorGroup.border" = "#282726";
            "editorGroup.dropBackground" = "#100F0FEE";
            "editorGroup.emptyBackground" = "#100F0F";
            "editorGroupHeader.noTabsBackground" = "#100F0F";
            "editorGroupHeader.tabsBackground" = "#100F0F";
            "editorGroupHeader.tabsBorder" = "#100F0F";
            "editorIndentGuide.activeBackground1" = "#403E3C";
            "editorIndentGuide.background1" = "#100F0F";
            "editorRuler.foreground" = "#1C1B1A";
            "editorWhitespace.foreground" = "#343331";
            "panel.background" = "#100F0F";
            "scrollbarSlider.activeBackground" = "#FFFCF033";
            "scrollbarSlider.background" = "#FFFCF011";
            "scrollbarSlider.hoverBackground" = "#FFFCF022";
            "sideBar.background" = "#100F0F";
            "sideBar.border" = "#282726";
            "sideBar.foreground" = "#CECDC3";
            "sideBarSectionHeader.background" = "#100F0F";
            "sideBarTitle.foreground" = "#CECDC3";
            "statusBar.background" = "#100F0F";
            "statusBar.foreground" = "#CECDC3";
            "statusBar.noFolderBackground" = "#100F0F";
            "statusBarItem.remoteBackground" = "#205EA6";
            "tab.activeBackground" = "#100F0F";
            "tab.activeBorder" = "#CECDC3";
            "tab.activeBorderTop" = "#100F0F";
            "tab.activeForeground" = "#CECDC3";
            "tab.border" = "#100F0F";
            "tab.inactiveBackground" = "#100F0F";
            "tab.inactiveForeground" = "#878580";
            "tab.selectedBorderTop" = "#100F0F";
            "tab.unfocusedActiveBorder" = "#100F0F";
            "tab.unfocusedActiveBorderTop" = "#100F0F";
            "tab.unfocusedActiveForeground" = "#CECDC3";
            "tab.unfocusedInactiveForeground" = "#878580";
            "terminal.background" = "#100F0F";
            "terminal.border" = "#282726";
            "titleBar.activeBackground" = "#100F0F";
            "titleBar.activeForeground" = "#CECDC3";
            "titleBar.border" = "#100F0F";
            "titleBar.inactiveBackground" = "#100F0F";
            "titleBar.inactiveForeground" = "#CECDC3";
          };
        };
      };
    };
  };
}
