{
  description = "Neovim Flake: Start mit Lazy.nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    libtexprintf.url = "github:SirSpunny/libtexprintf-flake";
    flake-awesome-neovim-plugins = {
      url = "github:m15a/flake-awesome-neovim-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    flake-awesome-neovim-plugins,
    libtexprintf,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [flake-awesome-neovim-plugins.overlays.default];
        };
        treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: builtins.attrValues p);
        vueTsPluginWrapper = pkgs.runCommand "vuels-ts-plugin-wrapper" {} ''
          mkdir -p $out/node_modules/@vue
          ln -s ${pkgs.vue-language-server}/lib/language-tools/packages/typescript-plugin \
                $out/node_modules/@vue/typescript-plugin
        '';

        runtimeDeps = with pkgs; [
          alejandra
          ansible-language-server
          ansible-lint
          biome
          curl
          fd
          fzf
          git
          helm-ls
          jinja-lsp
          lua-language-server
          nil
          ripgrep
          shfmt
          wl-clipboard
          yaml-language-server
          taskwarrior3
          texliveBasic
          imagemagick
          docker-compose-language-service
          dockerfile-language-server
          ghostscript
          mermaid-cli
          libtexprintf.packages.${system}.default

          vue-language-server
          vtsls
          typescript
          lazygit
        ];
      in {
        packages.default = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.nvizard = {
              start = [
                pkgs.vimPlugins.lz-n
                treesitter-with-grammars
              ];
              opt = [
                pkgs.vimPlugins.vim-sleuth
                pkgs.awesomeNeovimPlugins.snacks-nvim
                pkgs.awesomeNeovimPlugins.nvim-web-devicons
                pkgs.vimPlugins.plenary-nvim
                pkgs.awesomeNeovimPlugins.nvim-surround
                pkgs.awesomeNeovimPlugins.colorful-menu-nvim
                pkgs.vimPlugins.blink-cmp
                pkgs.awesomeNeovimPlugins.codecompanion-nvim
                pkgs.awesomeNeovimPlugins.conform-nvim
                pkgs.awesomeNeovimPlugins.gitsigns-nvim
                pkgs.awesomeNeovimPlugins.render-markdown-nvim
                pkgs.awesomeNeovimPlugins.trouble-nvim
                pkgs.awesomeNeovimPlugins.which-key-nvim
                pkgs.awesomeNeovimPlugins.kanagawa-nvim
                pkgs.awesomeNeovimPlugins.lualine-nvim
                pkgs.vimPlugins.nvim-lspconfig
              ];
            };
            customRC = ''
              lua << EOF
                vim.g.flake_config_path = "${./nvim-config}"
                vim.g.vue_ls_typescript_plugin_path = "${vueTsPluginWrapper}"
                vim.opt.rtp:prepend(vim.g.flake_config_path)
                require("init")
              EOF
            '';
          };

          extraMakeWrapperArgs = ''
            --prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps} \
          '';
        };
      }
    );
}
