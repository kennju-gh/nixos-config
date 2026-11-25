{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.wine-prefix;
in
{
  options.my.home.wine-prefix = {
    enable = lib.mkEnableOption "wine-prefix";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      WINEPREFIX = "/.wine/default";
    };
  };
}
