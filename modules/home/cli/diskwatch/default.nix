{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.diskwatch;
in
{
  options.my.home.diskwatch = {
    enable = lib.mkEnableOption "diskwatch";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      diskwatch
    ];
  };
}
