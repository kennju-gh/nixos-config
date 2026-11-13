{ config, lib, ... }:
with lib;
let
  cfg = config.my.system.wireplumber.disableHdmiDp;
in
{
  options.my.system.wireplumber.disableHdmiDp = {
    enable = mkEnableOption "disable HDMI/DisplayPort audio devices via WirePlumber";

    devices = mkOption {
      type = types.listOf types.str;
      default = [ "alsa_card.pci-0000_03_00.1" ];
    };
  };

  config = mkIf cfg.enable {
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
