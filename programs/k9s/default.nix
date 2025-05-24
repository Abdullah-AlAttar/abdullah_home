{ config, lib, pkgs, ... }:

{
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        refreshRate = 2;
        ui = {
          headless = false;
          logoless = true;
          skin = "catppuccin-macchiato-transparent";
          # skin = "dracula";   

        };
        logger = { fullScreen = false; };
      };

    };

    views = import ./views.nix;
    plugin = import ./plugins.nix;

    skins =  import ./skins.nix;
  };
}

