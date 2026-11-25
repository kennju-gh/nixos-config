{
  username,
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.restic
  ];

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
}
