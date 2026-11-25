{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.ios;
in
{
  options.my.home.ios = {
    enable = lib.mkEnableOption "libimobiledevice and ifuse";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.libimobiledevice
      pkgs.ifuse
    ];
  };
}
