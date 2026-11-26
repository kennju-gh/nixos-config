{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.boot;
in
{
  options.my.system.boot = {
    enable = lib.mkEnableOption "boot";

    configurationLimit = lib.mkOption {
      type = lib.types.int;
      default = 5;
      description = "Maximum number of boot configurations to keep";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = cfg.configurationLimit;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
