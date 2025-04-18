{ config, pkgs, lib, ... }:

{
  # imports = [./nvf.nix];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "maruf";
  home.homeDirectory = "/home/maruf";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    lazygit
    neofetch
    nil
    go
    rustup
    lldb
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.git = {
    enable = true;
    userName = "shm-wtag";
    userEmail = "maruf.shafique@welldev.io";
  };

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options.tabstop = 2;
        options.shiftwidth = 2;

        theme.enable = true;
        theme.name = "gruvbox";
        theme.style = "dark";

        dashboard = {
          alpha.enable = true;
          dashboard-nvim.enable = true;
        };

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          rust = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            crates.enable = true;
            format.enable = true;
          };
          go.enable = true;
        };
        
        keymaps = [
          {
            key = "<leader>e";
            mode = ["n"];
            action = ":Neotree toggle<CR>";
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
          copilot = {
            enable = true;
            cmp.enable = true;
          };
          codecompanion-nvim = {
            enable = true;
            setupOpts.strategies.chat.adapter = "ollama";
            setupOpts.strategies.inline.adapter = "copilot";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
