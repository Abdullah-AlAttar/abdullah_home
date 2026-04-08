{ ... }:
{
  programs.nvf.settings.vim = {
    # ── LSP ──────────────────────────────────────────────────────────────────
    lsp = {
      enable = true;
      formatOnSave = false; # Handled per-language or manually
      lspkind.enable = true;

      # Override default diagnostic navigation to match original config
      mappings = {
        nextDiagnostic = "<leader>j";
        previousDiagnostic = "<leader>k";
        # Null out defaults that clash or that we set via vim.keymaps
        goToDeclaration = null;
        goToDefinition = null;
        goToType = null;
        hover = null;
        renameSymbol = null;
      };
    };

    # ── Diagnostics ──────────────────────────────────────────────────────────
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        underline = true;
        update_in_insert = false;
        signs = false;
      };
    };

    # ── Languages ─────────────────────────────────────────────────────────────
    # Each language module enables treesitter + LSP + formatter automatically
    languages = {
      enableFormat = false; # Disable global format-on-save; use lsp.formatOnSave = false
      enableTreesitter = true;

      # C/C++ — clangd
      clang = {
        enable = true;
        lsp.enable = true;
      };

      # Go — gopls
      go = {
        enable = true;
        lsp.enable = true;
      };

      # Nix — nil_ls
      nix = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "nil" ];
      };

      # Python — pyright
      python = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "pyright" ];
      };

      # TypeScript/JavaScript — typescript-language-server
      ts = {
        enable = true;
        lsp.enable = true;
      };

      # YAML — yamlls
      yaml = {
        enable = true;
        lsp.enable = true;
      };

      # JSON — jsonls
      json = {
        enable = true;
        lsp.enable = true;
      };

      # Markdown — treesitter only (no LSP needed)
      markdown = {
        enable = true;
        lsp.enable = false;
      };
    };
  };
}
