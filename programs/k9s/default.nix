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

    plugin = import ./plugins.nix;

    skins = {
      dracula = builtins.fromJSON (builtins.readFile ./skins/dracula.json);
      catppuccin-mocha-transparent = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-mocha-transparent.json);
      catppuccin-frappe-transparent = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-frappe-transparent.json);
      catppuccin-latte-transparent = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-latte-transparent.json);
      catppuccin-macchiato-transparent = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-macchiato-transparent.json);
      catppuccin-macchiato = builtins.fromJSON  
        (builtins.readFile ./skins/catppuccin-macchiato.json);
      catppuccin-frappe = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-frappe.json);
      catppuccin-latte = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-latte.json);
      catppuccin-mocha = builtins.fromJSON
        (builtins.readFile ./skins/catppuccin-mocha.json);
    };
  };
}

