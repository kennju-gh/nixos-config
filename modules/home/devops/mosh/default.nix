{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.mosh;
in
{
  options.my.home.mosh = {
    enable = lib.mkEnableOption "mosh";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mosh
    ];
  };
}
