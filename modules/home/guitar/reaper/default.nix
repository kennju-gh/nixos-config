{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.home.reaper;
in
{
  options.my.home.reaper = {
    enable = mkEnableOption "reaper";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.reaper
    ];
  };
}
