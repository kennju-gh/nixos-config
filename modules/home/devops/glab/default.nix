{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.glab;
in
{
  options.my.home.glab = {
    enable = lib.mkEnableOption "glab";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.glab
    ];
  };
}
