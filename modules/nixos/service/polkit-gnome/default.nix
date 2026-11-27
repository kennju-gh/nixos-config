{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.polkit-gnome;
in
{
  options.my.system.polkit-gnome = {
    enable = lib.mkEnableOption "polkit-gnome";
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
