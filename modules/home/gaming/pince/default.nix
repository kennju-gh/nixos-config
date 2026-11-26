{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.pince;
in
{
  options.my.home.pince = {
    enable = lib.mkEnableOption "pince";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.pince
    ];
  };
}
