{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.my.system.tailscale;
in
{
  options.my.system.tailscale = {
    enable = lib.mkEnableOption "Tailscale VPN";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };

    systemd.services.tailscaled.wantedBy = lib.mkForce [ ];

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
