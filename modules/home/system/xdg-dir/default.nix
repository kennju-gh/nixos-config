{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.xdg-dir;
in
{
  options.my.home.xdg-dir = {
    enable = lib.mkEnableOption "xdg.userDirs";
  };

  config = lib.mkIf cfg.enable {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;

      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      desktop = "$HOME/Desktop";
      publicShare = "$HOME/Public";
      templates = "$HOME/Templates";
    };
  };
}
