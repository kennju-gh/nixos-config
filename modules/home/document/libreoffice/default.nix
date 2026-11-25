{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.libreoffice;
in
{
  options.my.home.libreoffice = {
    enable = lib.mkEnableOption "libreoffice-qt";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
    ];
  };
}
