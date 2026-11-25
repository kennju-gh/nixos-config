{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.libreoffice-qt;
in
{
  options.my.home.libreoffice-qt = {
    enable = lib.mkEnableOption "libreoffice-qt";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
    ];
  };
}
