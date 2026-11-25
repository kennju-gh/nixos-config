{
  pkgs,
  ...
}:
{
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
}
