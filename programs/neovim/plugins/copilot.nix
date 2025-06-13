{ lib, config, pkgs, ... }: {
  programs.nixvim.plugins.codecompanion = {
    enable = false;
    # nixvim, in conjunction with home.packages in your main neovim config,
    # should handle the language server setup automatically.
  };
}
