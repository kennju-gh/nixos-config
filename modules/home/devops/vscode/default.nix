{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.vscode;
in
{
  options.my.home.vscode = {
    enable = lib.mkEnableOption "vscode";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          eamodio.gitlens
          hashicorp.terraform
          jnoortheen.nix-ide
          ms-azuretools.vscode-containers
          ms-kubernetes-tools.vscode-kubernetes-tools
          ms-python.python
          ms-python.debugpy
          ms-python.vscode-pylance
          ms-python.vscode-python-envs
          ms-vscode.makefile-tools
          redhat.ansible
          redhat.vscode-yaml
          timonwong.shellcheck
          skellock.just
          ms-vscode-remote.remote-ssh
          cweijan.dbclient-jdbc
          cweijan.vscode-database-client2
        ];

        userSettings = {
          "git.enableSmartCommit" = true;
          "git.confirmSync" = false;
          "git.ignoreRebaseWarning" = true;
          "git.useIntegratedAskPass" = false;
          "git.postCommitCommand" = "none";
          "files.trimTrailingWhitespace" = true;
          "files.insertFinalNewline" = true;
          "editor.formatOnSave" = true;
          "explorer.confirmDragAndDrop" = false;
          "explorer.confirmDelete" = false;
          "workbench.browser.showInTitleBar" = true;
          "chat.titleBar.openInAgentsWindow.enabled" = false;
          "chat.titleBar.signIn.enabled" = false;
          "makefile.configureOnOpen" = true;
          "ansible.lightspeed.enabled" = false;
          "ansible.lightspeed.suggestions.enabled" = false;
          "nix.formatterPath" = "nixfmt";
          "nix.serverPath" = "nixd";
          "nix.enableLanguageServer" = true;
          "nix.hiddenLanguageServerErrors" = [
            "textDocument/definition"
            "textDocument/references"
            "textDocument/typeDefinition"
            "textDocument/hover"
          ];
          "terminal.integrated.env.linux" = {
            NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
            SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh";
          };
        };
      };
    };
  };
}
