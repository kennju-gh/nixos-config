{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.obs;
in
{
  options.my.home.obs = {
    enable = lib.mkEnableOption "OBS Studio";
  };

  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = [
        pkgs.obs-studio-plugins.obs-pipewire-audio-capture
        pkgs.obs-studio-plugins.obs-vaapi
        pkgs.obs-studio-plugins.obs-vkcapture
      ];
    };
  };
}
