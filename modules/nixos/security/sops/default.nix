{ pkgs, config, ... }:
{
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

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];
}
