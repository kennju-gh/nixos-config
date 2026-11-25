{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.system.carla-yabridge;
in
{
  options.my.system.carla-yabridge = {
    enable = mkEnableOption "Carla and Yabridge";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.carla
      pkgs.yabridge
      pkgs.yabridgectl
    ];
  };
}
