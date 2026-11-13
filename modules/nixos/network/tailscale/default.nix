{ config, lib, ... }:
with lib;
let
  cfg = config.my.system.tailscale;
in
{
  options.my.system.tailscale = {
    enable = mkEnableOption "Tailscale VPN";
  };

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };

    systemd.services.tailscaled.wantedBy = mkForce [ ];
  };
}
