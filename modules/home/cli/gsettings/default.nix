{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.gsettings;
in
{
  options.my.home.gsettings = {
    enable = lib.mkEnableOption "gsettings";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      glib
    ];
  };
}
