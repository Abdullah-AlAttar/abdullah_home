{ ... }:
{
  programs.nvf.settings.vim = {
    opts = {
      # Display
      list = true;
      listchars = {
        tab = "▸ ";
        trail = "·";
        extends = "›";
        precedes = "‹";
        nbsp = "␣";
      };
      relativenumber = true;
      number = true;
      colorcolumn = "100";
      cursorline = false;
      cursorcolumn = false;
      signcolumn = "yes";
      laststatus = 3;
      termguicolors = true;
      spell = false;
      wrap = false;

      # Performance / behaviour
      updatetime = 100;
      hidden = true;
      swapfile = false;
      undofile = true;
      modeline = true;
      modelines = 100;

      # Mouse
      mouse = "a";
      mousemodel = "extend";

      # Splits
      splitbelow = true;
      splitright = true;

      # Search
      incsearch = true;
      inccommand = "split";
      ignorecase = true;
      smartcase = true;

      # Scroll
      scrolloff = 8;

      # Encoding
      fileencoding = "utf-8";

      # Indentation
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      textwidth = 0;

      # Folding
      foldlevel = 99;
    };

    # Transparent background highlights via luaConfigRC
    luaConfigRC.highlights = ''
      vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "NonText",     { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr",      { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLine",  { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC",{ bg = "NONE", ctermbg = "NONE" })
    '';

    # Blinking cursor and other Lua-only options
    luaConfigRC.options = ''
      vim.opt.guicursor = "n-v-c:block-blinkwait700-blinkoff400-blinkon250,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250"

      -- Highlight yanked text
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking text",
        group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
        callback = function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
        end,
      })

      -- Neovide-specific keymappings for scaling
      if vim.g.neovide then
        vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
        vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
        vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
        vim.g.neovide_opacity = 0.98
        vim.g.neovide_normal_opacity = 0.98
      end
    '';
  };
}
