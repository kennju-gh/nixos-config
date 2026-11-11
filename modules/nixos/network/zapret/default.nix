{ pkgs, ... }:
{
  services.zapret = {
    enable = true;
    package = pkgs.zapret;

    whitelist = [
      "youtube.com"
      "ytimg.com"
      "youtu.be"
      "twitch.tv"
      "discord.com"
      "discordapp.com"
      "discord.gg"
      "discord.media"
      "discordapp.net"
      "live-video.net"
      "ttvnw.net"
    ];

    params = [
      # YouTube QUIC / UDP 443
      "--filter-udp=443"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=11"
      "--new"

      # Discord UDP
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=8"
      "--new"

      # googlevideo
      "--filter-tcp=443"
      "--hostlist-domains=googlevideo.com"
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-repeats=4"
      "--dpi-desync-fooling=ts"
      "--new"

      # Google TCP 443
      "--filter-tcp=443"
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      "--new"
    ];
  };
}
