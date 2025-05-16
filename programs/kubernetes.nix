{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kubectl kubectx stern
    sops argocd kubecolor
  ];

  programs.zsh.initContent = ''
    source <(kubectl completion zsh)
  '';

}
