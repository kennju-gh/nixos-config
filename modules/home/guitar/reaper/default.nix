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
    enable = mkEnableOption "REAPER DAW";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      reaper
    ];
  };
}
