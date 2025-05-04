{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kubectl k9s kubectx stern
    sops
  ];

  programs.zsh.initExtra = ''
    source <(kubectl completion zsh)
  '';

}
