{
  programs.nixvim = {
    keymaps = [{
      mode = "n";
      key = "<leader>n";
      action = ":Neotree action=focus reveal toggle<CR>";
      options.silent = true;
    }];

    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      filesystem.followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
      window = {
        width = 30;
        autoExpandWidth = false;
      };
    };
    # highlight = {
    #   NeoTreeNormal = {
    #     fg = "#2d333d";
    #     bg = "#2d333d";
    #     ctermbg = "NONE";
    #   }; 
    #   NeoTreeNormalNC = {
    #     fg = "#2d333d";
    #     bg = "#2d333d";
    #     ctermbg = "NONE";
    #   };
    #   NeoTreeEndOfBuffer = {
    #     fg = "#2d333d";
    #     bg = "#2d333d";
    #     ctermbg = "NONE";
    #   };
    #   NeoTreeWinSeparator = {
    #     fg = "#2d333d";
    #     bg = "#2d333d";
    #     ctermbg = "NONE";
    #   };
    # };
  };
}
