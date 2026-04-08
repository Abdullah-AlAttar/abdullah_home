{ ... }:
{
  programs.nvf.settings.vim.keymaps = [
    # ── Normal mode ──────────────────────────────────────────────────────────
    { key = "<Space>"; mode = "n"; action = "<NOP>";           desc = "Disable Space in normal mode"; }
    { key = "<esc>";   mode = "n"; action = ":noh<CR>";        desc = "Clear search highlight"; }
    { key = "Y";       mode = "n"; action = "y$";              desc = "Yank to end of line"; }
    { key = "<C-c>";   mode = "n"; action = ":b#<CR>";         desc = "Switch to last buffer"; }
    { key = "<C-x>";   mode = "n"; action = ":close<CR>";      desc = "Close window"; }
    { key = "<leader>s"; mode = "n"; action = ":w<CR>";        desc = "Save file"; }
    { key = "<C-s>";   mode = "n"; action = ":w<CR>";          desc = "Save file"; }
    { key = "<C-z>";   mode = "n"; action = "u";               desc = "Undo"; }
    { key = "<C-y>";   mode = "n"; action = "<C-r>";           desc = "Redo"; }
    { key = "<C-a>";   mode = "n"; action = "ggVG";            desc = "Select all"; }
    { key = "<leader>h"; mode = "n"; action = "<C-w>h";        desc = "Go to left window"; }
    { key = "<leader>l"; mode = "n"; action = "<C-w>l";        desc = "Go to right window"; }
    { key = "L";       mode = "n"; action = "$";               desc = "Go to end of line"; }
    { key = "H";       mode = "n"; action = "^";               desc = "Go to start of line"; }
    { key = "<C-Up>";  mode = "n"; action = ":resize -2<CR>";  desc = "Resize window up"; }
    { key = "<C-Down>"; mode = "n"; action = ":resize +2<CR>"; desc = "Resize window down"; }
    { key = "<C-Left>"; mode = "n"; action = ":vertical resize +2<CR>"; desc = "Resize window left"; }
    { key = "<C-Right>"; mode = "n"; action = ":vertical resize -2<CR>"; desc = "Resize window right"; }
    { key = "<leader>w"; mode = "n"; action = ":set wrap!<CR>"; desc = "Toggle word wrap"; }
    { key = "<M-k>";   mode = "n"; action = ":move-2<CR>";     desc = "Move line up"; }
    { key = "<M-j>";   mode = "n"; action = ":move+<CR>";      desc = "Move line down"; }
    { key = "<localleader>e"; mode = "n"; action = ":e <C-r>=expand('%:p:h')<CR>/"; desc = "Open file in current dir"; }
    { key = "<localleader>s"; mode = "n"; action = ":split <C-r>=expand('%:p:h')<CR>/"; desc = "Split in current dir"; }

    # ── LSP ──────────────────────────────────────────────────────────────────
    { key = "gd";  mode = "n"; action = "vim.lsp.buf.definition()";      lua = true; desc = "Go to definition"; }
    { key = "gD";  mode = "n"; action = "vim.lsp.buf.references()";      lua = true; desc = "Go to references"; }
    { key = "gt";  mode = "n"; action = "vim.lsp.buf.type_definition()"; lua = true; desc = "Go to type definition"; }
    { key = "gi";  mode = "n"; action = "vim.lsp.buf.implementation()";  lua = true; desc = "Go to implementation"; }
    { key = "K";   mode = "n"; action = "vim.lsp.buf.hover()";           lua = true; desc = "Hover documentation"; }
    { key = "<F2>"; mode = "n"; action = "vim.lsp.buf.rename()";         lua = true; desc = "Rename symbol"; }

    # ── Telescope ─────────────────────────────────────────────────────────────
    { key = "<leader>ff"; mode = "n"; action = "require('telescope.builtin').find_files()";                          lua = true; desc = "Find files"; }
    { key = "<leader>fg"; mode = "n"; action = "require('telescope.builtin').live_grep()";                           lua = true; desc = "Live grep"; }
    { key = "<leader>b";  mode = "n"; action = "require('telescope.builtin').buffers()";                             lua = true; desc = "List buffers"; }
    { key = "<leader>fh"; mode = "n"; action = "require('telescope.builtin').help_tags()";                           lua = true; desc = "Help tags"; }
    { key = "<leader>fd"; mode = "n"; action = "require('telescope.builtin').diagnostics()";                         lua = true; desc = "Diagnostics"; }
    { key = "<C-p>";      mode = "n"; action = "require('telescope.builtin').git_files()";                           lua = true; desc = "Git files"; }
    { key = "<leader>p";  mode = "n"; action = "require('telescope.builtin').oldfiles()";                            lua = true; desc = "Recent files"; }
    { key = "<C-e>";      mode = "n"; action = "require('telescope.builtin').find_files()";                          lua = true; desc = "Find files (alt)"; }
    { key = "<C-f>";      mode = "n"; action = "require('telescope.builtin').live_grep()";                           lua = true; desc = "Live grep (alt)"; }
    {
      key = "<C-t>";
      mode = "n";
      action = "require('telescope.builtin').live_grep({ default_text = 'TODO:|FIXME:|HACK:|NOTE:' })";
      lua = true;
      desc = "Find TODOs";
    }

    # ── Neo-tree ──────────────────────────────────────────────────────────────
    {
      key = "<leader>n";
      mode = "n";
      action = ":Neotree focus reveal toggle<CR>";
      desc = "Toggle file tree";
    }

    # ── Avante ────────────────────────────────────────────────────────────────
    { key = "<leader>aa"; mode = "n"; action = "<cmd>AvanteAsk<CR>";    desc = "Avante: Ask AI"; }
    { key = "<leader>ar"; mode = "n"; action = "<cmd>AvanteRefresh<CR>"; desc = "Avante: Refresh"; }
    { key = "<leader>ae"; mode = "n"; action = "<cmd>AvanteEdit<CR>";   desc = "Avante: Edit"; }

    # ── Visual mode ───────────────────────────────────────────────────────────
    { key = ">";       mode = "v"; action = ">gv";                     desc = "Indent right"; }
    { key = "<";       mode = "v"; action = "<gv";                     desc = "Indent left"; }
    { key = "<TAB>";   mode = "v"; action = ">gv";                     desc = "Indent right (tab)"; }
    { key = "<S-TAB>"; mode = "v"; action = "<gv";                     desc = "Indent left (shift-tab)"; }
    { key = "K";       mode = "v"; action = ":m '<-2<CR>gv=gv";        desc = "Move selection up"; }
    { key = "J";       mode = "v"; action = ":m '>+1<CR>gv=gv";        desc = "Move selection down"; }
    { key = "<leader>s"; mode = "v"; action = ":sort<CR>";             desc = "Sort selection"; }
    { key = "<leader>aa"; mode = "v"; action = "<cmd>AvanteAsk<CR>";   desc = "Avante: Ask AI about selection"; }
    { key = "<leader>ae"; mode = "v"; action = "<cmd>AvanteEdit<CR>";  desc = "Avante: Edit selection"; }

    # ── Insert mode ───────────────────────────────────────────────────────────
    { key = "jk";  mode = "i"; action = "<Esc>";       desc = "Exit insert mode"; }
    { key = "<C-s>"; mode = "i"; action = "<Esc>:w<CR>"; desc = "Save from insert mode"; }
  ];
}
