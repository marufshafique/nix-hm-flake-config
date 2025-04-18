{ config, pkgs, lib, ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options.tabstop = 2;
        options.shiftwidth = 2;

        theme.enable = true;
        theme.name = "gruvbox";
        theme.style = "dark";

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
          go.enable = true;
        };
        
        keymaps = [
          {
            key = "<leader>h";
            mode = ["n"];
            action = ":noh<CR>";
            silent = true;
          }
        ];

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        terminal.toggleterm.enable = true;
        terminal.toggleterm.lazygit = {
          enable = true;
          mappings.open = "<leader>gg";
        };

        git.gitsigns = {
          enable = true;
        };

        assistant = {
          codecompanion-nvim = {
            enable = true;
            setupOpts.strategies.chat.adapter = "ollama";
            setupOpts.strategies.inline.adapter = "ollama";
            setupOpts.adapters = lib.generators.mkLuaInline ''
              require("codecompanion").setup({
                adapters = {
                  ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                      schema = {
                        model = {
                          default = "llama3.1:8b",
                        },
                      },
                      env = {
                        url = "http://localhost:11434",
                        api_key = "",
                      },
                      headers = {
                        ["Content-Type"] = "application/json",
                      },
                      parameters = {
                        sync = true,
                      },
                    })
                  end,
                },
              })
            '';
          };
        };
      };
    };
  };
}
