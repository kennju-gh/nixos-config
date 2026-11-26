{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.mesa-demos;
in
{
  options.my.home.mesa-demos = {
    enable = lib.mkEnableOption "mesa-demos";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mesa-demos
    ];
  };
}
