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
    ./cli/nvtop
    ./cli/yazi

    # Desktop
    ./desktop/fuzzel
    ./desktop/gtk
    ./desktop/hypridle
    ./desktop/hyprlock
    ./desktop/mako
    ./desktop/nautilus-dconf
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
    ./document/libreoffice-qt
    ./document/obsidian
    ./document/qalculate-gtk
    ./document/zathura

    # Gaming
    ./gaming/mangohud
    ./gaming/mesa-demos
    ./gaming/obs-studio
    ./gaming/pince
    ./gaming/qbittorrent

    # Guitar
    ./guitar/carla
    ./guitar/reaper
    ./guitar/yabridge

    # Media
    ./media/coppwr
    ./media/foliate
    ./media/imv
    ./media/kid3-qt
    ./media/mpd
    ./media/mpv
    ./media/rmpc
    ./media/spectral-mic

    # Messenger
    ./messenger/telegram-desktop
    ./messenger/webcord

    # Security
    ./security/gpg
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
    ./system/xdg-dir
    ./system/xdg-mime
    ./system/xwayland-satellite

    # Windows
    ./windows/wine-prefix
  ];
}
