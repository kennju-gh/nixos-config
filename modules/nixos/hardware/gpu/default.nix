{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.gpu;
in
{
  options.my.system.gpu = {
    enable = lib.mkEnableOption "gpu";

    overdrive = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable AMD GPU overdrive and LACT daemon";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.enableRedistributableFirmware = true;

    hardware.amdgpu.overdrive.enable = lib.mkIf cfg.overdrive true;

    environment.systemPackages = lib.mkIf cfg.overdrive [
      pkgs.lact
    ];

    systemd = lib.mkIf cfg.overdrive {
      packages = [
        pkgs.lact
      ];

      services.lactd = {
        wantedBy = [ "multi-user.target" ];
      };
    };
  };
}
