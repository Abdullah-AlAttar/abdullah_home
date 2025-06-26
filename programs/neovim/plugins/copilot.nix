{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      # Use copilot.vim for GitHub Copilot integration
      copilot-lua = {
        enable = true;
        settings = {
          no_tab_map = true;
          assume_mapped = true;
          tab_fallback = "";
        };
      };

      # Avante - AI coding assistant that emulates Cursor AI IDE
      avante = {
        enable = true;
        settings = {
          provider = "copilot"; # Use GitHub Copilot as the provider
          providers.copilot = {
            model = "gpt-4.1"; # Use GPT-4 model for AI assistancekj
          };
          auto_suggestions_provider = "copilot";

          mappings = {
            diff = {
              ours = "co";
              theirs = "ct";
              none = "c0";
              both = "cb";
              next = "]x";
              prev = "[x";
            };
            jump = {
              next = "]]";
              prev = "[[";
            };
          };

          hints.enabled = true;

          windows = {
            wrap = true;
            width = 30;
            sidebar_header = {
              align = "center";
              rounded = true;
            };
          };

          highlights.diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };

          diff = {
            debug = false;
            autojump = true;
            list_opener = "copen";
          };
        };
      };
    };

    # Add some basic Copilot keybindings
    keymaps = [
      {
        mode = "i";
        key = "<Tab>";
        action = "copilot#Accept('\\<CR>')";
        options = {
          silent = true;
          expr = true;
          noremap = true;
        };
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Plug>(copilot-next)";
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Plug>(copilot-previous)";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
