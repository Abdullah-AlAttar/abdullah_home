# System-specific configurations
{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacrity
    ./ghostty
  ];
  home.packages = with pkgs; [
    # Add any system-specific packages here
    xclip # X11 clipboard utility
    xsel # X11 clipboard utility (alternative)
    wl-clipboard # Wayland clipboard utility (for future use)

  ];
}
