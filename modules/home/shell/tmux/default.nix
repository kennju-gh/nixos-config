{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.tmux;
in
{
  options.my.home.tmux = {
    enable = lib.mkEnableOption "tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";
      clock24 = true;
      mouse = true;
      prefix = "C-a";
      escapeTime = 0;
      keyMode = "vi";

      extraConfig = ''
        set -ga terminal-overrides ",xterm-256color:Tc"
        set -g history-limit 10000
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

        set -s copy-command 'wl-copy'
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
      '';
    };
  };
}
