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
        treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: builtins.attrValues p);

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
          taskwarrior3
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
            --prefix XDG_CONFIG_DIRS : ${treesitter-with-grammars}
          '';
        };
      }
    );
}
