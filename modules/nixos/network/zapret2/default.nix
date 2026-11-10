{ pkgs, ... }:
{
  services.zapret2 = {
    enable = true;
    package = pkgs.zapret2;
    firewall.interfaces = [ "enp6s0" ];
    firewall.tcpPorts = [ 443 ];
    firewall.udpPorts = [ 443 ];

    profiles = {
      tls-bypass = {
        name = "tls-bypass";
        priority = 10;
        hosts.include = [
          "youtube.com"
          "googlevideo.com"
          "ytimg.com"
          "youtu.be"
          "discord.com"
          "discord.media"
          "twitch.tv"
        ];

        parameters = [
          "--filter-tcp=443"
          "--filter-l7=tls"
          "--payload=tls_client_hello"
          "--lua-desync=fake:blob=fake_default_tls:badsum:tcp_seq=-10000:repeats=6"
          "--lua-desync=multisplit:pos=1"
        ];
      };

      quic-bypass = {
        name = "quic-bypass";
        priority = 20;
        hosts.include = [
          "youtube.com"
          "googlevideo.com"
        ];
        parameters = [
          "--filter-udp=443"
          "--filter-l7=quic"
          "--payload=quic_initial"
          "--lua-desync=fake:blob=fake_default_quic:repeats=6"
        ];
      };
    };
  };
}
