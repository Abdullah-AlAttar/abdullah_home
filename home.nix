# ~/.config/home-manager/home.nix
{
  config,
  pkgs,
  lib,
  username,
  ...
}:

{
  # Allow unfree packages (required for GitHub Copilot)
  nixpkgs.config.allowUnfree = true;
  imports = [
    # Include the results of the hardware scan
    ./programs/zsh
    ./programs/nu
    ./programs/atuin
    ./programs/starship
    ./programs/helix
    ./programs/go
    # ./programs/astrovim
    ./programs/neovim
    ./programs/bash
    ./programs/k9s
    ./programs/zellij

    ./programs/zoxide.nix
    ./programs/neofetch.nix
    ./programs/kubernetes.nix
    ./programs/yazi.nix
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/bottom.nix

    # System-specific configurations
    ./programs/system-specific
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username; # Replace with your username
  home.homeDirectory = "/home/${username}"; # Replace with your home paths

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
    git
    lazygit
    ripgrep # Fast search tool
    fd # Fast find alternative
    btop # Resource monitor
    hello # Simple test package
    yq-go # YAML processor
    jq # JSON processor
    nixfmt-classic # Nix formatter
    unzip # Unzip files
    zip # Zip files
    bat # Cat replacement
    graphviz # Graph visualization software
    dysk # Disk usage analyzer
    yt-dlp # YouTube downloader
    typst # Document preparation system
    fontconfig # Font configuration library
    xh # Command-line HTTP client
    tokei # Code statistics tool
    sqlfluff # SQL linter and formatter
    strace
    sqlite
    # Clipboard utilities for neovim
    xclip # X11 clipboard utility
    xsel # X11 clipboard utility (alternative)
    wl-clipboard # Wayland clipboard utility (for future use)

    jnv # JSON viewer
    fx # Command-line JSON processor
    # languages
    ## rust
    rustc
    cargo

    ## cpp
    gcc
    gnumake
    cmake

    ## python
    python314
    uv

    ## node
    nodejs_24
    bun

    ## dev
    glab
    postgresql
    buf # Protocol buffer compiler
    jfrog-cli

    ## network
    lsof
    nettools
    iproute2

    # idk
    hugo
    openfortivpn
    qpdf
  ];

  # Add a script to install Go tools during activation

  # set npm prefix to avoid permission issues
  # npm set prefix ~/.npm-global
  # this shit does not work
  home.sessionPath = [ "$HOME/.npm-global/bin" ];

}
