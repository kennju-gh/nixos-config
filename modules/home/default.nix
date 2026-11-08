{ ... }:
{
  imports = [
    # Backup
    ./backup/rsync

    # Browser
    ./browser/firefox

    # CLI
    ./cli/btop
    ./cli/diskwatch
    ./cli/fastfetch
    ./cli/neovim
    ./cli/yazi

    # Desktop
    ./desktop/fuzzel
    ./desktop/gtk
    ./desktop/hypridle
    ./desktop/hyprlock
    ./desktop/mako
    ./desktop/niri
    ./desktop/qt
    ./desktop/swaybg
    ./desktop/tomat
    ./desktop/waybar
    ./desktop/wl-clip-persist
    ./desktop/wlogout

    # Device
    ./device/ios

    # DevOps
    ./devops/ansible
    ./devops/gh
    ./devops/git
    ./devops/glab
    ./devops/go
    ./devops/json-yaml
    ./devops/just
    ./devops/kubernetes
    ./devops/lazydocker
    ./devops/lazygit
    ./devops/lint
    ./devops/mosh
    ./devops/python
    ./devops/terraform
    ./devops/trivy
    ./devops/vscode

    # Document
    ./document/calculator
    ./document/libreoffice
    ./document/obsidian
    ./document/zathura

    # Gaming
    ./gaming/mangohud
    ./gaming/mesa
    ./gaming/obs
    ./gaming/qbittorrent
    ./gaming/ryubing

    # Guitar
    ./guitar/reaper

    # Media
    ./media/coppwr
    ./media/foliate
    ./media/imv
    ./media/kid3
    ./media/mpd
    ./media/mpv
    ./media/rmpc

    # Messenger
    ./messenger/telegram
    ./messenger/webcord

    # Security
    ./security/gnupg
    ./security/keepassxc

    # Shell
    ./shell/direnv
    ./shell/fzf
    ./shell/kitty
    ./shell/starship
    ./shell/tmux
    ./shell/zoxide
    ./shell/zsh

    # System
    ./system/xdg-dirs
    ./system/xdg-mimes
    ./system/xwayland

    # Windows
    ./windows/wine
  ];
}
