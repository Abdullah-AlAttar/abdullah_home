{ config, lib, pkgs, ... }: 

let
  gotools = import ./gotools.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    go_1_24
    go-task
    revive
    temporal-cli
    golines
    process-compose
    # gotools.jv
    # gotools.jsonnetfmt
    sqlc
    go-migrate
    oapi-codegen
  ];

  home.file."revive.toml".source = ./revive.toml;
}
