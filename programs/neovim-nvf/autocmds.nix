{ ... }:
{
  programs.nvf.settings.vim = {
    autocmds = [
      # Open help in vertical split
      {
        event = [ "FileType" ];
        pattern = [ "help" ];
        command = "wincmd L";
        desc = "Open help in vertical split";
      }
      # Enable spellcheck for text files
      {
        event = [ "FileType" ];
        pattern = [ "tex" "latex" "markdown" ];
        command = "setlocal spell spelllang=en";
        desc = "Enable spellcheck for text files";
      }
    ];
  };
}
