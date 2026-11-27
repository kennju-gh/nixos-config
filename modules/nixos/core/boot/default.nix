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

    plymouth = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Plymouth boot splash screen";
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = cfg.configurationLimit;
        };
        efi.canTouchEfiVariables = true;
      };

      consoleLogLevel = lib.mkIf cfg.plymouth 3;

      plymouth = lib.mkIf cfg.plymouth {
        enable = true;
      };

      kernelParams = lib.mkIf cfg.plymouth [
        "quiet"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
