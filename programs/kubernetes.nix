{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    kubectl
    kubectx
    stern
    sops
    argocd
    kubecolor
    kubernetes-helm
    helm-docs
  ];

  programs.zsh.initContent = ''
    source <(kubectl completion zsh)
  '';

}
