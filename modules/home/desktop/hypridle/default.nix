# Модуль
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.hypridle;
in
{
  options.my.home.hypridle = {
    enable = lib.mkEnableOption "hypridle";

    lockScreen = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable screen locking";
    };

    timeouts = {
      lock = lib.mkOption {
        type = lib.types.int;
        default = 180;
        description = "Seconds before locking the screen";
      };

      monitorOff = lib.mkOption {
        type = lib.types.int;
        default = 200;
        description = "Seconds before turning off monitors";
      };

      suspend = lib.mkOption {
        type = lib.types.int;
        default = 420;
        description = "Seconds before suspending the system";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = lib.mkIf cfg.lockScreen "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          before_sleep_cmd = lib.mkIf cfg.lockScreen "loginctl lock-session";
          after_sleep_cmd = "niri msg action power-on-monitors";
          ignore_dbus_inhibit = false;
          inhibit_sleep = 3;
        };

        listener = [
          (lib.mkIf cfg.lockScreen {
            timeout = cfg.timeouts.lock;
            on-timeout = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          })
          {
            timeout = cfg.timeouts.monitorOff;
            on-timeout = "niri msg action power-off-monitors";
            on-resume = "niri msg action power-on-monitors";
          }
          {
            timeout = cfg.timeouts.suspend;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
