{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.gh;
in
{
  options.my.home.gh = {
    enable = lib.mkEnableOption "gh";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.gh
    ];
  };
}
