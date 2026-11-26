{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.swaybg;
in
{
  options.my.home.swaybg = {
    enable = lib.mkEnableOption "swaybg";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.swaybg
    ];

    systemd.user.services.swaybg = {
      Unit = {
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${./wallpaper/wallpaper.jpg}";
        Restart = "on-failure";
        RestartSec = 3;
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
