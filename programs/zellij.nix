{ config, lib, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      theme = "catppuccin-macchiato";
    };
  };
}
