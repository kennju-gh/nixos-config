{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.oomd;
in
{
  options.my.system.oomd = {
    enable = lib.mkEnableOption "oomd";
  };

  config = lib.mkIf cfg.enable {
    systemd.oomd = {
      enable = true;
      enableRootSlice = true;
      enableSystemSlice = true;
      enableUserSlices = true;
    };
  };
}
