{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.fuzzel;
in
{
  options.my.home.fuzzel = {
    enable = lib.mkEnableOption "fuzzel";
  };

  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          lines = 15;
          width = 25;
          prompt = "#>";
          terminal = "kitty -e";
          icons-enabled = false;
          dpi-aware = "auto";
        };

        border = {
          radius = 2;
          width = 2;
        };
      };
    };
  };
}
