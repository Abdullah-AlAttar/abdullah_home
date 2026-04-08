{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    # ── Extra plugins not natively supported by nvf ───────────────────────────
    extraPlugins = {
      # kanagawa-paper colorscheme (not in nvf's built-in theme list)
      # Switch to pkgs.vimPlugins.kanagawa-nvim if kanagawa-paper-nvim is unavailable
      kanagawa-paper = {
        package = pkgs.vimPlugins.kanagawa-paper-nvim;
        setup = "";
      };

      # trim.nvim — auto-remove trailing whitespace
      trim-nvim = {
        package = pkgs.vimPlugins.trim-nvim;
        after = [ "kanagawa-paper" ];
        setup = ''
          require("trim").setup({
            highlight = true,
            ft_blocklist = {
              "checkhealth", "floaterm", "lspinfo",
              "neo-tree", "TelescopePrompt",
            },
          })
        '';
      };
    };

    # ── luaConfigRC entries ────────────────────────────────────────────────────
    luaConfigRC = {
      # Load colorscheme (must run after plugin is loaded)
      colorscheme = ''
        require("kanagawa-paper").setup({ transparent = true })
        vim.cmd("colorscheme kanagawa-paper-ink")
      '';

      # Copilot custom keymaps for Tab/C-j/C-k/C-l
      copilot-keymaps = ''
        local copilot_suggestion = require("copilot.suggestion")

        vim.keymap.set("i", "<Tab>", function()
          if copilot_suggestion.is_visible() then
            copilot_suggestion.accept()
          else
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
              "n",
              false
            )
          end
        end, { silent = true, noremap = true, desc = "Copilot: accept or Tab" })

        vim.keymap.set("i", "<C-j>", function()
          copilot_suggestion.next()
        end, { silent = true, noremap = true, desc = "Copilot: next suggestion" })

        vim.keymap.set("i", "<C-k>", function()
          copilot_suggestion.prev()
        end, { silent = true, noremap = true, desc = "Copilot: prev suggestion" })

        vim.keymap.set("i", "<C-l>", function()
          copilot_suggestion.accept_word()
        end, { silent = true, noremap = true, desc = "Copilot: accept word" })
      '';

      # Startify custom header (ASCII art)
      startify-header = ''
        vim.g.startify_custom_header = {
          "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗",
          "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║",
          "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║",
          "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║",
          "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        }
        vim.g.startify_change_to_dir = 0
        vim.g.startify_use_unicode = 1
        vim.g.startify_files_number = 30
        vim.g.startify_skiplist = { "flake.lock" }
        vim.g.startify_lists = {
          { type = "dir" },
        }
      '';
    };
  };
}
