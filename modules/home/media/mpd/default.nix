{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.mpd;
in
{
  options.my.home.mpd = {
    enable = lib.mkEnableOption "mpd";
  };

  config = lib.mkIf cfg.enable {
    services.mpd = {
      enable = true;

      musicDirectory = "${config.home.homeDirectory}/Music";
      playlistDirectory = "${config.home.homeDirectory}/Music/Playlist";

      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
        restore_paused "yes"
        auto_update "yes"
      '';
    };

    systemd.user.tmpfiles.rules = [
      "d ${config.home.homeDirectory}/Music 0755 - - -"
      "d ${config.home.homeDirectory}/Music/Playlist 0755 - - -"
    ];

    services.mpdris2-rs = {
      enable = true;
      notifications.enable = false;
    };
  };
}
