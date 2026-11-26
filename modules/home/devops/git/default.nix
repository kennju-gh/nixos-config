{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.git;
in
{
  options.my.home.git = {
    enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;

      includes = [
        {
          condition = "gitdir:${config.home.homeDirectory}/Dev/GitHub/";
          path = "${config.home.homeDirectory}/.config/git/github-config";
        }
        {
          condition = "gitdir:${config.home.homeDirectory}/Dev/GitLab/";
          path = "${config.home.homeDirectory}/.config/git/gitlab-config";
        }
      ];

      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rebase.autoStash = true;
        merge.conflictstyle = "zdiff3";
        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";

        url."git@github.com:".insteadOf = "https://github.com/";
        url."git@gitlab.com:".insteadOf = "https://gitlab.com/";
      };
    };

    home.file.".config/git/github-config".text = ''
      [user]
          name = "Kenn'Ju"
          email = "223960892+kennju-gh@users.noreply.github.com"
    '';

    home.file.".config/git/gitlab-config".text = ''
      [user]
          name = "Kenn'Ju"
          email = "44094151-kennju-gl@users.noreply.gitlab.com"
    '';

    systemd.user.tmpfiles.rules = [
      "d ${config.home.homeDirectory}/Dev 0755 - - -"
      "d ${config.home.homeDirectory}/Dev/GitHub 0755 - - -"
      "d ${config.home.homeDirectory}/Dev/GitLab 0755 - - -"
    ];

    programs.delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
      };
    };

    home.packages = [
      pkgs.pre-commit
      pkgs.difftastic
      pkgs.git-filter-repo
    ];
  };
}
