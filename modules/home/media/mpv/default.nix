{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.mpv;
in
{
  options.my.home.mpv = {
    enable = lib.mkEnableOption "mpv";
  };

  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;

      scripts = [
        pkgs.mpvScripts.mpris
      ];

      config = {
        hwdec = "vaapi";
        vo = "gpu-next";
        gpu-context = "waylandvk";
        gpu-api = "vulkan";
        loop-file = "inf";
        profile = "high-quality";
        save-position-on-quit = true;
        keep-open = true;
        force-window = true;
      };
    };
  };
}
