{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.nautilus;
in
{
  options.my.system.nautilus = {
    enable = lib.mkEnableOption "nautilus";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.nautilus
      pkgs.nautilus-python
      pkgs.nautilus-open-any-terminal
      pkgs.file-roller
      pkgs.wsdd
    ];

    services.gnome.sushi.enable = true;
    services.gnome.tinysparql.enable = false;
    services.gnome.localsearch.enable = false;
    systemd.user.services.tracker-miner-fs-3.enable = false;
    systemd.user.services.tracker-extract-3.enable = false;

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };

    services.desktopManager.gnome.extraGSettingsOverridePackages = [
      pkgs.nautilus-open-any-terminal
    ];
  };
}
