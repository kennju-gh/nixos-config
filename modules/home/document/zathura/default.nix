{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.zathura;
in
{
  options.my.home.zathura = {
    enable = lib.mkEnableOption "zathura";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zathura
      zathuraPkgs.zathura_pdf_mupdf
    ];
  };
}
