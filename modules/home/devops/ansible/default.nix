{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.ansible;
in
{
  options.my.home.ansible = {
    enable = lib.mkEnableOption "ansible";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.ansible
      pkgs.ansible-lint
    ];
  };
}
