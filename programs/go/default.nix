{ config, lib, pkgs, ... }: {
  
  home.packages = with pkgs; [
    # Add your package dependencies here
    go_1_24
    go-task
    revive
  ];
  # create symlink to revive.toml 
  # in $HOME/revive.toml

  home.file."revive.toml".source = ./revive.toml;
}