{ config, lib, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./theme.toml);
  };
}