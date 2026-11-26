{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.mako;
in
{
  options.my.home.mako = {
    enable = lib.mkEnableOption "mako";
  };

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;

      settings = {
        actions = true;
        anchor = "top-right";
        default-timeout = 5000;
        width = 300;
        height = 200;
        margin = 10;
        padding = 8;
        border-size = 2;
        border-radius = 2;
        icons = true;
        markup = true;
        layer = "top";
        group-by = "app-name";
      };
    };
  };
}
