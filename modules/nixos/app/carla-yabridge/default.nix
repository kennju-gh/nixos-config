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
      carla
      yabridge
      yabridgectl
    ];

    environment.etc."xdg/applications/carla.desktop".text = ''
      [Desktop Entry]
      Name=Carla
      Comment=Audio Plugin Host with PipeWire JACK support
      Exec=env LD_LIBRARY_PATH="${pkgs.pipewire.jack}/lib" ${pkgs.carla}/bin/carla %F
      Icon=carla
      Terminal=false
      Type=Application
      Categories=AudioVideo;Audio;
      MimeType=application/x-carla-project;
    '';
  };
}
