{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.fzf;
in
{
  options.my.home.fzf = {
    enable = lib.mkEnableOption "fzf";
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;

      defaultCommand = "fd --type f --hidden --exclude .git";

      fileWidget = {
        command = "fd --type f --hidden --exclude .git";
      };

      defaultOptions = [
        "--height=60%"
        "--layout=reverse"
        "--border=rounded"
      ];
    };
  };
}
