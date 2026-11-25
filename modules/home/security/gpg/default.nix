{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.gpg;
in
{
  options.my.home.gpg = {
    enable = lib.mkEnableOption "gpg";
  };

  config = lib.mkIf cfg.enable {
    programs.gpg = {
      enable = true;

      settings = {
        use-agent = true;
        keyid-format = "LONG";
        with-fingerprint = true;

        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP";

        require-cross-certification = true;
        no-emit-version = true;
        no-comments = true;
        keyserver = "hkps://keys.openpgp.org";
      };

      scdaemonSettings = {
        disable-ccid = true;
        reader-port = "Disabled";
      };
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;

      defaultCacheTtl = 3600;
      maxCacheTtl = 7200;
      defaultCacheTtlSsh = 3600;
      maxCacheTtlSsh = 7200;

      pinentry = {
        package = pkgs.pinentry-gnome3;
      };

      enableExtraSocket = true;
      extraConfig = ''
        no-allow-external-cache
        ignore-cache-for-signing
        grab
      '';
      enableScDaemon = false;
    };

    systemd.user.sessionVariables = {
      SSH_AUTH_SOCK = "/run/user/${toString config.home.uid}/gnupg/S.gpg-agent.ssh";
    };
  };
}
