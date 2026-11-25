{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.qalculate-gtk;
in
{
  options.my.home.qalculate-gtk = {
    enable = lib.mkEnableOption "qalculate-gtk";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qalculate-gtk
    ];
  };
}
