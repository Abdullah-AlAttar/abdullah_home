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
    hadolint
  ];

  programs.zsh.initContent = ''
    source <(kubectl completion zsh)
  '';

}

