{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.qt;
in
{
  options.my.home.qt = {
    enable = lib.mkEnableOption "qt";
  };

  config = lib.mkIf cfg.enable {
    qt.enable = true;

    stylix.targets.qt.standardDialogs = "xdgdesktopportal";
  };
}
