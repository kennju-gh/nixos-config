{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.xdg-mime;
in
{
  options.my.home.xdg-mime = {
    enable = lib.mkEnableOption "xdg-mime";

    book = lib.mkEnableOption "foliate";
    browser = lib.mkEnableOption "firefox-bin";
    dev = lib.mkEnableOption "neovim";
    file-manager = lib.mkEnableOption "nautilus and file-roller";
    media = lib.mkEnableOption "mpv and imv-dir";
    office = lib.mkEnableOption "libreoffice-qt";
    pdf = lib.mkEnableOption "zathura";
    wine = lib.mkEnableOption "wine";
  };

  config = lib.mkIf cfg.enable {
    xdg.mimeApps = {
      enable = true;

      defaultApplications = lib.mkMerge [
        # Book
        (lib.mkIf cfg.book {
          "application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/x-mobipocket-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/vnd.amazon.ebook" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/vnd.amazon.mobi8-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/x-fictionbook+xml" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/x-zip-compressed-fb2" = [ "com.github.johnfactotum.Foliate.desktop" ];
          "application/vnd.comicbook+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];
        })

        # Browser
        (lib.mkIf cfg.browser {
          "text/html" = [ "firefox.desktop" ];
          "x-scheme-handler/http" = [ "firefox.desktop" ];
          "x-scheme-handler/https" = [ "firefox.desktop" ];
          "x-scheme-handler/about" = [ "firefox.desktop" ];
          "x-scheme-handler/unknown" = [ "firefox.desktop" ];
        })

        # Dev (Neovim)
        (lib.mkIf cfg.dev {
          "text/plain" = [ "nvim.desktop" ];
          "text/markdown" = [ "nvim.desktop" ];
          "text/csv" = [ "nvim.desktop" ];
          "text/x-shellscript" = [ "nvim.desktop" ];
          "text/x-python" = [ "nvim.desktop" ];
          "text/x-go" = [ "nvim.desktop" ];
          "text/css" = [ "nvim.desktop" ];
          "text/javascript" = [ "nvim.desktop" ];
          "text/x-c" = [ "nvim.desktop" ];
          "text/x-c++" = [ "nvim.desktop" ];
          "text/x-java" = [ "nvim.desktop" ];
          "text/x-rust" = [ "nvim.desktop" ];
          "text/x-php" = [ "nvim.desktop" ];
          "text/x-yaml" = [ "nvim.desktop" ];
          "text/x-toml" = [ "nvim.desktop" ];
          "text/x-xml" = [ "nvim.desktop" ];
          "application/json" = [ "nvim.desktop" ];
          "text/x-dockerfile" = [ "nvim.desktop" ];
          "text/x-nix" = [ "nvim.desktop" ];
          "text/x-terraform" = [ "nvim.desktop" ];
        })

        # File Manager
        (lib.mkIf cfg.file-manager {
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
          "application/zip" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];
          "application/x-rar" = [ "org.gnome.FileRoller.desktop" ];
        })

        # Media
        (lib.mkIf cfg.media {
          "image/png" = [ "imv-dir.desktop" ];
          "image/jpeg" = [ "imv-dir.desktop" ];
          "image/jpg" = [ "imv-dir.desktop" ];
          "image/gif" = [ "imv-dir.desktop" ];
          "image/webp" = [ "imv-dir.desktop" ];
          "image/svg+xml" = [ "imv-dir.desktop" ];
          "image/tiff" = [ "imv-dir.desktop" ];
          "image/bmp" = [ "imv-dir.desktop" ];
          "video/mp4" = [ "mpv.desktop" ];
          "video/x-matroska" = [ "mpv.desktop" ];
          "video/webm" = [ "mpv.desktop" ];
          "audio/mp4" = [ "mpv.desktop" ];
          "audio/x-m4a" = [ "mpv.desktop" ];
          "audio/aac" = [ "mpv.desktop" ];
          "audio/opus" = [ "mpv.desktop" ];
          "video/x-msvideo" = [ "mpv.desktop" ];
          "video/quicktime" = [ "mpv.desktop" ];
          "video/x-flv" = [ "mpv.desktop" ];
          "audio/mpeg" = [ "mpv.desktop" ];
          "audio/flac" = [ "mpv.desktop" ];
          "audio/ogg" = [ "mpv.desktop" ];
          "audio/wav" = [ "mpv.desktop" ];
        })

        # Office
        (lib.mkIf cfg.office {
          "application/vnd.oasis.opendocument.text" = [ "libreoffice-writer.desktop" ];
          "application/msword" = [ "libreoffice-writer.desktop" ];
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
            "libreoffice-writer.desktop"
          ];
          "application/rtf" = [ "libreoffice-writer.desktop" ];

          "application/vnd.oasis.opendocument.spreadsheet" = [ "libreoffice-calc.desktop" ];
          "application/vnd.ms-excel" = [ "libreoffice-calc.desktop" ];
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [
            "libreoffice-calc.desktop"
          ];

          "application/vnd.oasis.opendocument.presentation" = [ "libreoffice-impress.desktop" ];
          "application/vnd.ms-powerpoint" = [ "libreoffice-impress.desktop" ];
          "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
            "libreoffice-impress.desktop"
          ];
        })

        # PDF
        (lib.mkIf cfg.pdf {
          "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        })

        # Wine
        (lib.mkIf cfg.wine {
          "application/x-ms-dos-executable" = [ "wine.desktop" ];
          "application/x-msdownload" = [ "wine.desktop" ];
          "application/x-msi" = [ "wine.desktop" ];
        })
      ];
    };

    home.sessionVariables = lib.mkIf cfg.browser {
      BROWSER = "firefox.desktop";
    };
  };
}
