{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.gnucash;
in {
  options.modules.gnucash = { enable = mkEnableOption "gnucash"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnucash
    ];
    home.file.".local/share/applications/gnucash.desktop".text = ''
      [Desktop Entry]
      Name=GnuCash
      GenericName=Finance Management
      Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 gnucash
      Icon=gnucash-icon
      Type=Application
      Categories=Office;Finance;
    '';
  };
}
