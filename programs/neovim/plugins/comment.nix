{
  programs.nixvim.plugins.comment = {
    enable = true;

    settings = {
      toggler.line = "<C-/>";
      opleader.line = "<C-/>";
      toggler.block = "<C-?>";
      opleader.block = "<C-?>";
    };
  };
}
