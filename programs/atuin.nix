{ config, pkgs, lib, ... }:

{

 programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = false;
    
  };
}
