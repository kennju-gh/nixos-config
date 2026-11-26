{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.webcord;
in
{
  options.my.home.webcord = {
    enable = lib.mkEnableOption "webcord";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.webcord
    ];
  };
}
