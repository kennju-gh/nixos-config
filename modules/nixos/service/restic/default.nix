{
  username,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.restic;
in
{
  options.my.system.restic = {
    enable = lib.mkEnableOption "restic";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.restic
    ];

    systemd.services.create-restic-dir = {
      unitConfig = {
        RequiresMountsFor = [ "/mnt/DATA" ];
        ConditionPathIsMountPoint = "/mnt/DATA";
      };
      after = [ "mnt-DATA.mount" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        mkdir -p /mnt/DATA/Backup/IDDQD
        mkdir -p /mnt/DATA/Backup/IDKFA
        chown root:root /mnt/DATA/Backup/IDDQD /mnt/DATA/Backup/IDKFA
        chmod 0700 /mnt/DATA/Backup/IDDQD /mnt/DATA/Backup/IDKFA
      '';
    };

    systemd.services.restic-backups-obsidian = {
      unitConfig.ConditionPathIsMountPoint = "/mnt/DATA";
      after = [ "create-restic-dir.service" ];
      wants = [ "create-restic-dir.service" ];
    };

    systemd.services.restic-backups-keepass = {
      unitConfig.ConditionPathIsMountPoint = "/mnt/DATA";
      after = [ "create-restic-dir.service" ];
      wants = [ "create-restic-dir.service" ];
    };

    services.restic.backups = {
      obsidian = {
        initialize = true;
        repository = "/mnt/DATA/Backup/IDDQD";
        passwordFile = "/home/${username}/.config/restic/password";

        paths = [
          "/home/${username}/Documents/IDDQD"
        ];

        exclude = [
          "/home/${username}/Documents/IDDQD/.git"
          "/home/${username}/Documents/IDDQD/.gitignore"
          "/home/${username}/Documents/IDDQD/.trash"
        ];

        checkOpts = [ "--read-data-subset=20%" ];

        timerConfig = {
          OnCalendar = "Sun *-*-* 12:00:00";
          Persistent = true;
          RandomizedDelaySec = "5m";
        };
      };

      keepass = {
        initialize = true;
        repository = "/mnt/DATA/Backup/IDKFA";
        passwordFile = "/home/${username}/.config/restic/password";

        paths = [
          "/home/${username}/Documents/IDKFA"
        ];

        checkOpts = [ "--read-data" ];

        timerConfig = {
          OnCalendar = "*-*-1,15 12:00:00";
          Persistent = true;
          RandomizedDelaySec = "5m";
        };
      };
    };
  };
}
