{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.system.wine;
in
{
  options.my.system.wine = {
    enable = mkEnableOption "wine";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.wineWow64Packages.stable
      pkgs.winetricks
    ];
  };
}
