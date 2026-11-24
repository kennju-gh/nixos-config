{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.firefox;
in
{
  options.my.home.firefox = {
    enable = lib.mkEnableOption "firefox-bin";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-bin;

      profiles.default = {
        id = 0;
        isDefault = true;
      };
    };

    stylix.targets.firefox = {
      profileNames = [ "default" ];
      firefoxGnomeTheme.enable = true;
    };
  };
}
