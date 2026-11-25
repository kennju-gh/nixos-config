{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.wine;
in
{
  options.my.home.wine = {
    enable = lib.mkEnableOption "wine prefix";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      WINEPREFIX = "/.wine/default";
    };
  };
}
