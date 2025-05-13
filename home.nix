# ~/.config/home-manager/home.nix
{ config, pkgs, lib, username, ... }:

{
  imports = [
    # Include the results of the hardware scan
    ./programs/zsh
    ./programs/atuin
    ./programs/starship
    ./programs/helix
    ./programs/go
    ./programs/astrovim
    ./programs/bash

    ./programs/zoxide.nix
    ./programs/neofetch.nix
    ./programs/kubernetes.nix
    ./programs/yazi.nix
    ./programs/eza.nix
    ./programs/zellij.nix
    ./programs/fzf.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username; # Replace with your username
  home.homeDirectory = "/home/${username}"; # Replace with your home path

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when updating Home Manager. Use the version you chose in flake.nix.
  # It's recommended to leave this unchanged and instead bump it manually
  # periodically after confirming compatibility.
  home.stateVersion = "24.11"; # Set this to the version you're using

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # This is required for using Home Manager with non-NixOS Linux distributions (like WSL)
  targets.genericLinux.enable = true;

  # Add some packages to your user profile
  home.packages = with pkgs; [
    # pkgs.git       # Version control
    # neovim # Text editor
    ripgrep # Fast search tool
    fd # Fast find alternative
    btop # Resource monitor
    hello # Simple test package
    yq # YAML processor
    jq # JSON processor
    nixfmt-classic # Nix formatter
    eza # ls replacement
    unzip # Unzip files
    zip # Zip files
    bat # Cat replacement
    graphviz # Graph visualization software
    dysk # Disk usage analyzer

    # languages
    ## rust
    rustc
    cargo

 

    ## cpp
    gcc

    ## python
    python314
    uv


    ## node
    nodejs_22

    ## dev
    glab
    postgresql

  ];




  # set npm prefix to avoid permission issues
  # npm set prefix ~/.npm-global
  # this shit does not work
  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

}
