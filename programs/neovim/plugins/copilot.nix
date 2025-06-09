{ lib, config, pkgs, ... }: {
  programs.nixvim.plugins.copilot-lua = {
    enable = true;
    # nixvim, in conjunction with home.packages in your main neovim config,
    # should handle the language server setup automatically.
  };
}
