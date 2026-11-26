{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.sops;
in
{
  options.my.system.sops = {
    enable = lib.mkEnableOption "sops";
  };

  config = lib.mkIf cfg.enable {
    sops = {
      age = {
        keyFile = "/var/lib/sops-nix/key.txt";
        sshKeyPaths = [ ];
      };

      gnupg.sshKeyPaths = [ ];

      defaultSopsFile = ../../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      validateSopsFiles = false;

      secrets = {
        "tg_ws_proxy_secret" = {
          owner = "root";
          mode = "0400";
        };
      };

      templates."tg-ws-proxy.env".content = ''
        TG_WS_PROXY_SECRET=${config.sops.placeholder."tg_ws_proxy_secret"}
      '';
    };

    environment.systemPackages = [
      pkgs.sops
      pkgs.age
      pkgs.ssh-to-age
    ];
  };
}
