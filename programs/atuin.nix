{ config, pkgs, lib, ... }:

{
  # home.packages = with pkgs; [
  #   atuin
  # ];

  # programs.zsh.initExtra = ''
  #   echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
  # '';

 programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = false;
  };
}
