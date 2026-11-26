{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.kid3-qt;
in
{
  options.my.home.kid3-qt = {
    enable = lib.mkEnableOption "kid3-qt";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kid3-qt
    ];
  };
}
