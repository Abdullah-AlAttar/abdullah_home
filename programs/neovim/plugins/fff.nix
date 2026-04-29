{
  programs.nixvim = {
    plugins.fff = {
      enable = true;

      # settings = {
      #   base_path = {
      #     __raw = "vim.fn.getcwd()";
      #   };
      #   max_results = 100;
      #   layout = {
      #     height = 0.8;
      #     width = 0.8;
      #     preview_position = "right";
      #   };
      #   key_bindings = {
      #     close = [
      #       "<Esc>"
      #       "<C-c>"
      #     ];
      #     select_file = "<CR>";
      #     open_split = "<C-s>";
      #     open_vsplit = "<C-v>";
      #     open_tab = "<C-t>";
      #     move_up = [
      #       "<Up>"
      #       "k"
      #     ];
      #     move_down = [
      #       "<Down>"
      #       "j"
      #     ];
      #     move_left = [
      #       "<Left>"
      #       "h"
      #     ];
      #     move_right = [
      #       "<Right>"
      #       "l"
      #     ];
      #     filter = "<C-f>";
      #     clear_filter = "<C-u>";
      #   };
      # };
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-e>";
        action = ":FFFFind<CR>";
        options.silent = true;
      }
    ];
  };

}
