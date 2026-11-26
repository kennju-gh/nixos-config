{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.niri;

  hostConfig =
    {
      desktop = ./configs/desktop.kdl;
      laptop = ./configs/laptop.kdl;
      console = ./configs/console.kdl;
    }
    .${cfg.profile} or null;
in
{
  options.my.home.niri = {
    enable = lib.mkEnableOption "niri";

    profile = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "desktop"
          "laptop"
          "console"
        ]
      );
      default = null;
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".source = ./configs/config.kdl;

    xdg.configFile."niri/host.kdl" = lib.mkIf (hostConfig != null) {
      source = hostConfig;
    };
  };
}
