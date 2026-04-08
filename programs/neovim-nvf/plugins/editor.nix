{ ... }:
{
  programs.nvf.settings.vim = {
    # ── Telescope ─────────────────────────────────────────────────────────────
    telescope = {
      enable = true;
      # Null out all built-in nvf telescope mappings; we use vim.keymaps instead
      mappings = {
        open = null;
        resume = null;
        findFiles = null;
        liveGrep = null;
        helpTags = null;
        gitFiles = null;
        gitBranches = null;
        gitCommits = null;
        gitBufferCommits = null;
        gitStatus = null;
        gitStash = null;
        treesitter = null;
        buffers = null;
        lspDefinitions = null;
        lspDocumentSymbols = null;
        lspImplementations = null;
        lspWorkspaceSymbols = null;
        lspReferences = null;
      };
      setupOpts = {
        defaults.file_ignore_patterns = [
          "node_modules"
          ".git/"
          "dist/"
          "build/"
          "target/"
        ];
      };
    };

    # ── Git ───────────────────────────────────────────────────────────────────
    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = false;
        setupOpts.signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
      };
    };

    # ── Comments ──────────────────────────────────────────────────────────────
    comments.comment-nvim = {
      enable = true;
      mappings = {
        toggleCurrentLine = "<leader>/";
        toggleSelectedLine = "<leader>/";
        toggleOpLeaderLine = "<leader>/";
        toggleCurrentBlock = null;
        toggleSelectedBlock = null;
        toggleOpLeaderBlock = null;
      };
    };

    # ── Which-key ─────────────────────────────────────────────────────────────
    binds.whichKey = {
      enable = true;
      setupOpts.preset = "helix";
    };

    # ── Treesitter (additional config) ───────────────────────────────────────
    treesitter = {
      enable = true;
      fold = true;
    };

    # ── Utility plugins ───────────────────────────────────────────────────────
    # oil.nvim — edit filesystem like a buffer
    utility.oil-nvim.enable = true;

    # yazi.nvim — yazi file manager integration
    utility.yazi-nvim.enable = true;
  };
}
