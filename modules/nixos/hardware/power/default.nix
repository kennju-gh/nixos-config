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

    upower = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable UPower service for battery and wireless device charge reporting";
    };

    powerProfiles = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable power-profiles-daemon for CPU power profile switching";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      upower.enable = cfg.upower;
      power-profiles-daemon.enable = cfg.powerProfiles;
    };
  };
}
