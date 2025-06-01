{
  imports = [
    ./barbar.nix # Tab bar for Neovim
    ./comment.nix # Commenting plugin
    ./floaterm.nix # Floating terminal for Neovim 
    # ./harpoon.nix
    ./lsp.nix # Language Server Protocol support
    ./lualine.nix # Status line for Neovim
    ./markdown-preview.nix # Markdown preview plugin
    # ./neorg.nix # Neorg plugin for Neovim
    ./neo-tree.nix # File explorer for Neovim
    # ./snacks.nix # TODO remove
    ./startify.nix # Start screen for Neovim
    ./telescope.nix # Fuzzy finder for Neovim
    ./treesitter.nix # Syntax highlighting and code parsing
    # ./vimtex.nix # inria
    ./which-key.nix # Shows available keybindings
  ];

  programs.nixvim = {
    # colorschemes.gruvbox.enable = true;
    colorschemes.vscode.enable = true;
    # colorschemes.bluloco.enable = true;

    plugins = {
      # Lazy loading
      lz-n.enable = true;

      web-devicons.enable = true;

      # markview = {
      #   enable = true;
      #   settings = {
      #     keymaps = {
      #       # close_view = "q";
      #     };
      #   };
      # };

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
        settings.user_default_options.names = false;
      };

      oil = {
        enable = true;
        lazyLoad.settings.cmd = "Oil";
      };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
