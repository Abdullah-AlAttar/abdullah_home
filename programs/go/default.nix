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
    # gotools.jv
  ];

  home.file."revive.toml".source = ./revive.toml;
}