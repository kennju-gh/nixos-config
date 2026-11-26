{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.codec;
in
{
  options.my.system.codec = {
    enable = lib.mkEnableOption "codec";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.ffmpeg-full
      pkgs.gst_all_1.gstreamer
      pkgs.gst_all_1.gst-plugins-base
      pkgs.gst_all_1.gst-plugins-good
      pkgs.gst_all_1.gst-plugins-bad
      pkgs.gst_all_1.gst-plugins-ugly
      pkgs.gst_all_1.gst-libav
      pkgs.libheif.bin
      pkgs.libheif.out
      pkgs.libva-utils
    ];
  };
}
