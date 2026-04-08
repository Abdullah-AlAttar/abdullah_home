{ ... }:
{
  programs.nvf.settings.vim = {
    assistant = {
      # ── GitHub Copilot ──────────────────────────────────────────────────────
      copilot = {
        enable = true;
        setupOpts = {
          suggestion.enabled = true;
          suggestion.auto_trigger = true;
          suggestion.debounce = 75;
          suggestion.hide_during_completion = true;
          panel.enabled = true;
          panel.auto_refresh = false;
        };
        # Set dismiss keybinding; Tab/C-j/C-k/C-l handled via luaConfigRC
        mappings.suggestion = {
          accept = null; # custom Tab handled in extra.nix luaConfigRC
          next = null;    # custom <C-j> in luaConfigRC
          prev = null;    # custom <C-k> in luaConfigRC
          acceptLine = null;
          acceptWord = null;
          dismiss = "<C-]>";
        };
        mappings.panel = {
          jumpNext = "]]";
          jumpPrev = "[[";
          accept = "<CR>";
          refresh = "gr";
          open = "<M-CR>";
        };
      };

      # ── Avante ─────────────────────────────────────────────────────────────
      avante-nvim = {
        enable = true;
        setupOpts = {
          provider = "copilot";
          auto_suggestions_provider = "copilot";
          providers.copilot.model = "gpt-4.1";
          hints.enabled = true;
          windows = {
            wrap = true;
            width = 30;
            sidebar_header = {
              align = "center";
              rounded = true;
            };
          };
          diff = {
            autojump = true;
          };
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
        };
      };
    };
  };
}
