{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.imv;
in
{
  options.my.home.imv = {
    enable = lib.mkEnableOption "imv";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.imv
    ];

    xdg.configFile."imv/config".text = ''
      [binds]
      <Delete> = exec trash "$imv_current_file"; next
    '';
  };
}
