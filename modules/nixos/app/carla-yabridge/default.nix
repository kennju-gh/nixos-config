{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.my.system.carla-yabridge;
in
{
  options.my.system.carla-yabridge = {
    enable = mkEnableOption "Carla and Yabridge";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yabridge
      yabridgectl

      (symlinkJoin {
        name = "carla-jack";
        paths = [
          carla
          (writeTextDir "share/applications/carla.desktop" ''
            [Desktop Entry]
            Name=Carla (JACK)
            Comment=Audio Plugin Host with PipeWire JACK support
            Exec=env LD_LIBRARY_PATH="${pipewire.jack}/lib" ${carla}/bin/carla %F
            Icon=carla
            Terminal=false
            Type=Application
            Categories=AudioVideo;Audio;
            MimeType=application/x-carla-project;
          '')
        ];
      })
    ];
  };
}
