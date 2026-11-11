{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = ./sequoia-monochrome-dark.yaml;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.fira-sans;
        name = "Fira Sans";
      };
      serif = {
        package = pkgs.fira-sans;
        name = "Fira Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        popups = 12;
      };
    };

    opacity = {
      terminal = 0.85;
      popups = 0.85;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = true;
  };

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <alias>
        <family>monospace</family>
        <accept><family>Symbols Nerd Font</family></accept>
      </alias>
      <alias>
        <family>sans-serif</family>
        <accept><family>Symbols Nerd Font</family></accept>
      </alias>
    </fontconfig>
  '';
}
