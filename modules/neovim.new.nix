{ pkgs, ... }:
let
  toLua = str: "\n${str}\n\n";
  toLuaFile = file: "\n${builtins.readFile file}\n\n";
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
      nvim-lspconfig
      blink-cmp

      {
        plugin = gruvbox-nvim;
        type = "viml";
        config = "colorscheme gruvbox";
      }

      telescope-fzf-native-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = toLuaFile ./neovim/plugin/telescope.lua;
      }
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
