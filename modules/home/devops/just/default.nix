{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.just;
in
{
  options.my.home.just = {
    enable = lib.mkEnableOption "just";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.just
    ];
  };
}
