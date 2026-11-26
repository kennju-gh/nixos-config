{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.docker;
in
{
  options.my.system.docker = {
    enable = lib.mkEnableOption "docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "overlay2";
    };
  };
}
