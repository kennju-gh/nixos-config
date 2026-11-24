{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.fastfetch;
in
{
  options.my.home.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          source = "nixos";
          padding = {
            top = 2;
            left = 2;
            right = 4;
          };
        };

        display = {
          separator = "  ";
        };

        modules = [
          "title"
          "separator"
          "os"
          "uptime"
          "host"
          "kernel"
          "packages"
          "terminal"
          "terminalfont"
          "shell"
          "locale"
          "display"
          "wm"
          "theme"
          "icons"
          "cursor"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "break"
          "colors"
        ];
      };
    };
  };
}
