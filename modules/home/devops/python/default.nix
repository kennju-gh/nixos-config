{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.python;
in
{
  options.my.home.python = {
    enable = lib.mkEnableOption "python";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.python3
      pkgs.uv
    ];
  };
}
