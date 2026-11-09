{ pkgs, ... }:
{
  environment.etc = {
    "zapret/list-google.txt".source = ./configs/list-google.txt;
    "zapret/list-general.txt".source = ./configs/list-general.txt;
  };

  services.zapret = {
    enable = true;
    package = pkgs.zapret;

    params = [
      # YouTube QUIC (UDP 443)
      "--filter-udp=443"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=${pkgs.zapret}/usr/share/zapret/files/fake/quic_initial_www_google_com.bin"
      "--new"

      # Discord UDP
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-fake-discord=${pkgs.zapret}/usr/share/zapret/files/fake/ACTIVE_DISCORD_UDP.bin"
      "--dpi-desync-fake-stun=${pkgs.zapret}/usr/share/zapret/files/fake/ACTIVE_DISCORD_UDP.bin"
      "--dpi-desync-repeats=6"
      "--new"

      # Discord Media (TCP)
      "--filter-tcp=2053,2083,2087,2096,8443"
      "--hostlist-domains=discord.media"
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fooling=ts"
      "--new"

      # Google TCP 443 (multisplit)
      "--filter-tcp=443"
      "--hostlist=/etc/zapret/list-google.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=6"
      "--dpi-desync-split-seqovl-pattern=${pkgs.zapret}/usr/share/zapret/files/fake/tls_clienthello_www_google_com.bin"
      "--new"

      # Any TCP 80/443
      "--filter-tcp=80,443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=3"
      "--dpi-desync-split-seqovl-pattern=${pkgs.zapret}/usr/share/zapret/files/fake/tls_clienthello_www_google_com.bin"
      "--new"
    ];
  };
}
