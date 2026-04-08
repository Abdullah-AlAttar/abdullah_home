{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      enableLuaLoader = true;

      # Clipboard
      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.xclip.enable = true;
      };

      # Leaders
      globals = {
        mapleader = " ";
        maplocalleader = ",";
        # Disable unnecessary providers
        loaded_ruby_provider = 0;
        loaded_perl_provider = 0;
        loaded_python_provider = 0;
      };

      # Lazy loading via lz.n
      lazy.enable = true;

      # Visuals
      visuals = {
        nvim-web-devicons.enable = true;
        cinnamon-nvim.enable = true; # smooth scrolling (replaces neoscroll)
        indent-blankline.enable = true;
      };
    };
  };
}
