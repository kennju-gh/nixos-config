{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.kernel;
in
{
  options.my.system.kernel = {
    enable = lib.mkEnableOption "kernel";

    packages = lib.mkOption {
      type = lib.types.raw;
      default = pkgs.linuxPackages_latest;
    };

    params = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };

    modules = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "msr"
        "ntsync"
      ];
    };

    initrdModules = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = cfg.packages;
    boot.kernelParams = cfg.params;
    boot.kernelModules = cfg.modules;
    boot.initrd.kernelModules = cfg.initrdModules;
  };
}
