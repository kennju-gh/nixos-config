{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f --hidden --exclude .git";
    fileWidget.Command = "fd --type f --hidden --exclude .git";

    defaultOptions = [
      "--height=60%"
      "--layout=reverse"
      "--border=rounded"
    ];
  };
}
