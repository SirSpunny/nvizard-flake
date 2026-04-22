{
  description = "Neovim Flake: Start mit Lazy.nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        # retrieve all available treesitter parsers
        all-treesitter-parsers-list = builtins.attrValues pkgs.vimPlugins.nvim-treesitter-parsers;
        valid-treesitter-parsers = builtins.filter (p: pkgs.lib.isDerivation p) all-treesitter-parsers-list;
        treesitter-parsers = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths = valid-treesitter-parsers;
          postBuild = ''
            mkdir -p $out/parser
            find -L $out -name "*.so" -exec ln -s {} $out/parser/ \;
          '';
        };

        runtimeDeps = with pkgs; [
          alejandra
          ansible-language-server
          ansible-lint
          biome
          curl
          fd
          fzf
          gcc
          git
          gnumake
          helm-ls
          jinja-lsp
          lua-language-server
          nil
          ripgrep
          shfmt
          unzip
          yaml-language-server
        ];
      in {
        packages.default = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            customRC = ''
              lua << EOF
                vim.opt.rtp:prepend("${./nvim-config}")
                require("init")
              EOF
            '';
          };

          extraMakeWrapperArgs = ''
            --prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps} \
            --set-default NVIM_TREESITTER_PARSERS "${treesitter-parsers}"
          '';
        };
      }
    );
}
