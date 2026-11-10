{ pkgs, ... }:
{
  environment.etc = {
    "zapret/list-general.txt".source = ./configs/list-general.txt;
  };

  services.zapret = {
    enable = true;
    package = pkgs.zapret;

    params = [
      # YouTube QUIC (UDP 443)
      "--filter-udp=443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=11"
      "--new"

      # Discord UDP
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--hostlist=/etc/zapret/list-general.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=8"
      "--new"

      # Google TCP 443 (multisplit)
      "--filter-tcp=443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      "--new"

      # Discord and Twitch TCP
      "--filter-tcp=80,443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      "--new"
    ];
  };
}
