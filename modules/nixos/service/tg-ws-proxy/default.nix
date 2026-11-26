{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.tg-ws-proxy;
in
{
  options.my.system.tg-ws-proxy = {
    enable = lib.mkEnableOption "tg-ws-proxy";
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = config.my.system.docker.enable;
        message = "tg-ws-proxy requires my.system.docker.enable = true";
      }
      {
        assertion = config.my.system.sops.enable;
        message = "tg-ws-proxy requires my.system.sops.enable = true";
      }
    ];

    virtualisation.oci-containers = {
      backend = "docker";
      containers.tg-ws-proxy = {
        image = "tg-ws-proxy:1.11.4";
        ports = [ "127.17.0.2:1443:1443" ];
        autoStart = true;
        environmentFiles = [
          config.sops.templates."tg-ws-proxy.env".path
        ];
      };
    };
  };
}
