{ config, lib, ... }:
let
  cfg = config.my.home.foliate;
  inherit (lib.gvariant) mkUint32;
in
{
  options.my.home.foliate = {
    enable = lib.mkEnableOption "foliate";
  };

  config = lib.mkIf cfg.enable {
    programs.foliate.enable = true;

    dconf.settings = {
      "com/github/johnfactotum/Foliate" = {
        color-scheme = 4;
      };

      "com/github/johnfactotum/Foliate/viewer" = {
        fold-sidebar = true;
      };

      "com/github/johnfactotum/Foliate/viewer/font" = {
        default-size = mkUint32 24;
      };

      "com/github/johnfactotum/Foliate/viewer/view" = {
        animated = true;
        gap = 0.0;
        hyphenate = true;
        justify = true;
        line-height = 1.5;
        max-column-count = mkUint32 1;
        max-inline-size = mkUint32 1000;
        theme = "stylix.json";
      };

      "com/github/johnfactotum/Foliate/window" = {
        fullscreened = false;
      };
    };
  };
}
