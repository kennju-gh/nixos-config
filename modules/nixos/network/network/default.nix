{ lib, pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    useDHCP = lib.mkDefault true;
    firewall.checkReversePath = "loose";
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        "1.1.1.1#cloudflare-dns.com"
        "1.0.0.1#cloudflare-dns.com"
      ];
      FallbackDNS = [
        "9.9.9.9#dns.quad9.net"
        "149.112.112.112#dns.quad9.net"
      ];
      DNSSEC = "true";
      Domains = [ "~." ];
      DNSOverTLS = "true";
    };
  };

  programs.ssh = {
    startAgent = false;
    enableAskPassword = false;
    extraConfig = ''
      Host *
        ServerAliveInterval 60
        ServerAliveCountMax 3
        TCPKeepAlive yes
        ConnectTimeout 30
        AddKeysToAgent yes
    '';
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wireguard-tools
  ];

  environment.shellAliases = {
    sshtest = "ssh -o ConnectTimeout=5 -o BatchMode=yes";
  };

  environment.etc."ssl/cert.pem".source = "/etc/ssl/certs/ca-bundle.crt";
}
