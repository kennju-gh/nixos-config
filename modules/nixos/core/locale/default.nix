{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.locale;
in
{
  options.my.system.locale = {
    enable = lib.mkEnableOption "locale";

    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Moscow";
      description = "System time zone";
    };

    defaultLocale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "Default system locale";
    };

    keyMap = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "Virtual console keymap";
    };
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = cfg.timeZone;

    i18n = {
      defaultLocale = cfg.defaultLocale;

      supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "ru_RU.UTF-8/UTF-8"
      ];
    };

    console = {
      keyMap = cfg.keyMap;
      earlySetup = true;
    };

    systemd.services.systemd-vconsole-setup.unitConfig.After = [ "local-fs.target" ];
  };
}
