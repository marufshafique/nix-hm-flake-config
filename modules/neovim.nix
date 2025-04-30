{ pkgs, ... }:

{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
			neo-tree-nvim
      neodev-nvim
			plenary-nvim
			toggleterm-nvim
			{
				plugin = gitsigns-nvim;
				config = toLuaFile ./neovim/plugin/gitsigns.lua;
			}

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./neovim/plugin/lsp.lua;
      }
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }
      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      {
        plugin = nvim-cmp;
        config = toLuaFile ./neovim/plugin/cmp.lua;
      }
			{
				plugin = none-ls-nvim;
				config = toLuaFile ./neovim/plugin/null-ls.lua;
			}

			{
				plugin = nvim-autopairs;
				config = toLua "require(\"nvim-autopairs\").setup()";
			}

      telescope-fzf-native-nvim
      {
        plugin = telescope-nvim;
        config = toLuaFile ./neovim/plugin/telescope.lua;
      }

      # telescope-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      lualine-nvim
      nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
					p.tree-sitter-vue
					p.tree-sitter-rust
					p.tree-sitter-javascript
					p.tree-sitter-typescript
					p.tree-sitter-css
        ]));
        config = toLuaFile ./neovim/plugin/treesitter.lua;
      }

      # vim-nix
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./neovim/init.lua}
			${builtins.readFile ./neovim/keymaps.lua}
			${builtins.readFile ./neovim/plugin/toggleterm.lua}
    '';
  };
}
