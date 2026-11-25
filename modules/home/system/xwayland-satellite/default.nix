{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.xwayland-satellite;
in
{
  options.my.home.xwayland-satellite = {
    enable = lib.mkEnableOption "xwayland-satellite";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      xwayland-satellite
    ];
  };
}
