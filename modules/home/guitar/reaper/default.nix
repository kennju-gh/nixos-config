{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.reaper;
in
{
  options.my.home.reaper = {
    enable = lib.mkEnableOption "reaper";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.reaper
    ];
  };
}
