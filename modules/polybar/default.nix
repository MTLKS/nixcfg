{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.polybar;
in {
  options.modules.polybar = { enable = mkEnableOption "polybar"; };
  config = mkIf cfg.enable {
    services = {
      polybar = {
        enable = true;
        package = pkgs.polybar;
        config = {
          "colors" = {
            "background" = "#100F0F";
            "background-alt" = "#1C1B1A";
            "foreground" = "#E6E4D9";
            "primary" = "#66A0C8";
            "secondary" = "#3AA99F";
            "alert" = "#D14D41";
            "disabled" = "#575653";
          };

          "bar/main" = {
            "width" = "100%";
            "height" = "28pt";
            "background" = "\${colors.background}";
            "foreground" = "\${colors.foreground}";
            "line-size" = "3pt";
            "padding-left" = "0";
            "padding-right" = "1";
            "module-margin" = "1";
            "separator" = "|";
            "separator-foreground" = "\${colors.disabled}";
            "font-0" = "CommitMono Nerd Font:size=14:style=Bold;2";
            "font-1" = "Source Han Mono:size=14:style=Bold;2";
            "cursor-click" = "pointer";
            "cursor-scroll" = "ns-resize";
            "enable-ipc" = "true";
          };

          "bar/bar1" = {
            "inherit" = "bar/main";
            "monitor" = "HDMI-0";
            "modules-left" = "xworkspaces";
            "modules-center" = "xwindow";
            "modules-right" = "filesystem alsa xkeyboard memory cpu wlan eth date";
          };

          "bar/bar2" = {
            "inherit" = "bar/main";
            "monitor" = "DP-1";
            "modules-left" = "xworkspaces";
            "modules-right" = "date";
          };

          "bar/bar3" = {
            "inherit" = "bar/main";
            "monitor" = "DP-3";
            "modules-left" = "xworkspaces";
            "modules-right" = "date";
          };

          "module/xworkspaces" = {
            "type" = "internal/xworkspaces";
            "pin-workspaces" = "true";
            "label-active" = "%name%";
            "label-active-background" = "\${colors.background-alt}";
            "label-active-underline" = "\${colors.primary}";
            "label-active-padding" = "1";
            "label-occupied" = "%name%";
            "label-occupied-padding" = "1";
            "label-urgent" = "%name%";
            "label-urgent-background" = "\${colors.alert}";
            "label-urgent-padding" = "1";
            "label-empty" = "%name%";
            "label-empty-foreground" = "\${colors.disabled}";
            "label-empty-padding" = "1";
          };

          "module/xwindow" = {
            "type" = "internal/xwindow";
            "label" = "%title:0:60:...%";
          };

          "module/filesystem" = {
            "type" = "internal/fs";
            "interval" = "25";
            "mount-0" = "/";
            "label-mounted" = "%{F#66A0C8}%mountpoint%%{F-} %percentage_used%%";
            "label-unmounted" = "%mountpoint% not mounted";
            "label-unmounted-foreground" = "\${colors.disabled}";
          };

          "module/alsa" = {
            "type" = "internal/alsa";
            "format-volume-prefix" = "VOL ";
            "format-volume-prefix-foreground" = "\${colors.primary}";
            "format-volume" = "<label-volume>";
            "label-volume" = "%percentage%%";
            "label-muted" = "%{F#66A0C8}VOL%{F-} %{F#575653}MUTED%{F-}";
          };

          "module/xkeyboard" = {
            "type" = "internal/xkeyboard";
            "blacklist-0" = "num lock";
            "label-layout" = "%layout%";
            "label-layout-foreground" = "\${colors.primary}";
            "label-indicator-padding" = "2";
            "label-indicator-margin" = "1";
            "label-indicator-foreground" = "\${colors.background}";
            "label-indicator-background" = "\${colors.secondary}";
          };

          "module/memory" = {
            "type" = "internal/memory";
            "interval" = "2";
            "format-prefix" = "RAM ";
            "format-prefix-foreground" = "\${colors.primary}";
            "label" = "%percentage_used:2%%";
          };

          "module/cpu" = {
            "type" = "internal/cpu";
            "interval" = "2";
            "format-prefix" = "CPU ";
            "format-prefix-foreground" = "\${colors.primary}";
            "label" = "%percentage:2%%";
          };

          "network-base" = {
            "type" = "internal/network";
            "interval" = "5";
            "format-connected" = "<label-connected>";
            "format-disconnected" = "<label-disconnected>";
            "label-disconnected" = "%{F#66A0C8}%ifname%%{F#707880} disconnected";
          };

          "module/wlan" = {
            "inherit" = "network-base";
            "interface-type" = "wireless";
            "label-connected" = "%{F#66A0C8}%ifname%%{F-} %essid% %local_ip%";
          };

          "module/eth" = {
            "inherit" = "network-base";
            "interface-type" = "wired";
            "label-connected" = "%{F#66A0C8}%ifname%%{F-} %local_ip%";
          };

          "module/date" = {
            "type" = "internal/date";
            "interval" = "1";
            "date" = "%Y-%m-%d ";
            "time" = "%H:%M:%S";
            "label" = "%{F#66A0C8}%date%%{F-} %time%";
          };

          "settings" = {
            "screenchange-reload" = "true";
            "pseudo-transparency" = "true";
          };
        };
        script = "polybar bar &";
      };
    };
  };
}
