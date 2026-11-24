{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.foliate;
in
{
  options.my.home.foliate = {
    enable = lib.mkEnableOption "Foliate";
  };

  config = lib.mkIf cfg.enable {
    programs.foliate = {
      enable = true;
      package = pkgs.foliate;

      settings = {
        # /
        "color-scheme" = 4;

        # Viewer
        "viewer/fold-sidebar" = true;

        # Viewer/Font
        "viewer/font/default-size" = 24;

        # Viewer/View
        "viewer/view/animated" = true;
        "viewer/view/gap" = 0.0;
        "viewer/view/hyphenate" = true;
        "viewer/view/justify" = true;
        "viewer/view/line-height" = 1.5;
        "viewer/view/max-column-count" = 1;
        "viewer/view/max-inline-size" = 1000;
        "viewer/view/theme" = "stylix.json";

        # Window
        "window/fullscreened" = false;
      };
    };
  };
}
