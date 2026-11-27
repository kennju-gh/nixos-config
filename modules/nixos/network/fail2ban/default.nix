{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.fail2ban;
  sshPort = toString (lib.head (config.services.openssh.ports or [ 22 ]));
in
{
  options.my.system.fail2ban = {
    enable = lib.mkEnableOption "fail2ban";
  };

  config = lib.mkIf cfg.enable {
    services.fail2ban = {
      enable = true;

      ignoreIP = [
        "127.0.0.1"
        "10.0.0.0/8"
        "172.16.0.0/12"
        "192.168.0.0/16"
      ];

      jails.sshd.settings = {
        enabled = true;
        port = sshPort;
        backend = "systemd";
        maxretry = 5;
        findtime = "600";
      };

      bantime = "1h";
    };

    environment.shellAliases = {
      f2b-status = "sudo fail2ban-client status";
      f2b-status-ssh = "sudo fail2ban-client status sshd";
      f2b-banned = "sudo fail2ban-client get sshd banned";
      f2b-unban = "sudo fail2ban-client set sshd unbanip";
    };
  };
}
