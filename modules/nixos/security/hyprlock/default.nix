{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.hyprlock;
in
{
  options.my.system.hyprlock = {
    enable = lib.mkEnableOption "hyprlock";
  };

  config = lib.mkIf cfg.enable {
    security.pam.services.hyprlock = { };
  };
}
