{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.rsync;
in
{
  options.my.home.rsync = {
    enable = lib.mkEnableOption "rsync";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rsync
    ];
  };
}
