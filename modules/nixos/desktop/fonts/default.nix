{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.fonts;
in
{
  options.my.system.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      packages = [
        pkgs.nerd-fonts.symbols-only
        pkgs.noto-fonts-color-emoji
        pkgs.liberation_ttf
        pkgs.dejavu_fonts
      ];

      fontconfig.useEmbeddedBitmaps = true;
      fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
    };
  };
}
