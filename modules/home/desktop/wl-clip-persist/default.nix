{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.wl-clip-persist;
in
{
  options.my.home.wl-clip-persist = {
    enable = lib.mkEnableOption "wl-clip-persist";
  };

  config = lib.mkIf cfg.enable {
    services.wl-clip-persist = {
      enable = true;
      clipboardType = "regular";
    };
  };
}
