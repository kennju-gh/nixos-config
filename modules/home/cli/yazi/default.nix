{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.yazi;
in
{
  options.my.home.yazi = {
    enable = lib.mkEnableOption "yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        mgr = {
          ratio = [
            1
            3
            4
          ];
          linemode = "size";
          show_hidden = true;
          show_symlink = true;
          sort_by = "natural";
          sort_dir_first = true;
        };
      };

      plugins = {
        "full-border" = pkgs.yaziPlugins.full-border;
      };

      initLua = ''
        require("full-border"):setup()
      '';
    };
  };
}
