{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.openssh;
in
{
  options.my.system.openssh = {
    enable = lib.mkEnableOption "openssh";

    port = lib.mkOption {
      type = lib.types.port;
      default = 62419;
      description = "SSH listening port";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = [ cfg.port ];
      openFirewall = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        MaxAuthTries = 3;
      };
    };
  };
}
