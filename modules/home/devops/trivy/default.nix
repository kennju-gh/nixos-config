{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.trivy;
in
{
  options.my.home.trivy = {
    enable = lib.mkEnableOption "trivy";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.trivy
    ];
  };
}
