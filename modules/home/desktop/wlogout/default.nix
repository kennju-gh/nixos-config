{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.wlogout;
in
{
  options.my.home.wlogout = {
    enable = lib.mkEnableOption "wlogout";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.wlogout
    ];

    xdg.configFile = {
      "wlogout/layout".source = ./configs/layout;
      "wlogout/style.css".source = ./configs/style.css;
      "wlogout/assets" = {
        source = ./configs/assets;
        recursive = true;
      };
    };
  };
}
