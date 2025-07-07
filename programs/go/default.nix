{ config, lib, pkgs, ... }:

let gotools = import ./gotools.nix { inherit pkgs; };
in {
  programs.go = {
    enable = true;
    package = pkgs.go_1_24; # Specify the Go version here
    # You can configure other options like goPath, goBin, etc., if needed.
    # For example:
    # goPath = "go"; # Sets GOPATH to $HOME/go
    # goBin = ".local/bin/go"; # Sets GOBIN to $HOME/.local/bin/go
  };
  home.packages = with pkgs; [
    # go_1_24 # This will be managed by programs.go
    go-task
    revive
    temporal-cli
    golines
    process-compose
    # gotools.jv
    # gotools.jsonnetfmt
    sqlc
    oapi-codegen
    kaf
    gopls
    delve
    govulncheck
  ];

  home.file."revive.toml".source = ./revive.toml;



}
