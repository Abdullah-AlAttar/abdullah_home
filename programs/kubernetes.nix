{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kubectl kubectx stern
    sops
  ];

  programs.zsh.initContent = ''
    source <(kubectl completion zsh)
  '';

}
