{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.coppwr;
in
{
  options.my.home.coppwr = {
    enable = lib.mkEnableOption "coppwr";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.coppwr
    ];
  };
}
