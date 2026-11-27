{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.power;
in
{
  options.my.system.power = {
    enable = lib.mkEnableOption "power";
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
