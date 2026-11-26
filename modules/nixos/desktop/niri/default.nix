{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.niri;
in
{
  options.my.system.niri = {
    enable = lib.mkEnableOption "niri";
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
