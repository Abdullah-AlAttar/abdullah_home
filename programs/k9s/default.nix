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
          skin = "catppuccin-mocha-transparent";
          # skin = "dracula";
        };
      };
    };
    skins = {
      catppuccin-mocha-transparent =
        builtins.fromJSON (builtins.readFile  ./catppuccin-mocha-transparent.json);
      dracula =
        builtins.fromJSON (builtins.readFile  ./dracula.json);
    };
  };
}

