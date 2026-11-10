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
      "--hostlist=/etc/zapret/list-google.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=11"
      "--dpi-desync-fake-quic=${pkgs.zapret}/share/zapret/files/fake/quic_initial_www_google_com.bin"
      "--new"

      # Discord UDP
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--hostlist=/etc/zapret/list-general.txt"
      "--dpi-desync=fake"
      "--dpi-desync-fake-discord=${pkgs.zapret}/share/zapret/files/fake/discord-ip-discovery-with-port.bin"
      "--dpi-desync-fake-stun=${pkgs.zapret}/share/zapret/files/fake/stun.bin"
      "--dpi-desync-repeats=11"
      "--new"

      # Google TCP 443 (multisplit)
      "--filter-tcp=443"
      "--hostlist=/etc/zapret/list-google.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      "--dpi-desync-split-seqovl-pattern=${pkgs.zapret}/share/zapret/files/fake/tls_clienthello_www_google_com.bin"
      "--new"

      # Any TCP 80/443
      "--filter-tcp=80,443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      "--dpi-desync-split-seqovl-pattern=${pkgs.zapret}/share/zapret/files/fake/tls_clienthello_www_google_com.bin"
      "--new"
    ];
  };
}
