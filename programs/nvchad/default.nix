{ config, lib, pkgs, ... }:

{
  # Configure NvChad
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [ 
      gopls
      nixd
    ];

    backup = false; # Disable backups since we're using version control
    hm-activation = true; # Let home-manager manage the config
  };
}
