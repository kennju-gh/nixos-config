{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.rmpc;
in
{
  options.my.home.rmpc = {
    enable = lib.mkEnableOption "rmpc";
  };

  config = lib.mkIf cfg.enable {
    programs.rmpc.enable = true;
  };
}
