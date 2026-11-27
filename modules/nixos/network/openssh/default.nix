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

    passwordAuthentication = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Allow SSH authentication using passwords";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = [ cfg.port ];
      openFirewall = true;

      settings = {
        PasswordAuthentication = cfg.passwordAuthentication;
        KbdInteractiveAuthentication = cfg.passwordAuthentication;
        PermitRootLogin = "no";
        MaxAuthTries = 3;
      };
    };
  };
}
