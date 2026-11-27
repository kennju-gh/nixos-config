{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.bluetooth;
in
{
  options.my.system.bluetooth = {
    enable = lib.mkEnableOption "bluetooth";

    fastConnectable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable FastConnectable mode";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
          FastConnectable = cfg.fastConnectable;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
