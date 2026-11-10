{ pkgs, ... }:
{
  services.zapret = {
    enable = true;
    package = pkgs.zapret;

    whitelist = [
      "youtube.com"
      "googlevideo.com"
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

      # Google TCP 443 - split2
      "--filter-tcp=443"
      "--ip-id=zero"
      "--dpi-desync=split2"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-repeats=8"
      "--new"
    ];
  };
}
