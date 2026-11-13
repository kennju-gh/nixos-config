{
  config,
  lib,
  username,
  ...
}:
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

    security.sudo.extraRules = [
      {
        users = [ username ];
        commands = [
          {
            command = "/run/current-system/sw/bin/systemctl start tailscaled";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/systemctl stop tailscaled";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
