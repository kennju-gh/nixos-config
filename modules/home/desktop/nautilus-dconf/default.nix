{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.nautilus-dconf;
in
{
  options.my.home.nautilus-dconf = {
    enable = lib.mkEnableOption "nautilus-dconf";
  };

  config = lib.mkIf cfg.enable {
    dconf.settings = {
      "org/gnome/desktop/privacy" = {
        remember-recent-files = false;
      };
    };
  };
}
