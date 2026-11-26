{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.zsh;
in
{
  options.my.home.zsh = {
    enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 10000;
        path = "$HOME/.zsh_history";
        ignoreDups = true;
        share = true;
      };
    };
  };
}
