{ config, lib, ... }:
with lib;
let
  cfg = config.my.system.wireplumber.disableHdmiDp;
  matches = concatMapStringsSep "\n            " (name: ''{ device.name = "${name}"; }'') cfg.devices;
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
    environment.etc."wireplumber/wireplumber.conf.d/51-disable-hdmi-dp.conf".text = ''
      monitor.alsa.rules = [
        {
          matches = [
            ${matches}
          ];
          actions = {
            update-props = {
              device.disabled = true;
            };
          };
        }
      ]
    '';
  };
}
