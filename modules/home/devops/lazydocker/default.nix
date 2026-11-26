{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.lazydocker;
in
{
  options.my.home.lazydocker = {
    enable = lib.mkEnableOption "lazydocker";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.lazydocker
    ];
  };
}
