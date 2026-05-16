{ pkgs, ... }:
let
  toLua = str: "\n${str}\n\n";
  toLuaFile = file: "\n${builtins.readFile file}\n\n";
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # nvim-lspconfig
      # nvim-treesitter

      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.vue
      nvim-treesitter-parsers.tsx
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.rust

      comment-nvim
      # ts-comments-nvim

      nvim-ts-context-commentstring
      neo-tree-nvim
      blink-cmp

      {
        plugin = gruvbox-nvim;
        type = "viml";
        config = "colorscheme gruvbox";
      }

      telescope-fzf-native-nvim
      # {
      #   plugin = telescope-nvim;
      #   type = "lua";
      #   config = toLuaFile ./neovim/plugin/telescope.lua;
      # }

      # {
      #   plugin = nvim-ts-context-commentstring;
      #   type = "lua";
      #   config = toLuaFile ./neovim/plugin/ts-commentstring.lua;
      # }

      # (nvim-treesitter.withPlugins (
      #   plugins: with plugins; [
      #     tsx
      #     typescript
      #     javascript
      #     vue
      #     python
      #   ]
      # ))
    ];

    initLua = ''
          ${builtins.readFile ./neovim/init.lua}
      		${builtins.readFile ./neovim/keymaps.lua}
          ${builtins.readFile ./neovim/lsp.lua}
    '';
    # ${builtins.readFile ./neovim/plugin/toggleterm.lua}
    # ${builtins.readFile ./neovim/plugin/snipe.lua}
  };
}
