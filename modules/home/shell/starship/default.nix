{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.starship;
in
{
  options.my.home.starship = {
    enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;
        command_timeout = 300;
        scan_timeout = 300;

        username = {
          show_always = true;
          format = "[$user]($style)@";
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname]($style) ";
        };

        python = {
          detect_files = [
            "requirements.txt"
            "pyproject.toml"
            "Pipfile"
            ".python-version"
          ];
          detect_extensions = [ ];
        };
        rust = {
          detect_files = [
            "Cargo.toml"
            "Cargo.lock"
          ];
          detect_extensions = [ ];
        };
        golang = {
          detect_files = [
            "go.mod"
            "go.sum"
            "go.work"
          ];
          detect_extensions = [ ];
        };

        kubernetes = {
          detect_files = [
            "kustomization.yaml"
            "Chart.yaml"
            "deployment.yaml"
            "values.yaml"
          ];
          detect_folders = [ ".kube" ];
          format = "☸ [$context( \($namespace\))]($style) ";
        };
        terraform = {
          detect_files = [
            "main.tf"
            "terraform.tfstate"
          ];
          detect_folders = [ ".terraform" ];
          detect_extensions = [ ];
        };
        custom.ansible_project = {
          command = "echo 'ansible'";
          when = "test -f ansible.cfg || test -f playbook.yml || test -f inventory.ini";
          format = "[$output]($style) ";
        };
        docker_context = {
          detect_files = [
            "Dockerfile"
            "docker-compose.yml"
            "docker-compose.yaml"
          ];
        };

        git_branch = {
          format = "[$symbol$branch]($style) ";
          symbol = " ";
        };

        nix_shell = {
          format = "[$symbol$state]($style) ";
          symbol = "❄ ";
        };
      };
    };
  };
}
