{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.neovim;
in
{
  options.my.home.neovim = {
    enable = lib.mkEnableOption "neovim";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        lualine-nvim
        telescope-nvim
        nvim-autopairs
        (nvim-treesitter.withPlugins (
          parsers: with parsers; [
            # Config & IaC
            yaml
            json
            hcl
            dockerfile
            bash
            gotmpl
            make
            toml
            ini
            regex
            # Languages
            python
            rust
            go
            sql
            # Docs & Git
            markdown
            gitignore
            # Base
            lua
            vim
            vimdoc
            query
          ]
        ))
      ];

      initLua = ''
        require('lualine').setup({
          options = { theme = 'auto' }
        })
      '';
    };
  };
}
