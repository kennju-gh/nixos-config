{ config, lib, ... }:
with lib;
let
  cfg = config.my.system.sunshine;
in
{
  options.my.system.sunshine = {
    enable = mkEnableOption "Sunshine game streaming host";
  };

  config = mkIf cfg.enable {
    services.sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
