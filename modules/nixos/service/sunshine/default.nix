{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.sunshine;
in
{
  options.my.system.sunshine = {
    enable = lib.mkEnableOption "Sunshine game streaming host";
  };

  config = lib.mkIf cfg.enable {
    services.sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
