{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.wine;
in
{
  options.my.system.wine = {
    enable = lib.mkEnableOption "wine";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.wineWow64Packages.stable
      pkgs.winetricks
    ];
  };
}
