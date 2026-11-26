{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.telegram-desktop;
in
{
  options.my.home.telegram-desktop = {
    enable = lib.mkEnableOption "telegram-desktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.telegram-desktop
    ];
  };
}
