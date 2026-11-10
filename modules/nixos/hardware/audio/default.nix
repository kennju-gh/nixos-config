{ lib, config, ... }:
with lib;
let
  cfg = config.my.system.audio;
in
{
  options.my.system.audio = {
    enable = mkEnableOption "PipeWire audio stack";

    quantum = mkOption {
      type = types.int;
      default = 256;
      description = "PipeWire quantum";
    };

    minQuantum = mkOption {
      type = types.int;
      default = 64;
      description = "Minimum PipeWire quantum";
    };

    maxQuantum = mkOption {
      type = types.int;
      default = 1024;
      description = "Maximum PipeWire quantum";
    };
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;

      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = cfg.quantum;
          "default.clock.min-quantum" = cfg.minQuantum;
          "default.clock.max-quantum" = cfg.maxQuantum;
        };
      };
    };

    security.pam.loginLimits = [
      {
        domain = "@audio";
        item = "memlock";
        type = "-";
        value = "unlimited";
      }
      {
        domain = "@audio";
        item = "rtprio";
        type = "-";
        value = "99";
      }
    ];

    security.rtkit.enable = true;
  };
}
