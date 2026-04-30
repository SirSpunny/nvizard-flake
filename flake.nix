{
  description = "Neovim Flake: Start mit Lazy.nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

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
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [flake-awesome-neovim-plugins.overlays.default];
        };
        treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: builtins.attrValues p);

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
          yaml-language-server
          taskwarrior3
        ];
      in {
        packages.default = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            customRC = ''
              lua << EOF
                vim.opt.rtp:prepend("${pkgs.awesomeNeovimPlugins.mellow-nvim}")
                vim.opt.rtp:prepend("${./nvim-config}")
                require("init")
              EOF
            '';
          };

          extraMakeWrapperArgs = ''
            --prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps} \
            --prefix XDG_CONFIG_DIRS : ${treesitter-with-grammars}
          '';
        };
      }
    );
}
