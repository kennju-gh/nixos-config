{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.gtk;
in
{
  options.my.home.gtk = {
    enable = lib.mkEnableOption "gtk";
  };

  config = lib.mkIf cfg.enable {
    gtk.enable = true;
  };
}
