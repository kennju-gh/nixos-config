{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.btop;
in
{
  options.my.home.btop = {
    enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;

      settings = {
        update_ms = 2000;
      };
    };
  };
}
