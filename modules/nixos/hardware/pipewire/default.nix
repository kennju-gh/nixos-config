{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.pipewire;
in
{
  options.my.system.pipewire = {
    enable = lib.mkEnableOption "PipeWire audio stack";

    minQuantum = lib.mkOption {
      type = lib.types.int;
      default = 256;
      description = "Minimum PipeWire quantum";
    };

    maxQuantum = lib.mkOption {
      type = lib.types.int;
      default = 2048;
      description = "Maximum PipeWire quantum";
    };
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;

      extraConfig.pipewire."92-pipewire-properties" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
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
