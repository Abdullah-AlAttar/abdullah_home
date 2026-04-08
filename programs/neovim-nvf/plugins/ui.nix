{ ... }:
{
  programs.nvf.settings.vim = {
    # ── File tree (neo-tree) ──────────────────────────────────────────────────
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        close_if_last_window = true;
        filesystem.follow_current_file.enabled = true;
        window.width = 30;
      };
    };

    # ── Status line (lualine) ─────────────────────────────────────────────────
    statusline.lualine = {
      enable = true;
      globalStatus = true;
      # Add LSP active client display to section_x
      extraActiveSection.x = [
        ''
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if next(clients) == nil then return "" end
              local c = {}
              for _, client in pairs(clients) do
                table.insert(c, client.name)
              end
              return " " .. table.concat(c, "|")
            end
          }
        ''
      ];
    };

    # ── Tab line (nvimBufferline, replaces barbar) ────────────────────────────
    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        cycleNext = "<TAB>";
        cyclePrevious = "<S-TAB>";
        closeCurrent = "<C-w>";
      };
    };

    # ── Terminal (toggleterm, replaces floaterm) ───────────────────────────────
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
      setupOpts = {
        direction = "float";
        open_mapping = "[[<leader>,]]";
        float_opts.border = "curved";
      };
    };

    # ── Dashboard (startify) ──────────────────────────────────────────────────
    # Startify config; unicode/filesNumber/skiplist set via luaConfigRC in extra.nix
    dashboard.startify = {
      enable = true;
      changeToDir = false;
      lists = [ { type = "dir"; } ];
    };

    # ── Autopairs ─────────────────────────────────────────────────────────────
    autopairs.nvim-autopairs.enable = true;

    # ── Colorizer ─────────────────────────────────────────────────────────────
    ui.colorizer = {
      enable = true;
      setupOpts.user_default_options.names = false;
    };

    # ── Colorscheme (kanagawa-paper via luaConfigRC, see extra.nix) ───────────
    # Theme is not in nvf's built-in list; loaded via extraPlugins
  };
}
