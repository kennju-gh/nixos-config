{ pkgs, ... }:
{
  environment.etc = {
    "zapret/bin".source = ./config/bin;
    "zapret/lists".source = ./config/lists;
  };

  services.zapret = {
    enable = true;
    package = pkgs.zapret;

    params = [
      # YouTube QUIC (UDP 443)
      "--filter-udp=443"
      "--hostlist=/etc/zapret/lists/list-general.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=/etc/zapret/bin/quic_initial_www_google_com.bin"
      "--new"

      # Discord UDP
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-fake-discord=/etc/zapret/bin/ACTIVE_DISCORD_UDP.bin"
      "--dpi-desync-fake-stun=/etc/zapret/bin/ACTIVE_DISCORD_UDP.bin"
      "--dpi-desync-repeats=6"
      "--new"

      # Google TCP 443 (hostfakesplit)
      "--filter-tcp=443"
      "--hostlist=/etc/zapret/lists/list-google.txt"
      "--ip-id=zero"
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-repeats=4"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-hostfakesplit-mod=host=www.google.com"
      "--new"

      # Discord Media (TCP)
      "--filter-tcp=2053,2083,2087,2096,8443"
      "--hostlist-domains=discord.media"
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-repeats=4"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-hostfakesplit-mod=host=www.google.com"
      "--new"

      # Other TCP
      "--filter-tcp=80,443"
      "--hostlist=/etc/zapret/lists/list-general.txt"
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-repeats=4"
      "--dpi-desync-fooling=ts,md5sig"
      "--dpi-desync-hostfakesplit-mod=host=ozon.ru"
      "--new"
    ];
  };
}
