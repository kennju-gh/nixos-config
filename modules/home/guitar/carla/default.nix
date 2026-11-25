{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.carla;
in
{
  options.my.home.carla = {
    enable = lib.mkEnableOption "carla";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.symlinkJoin {
        name = "carla-wrapped";
        paths = [ pkgs.carla ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/carla \
            --set QT_QPA_PLATFORMTHEME gtk3 \
            --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
        '';
      })
    ];
  };
}
