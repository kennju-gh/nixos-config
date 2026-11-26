{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.qbittorrent;
in
{
  options.my.home.qbittorrent = {
    enable = lib.mkEnableOption "qbittorrent";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.qbittorrent
    ];
  };
}
