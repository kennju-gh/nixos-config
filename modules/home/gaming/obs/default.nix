{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.home.obs;
in
{
  options.my.home.obs = {
    enable = mkEnableOption "OBS Studio";
  };

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vaapi
        obs-vkcapture
        wlrobs
        obs-wayland-hotkeys
      ];
    };
  };
}
