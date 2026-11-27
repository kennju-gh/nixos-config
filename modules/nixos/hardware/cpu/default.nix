{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.cpu;
in
{
  options.my.system.cpu = {
    enable = lib.mkEnableOption "cpu";

    vendor = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "intel"
          "amd"
        ]
      );
      default = null;
      description = "CPU vendor for microcode updates";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.cpu.intel.updateMicrocode = lib.mkIf (cfg.vendor == "intel") true;
    hardware.cpu.amd.updateMicrocode = lib.mkIf (cfg.vendor == "amd") true;

    services.udev.extraRules = ''
      SUBSYSTEM=="powercap", ACTION=="add|change", KERNEL=="intel-rapl:*", RUN+="${pkgs.coreutils}/bin/chgrp wheel /sys/%p/energy_uj", RUN+="${pkgs.coreutils}/bin/chmod g+r /sys/%p/energy_uj"
    '';
  };
}
