{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.yabridge;
in
{
  options.my.home.yabridge = {
    enable = lib.mkEnableOption "yabridge";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.yabridge
      pkgs.yabridgectl
    ];

    home.file.".local/share/yabridge/yabridge-host.exe".source =
      "${pkgs.yabridge}/bin/yabridge-host.exe";
  };
}
