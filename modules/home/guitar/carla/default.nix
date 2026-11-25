{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.carla;
in
{
  options.my.home.carla = {
    enable = lib.mkEnableOption "carla";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.carla
    ];
  };
}
