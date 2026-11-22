{ config, ... }:
{
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
}
