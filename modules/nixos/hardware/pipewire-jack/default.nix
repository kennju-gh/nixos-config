{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.pipewire-jack;
in
{
  options.my.system.pipewire-jack = {
    enable = lib.mkEnableOption "PipeWire-JACK low-latency configuration";

    quantum = lib.mkOption {
      type = lib.types.int;
      default = 256;
      description = "PipeWire-JACK quantum";
    };

    rate = lib.mkOption {
      type = lib.types.int;
      default = 48000;
      description = "PipeWire-JACK sample rate";
    };
  };

  config = lib.mkIf cfg.enable {
    services.pipewire.extraConfig.jack."92-pipewire-jack-properties" = {
      "jack.properties" = {
        "node.latency" = "${toString cfg.quantum}/${toString cfg.rate}";
      };
    };
  };
}
