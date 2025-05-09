{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kubectl k9s kubectx stern
    sops
  ];

  programs.zsh.initContent = ''
    source <(kubectl completion zsh)
  '';

}
