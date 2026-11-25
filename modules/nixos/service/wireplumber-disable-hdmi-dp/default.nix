{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.wireplumber-disable-hdmi-dp;
in
{
  options.my.system.wireplumber-disable-hdmi-dp = {
    enable = lib.mkEnableOption "wireplumber-disable-hdmi-dp";

    devices = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "alsa_card.pci-0000_03_00.1" ];
    };
  };

  config = lib.mkIf cfg.enable {
    services.pipewire.wireplumber.extraConfig."51-disable-hdmi-dp" = {
      "monitor.alsa.rules" = [
        {
          matches = map (name: { "device.name" = name; }) cfg.devices;
          actions = {
            "update-props" = {
              "device.disabled" = true;
            };
          };
        }
      ];
    };
  };
}
