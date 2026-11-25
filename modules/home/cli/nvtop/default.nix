{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.nvtop;
in
{
  options.my.home.nvtop = {
    enable = lib.mkEnableOption "nvtop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.nvtopPackages.amd
    ];
  };
}
