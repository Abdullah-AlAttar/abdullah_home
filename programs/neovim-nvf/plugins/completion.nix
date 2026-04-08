{ ... }:
{
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      # Keymaps matching original config: Tab/S-Tab/CR/C-Space/C-e/C-d/C-f
      mappings = {
        next = "<Tab>";
        previous = "<S-Tab>";
        confirm = "<CR>";
        complete = "<C-Space>";
        close = "<C-e>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-d>";
      };
      # Sources matching original config
      # luasnip source is added automatically by nvf when snippets.luasnip is enabled
      sources = {
        path = "[Path]";
        nvim_lsp = "[LSP]";
        buffer = "[Buffer]";
      };
    };

    snippets.luasnip.enable = true;
  };
}
