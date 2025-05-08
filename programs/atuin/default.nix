{ config, pkgs, lib, ... }:

{

 programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = false;
    settings = builtins.fromTOML (builtins.readFile ./config.toml);

  };
}
