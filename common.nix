{pkgs, ...}: {
  home.stateVersion = "24.11";

  imports = [
    # Program modules shared by standalone Home Manager and NixOS-integrated HM.
    ./programs/zsh
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
    ./programs/fastfetch.nix
    ./programs/kubernetes.nix
    ./programs/yazi.nix
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/bottom.nix
    ./programs/direnv

    # System-specific program tweaks live here.
    ./programs/system-specific
  ];

  home.packages = with pkgs; [
    git
    lazygit
    ripgrep # Fast search tool
    fd # Fast find alternative
    btop # Resource monitor
    hello # Simple test package
    yq-go # YAML processor
    jq # JSON processor
    nixfmt # Nix formatter
    nil # Nix linter
    nixd # Nix daemon
    unzip # Unzip files
    zip # Zip files
    bat # Cat replacement
    graphviz # Graph visualization software
    dysk # Disk usage analyzer
    # yt-dlp # DISABLED: pulls deno as transitive dependency, crashes rustc on build
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
    unixtools.column

    jnv # JSON viewer
    fx # Command-line JSON processor

    ## cpp
    gcc
    gnumake
    cmake
    llvmPackages_20.clang-tools

    ## python
    python314
    uv
    meson
    ninja

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
    asciinema_3
    ocrmypdf

    devenv
    dioxus-cli
    binaryen
    vips
    inkscape
    # cargo-tauri
    mkvtoolnix-cli
    imagemagick
    potrace
  ];

  home.sessionPath = [
    "$HOME/.npm-global/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.opencode/bin"
  ];
}