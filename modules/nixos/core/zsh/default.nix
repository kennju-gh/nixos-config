{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.zsh;
in
{
  options.my.system.zsh = {
    enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
