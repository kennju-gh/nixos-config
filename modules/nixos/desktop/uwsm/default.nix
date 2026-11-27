{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.uwsm;
in
{
  options.my.system.uwsm = {
    enable = lib.mkEnableOption "uwsm";
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm = {
      enable = true;
      waylandCompositors.niri = {
        binPath = "/run/current-system/sw/bin/niri-session";
        prettyName = "Niri";
      };
    };
  };
}
