{ pkgs }:

{
  jv = pkgs.buildGoModule rec {
    pname = "jv";
    version = "v6.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "santhosh-tekuri";
      repo = "jsonschema";
      rev = version; 
      sha256 = "sha256-/scpmnDB6EgJHWLYImwdiCOcwQw0k+jnTQ4Ml8pYARk="; # placeholder, replace with actual
    };
    subPackages = [ "cmd/jv" ];
    vendorHash =  null;
    
  };

  # jsonnet = pkgs.buildGoModule {
  #   pname = "jsonnet";
  #   version = "0.20.0";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "google";
  #     repo = "go-jsonnet";
  #     rev = "v0.20.0";
  #     # sha256 = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB="; # Replace with actual hash
  #   };
  #   subPackages = [ "cmd/jsonnet" ];
  #   vendorSha256 = null;
  # };

  # jsonnetfmt = pkgs.buildGoModule {
  #   pname = "jsonnetfmt";
  #   version = "latest";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "google";
  #     repo = "go-jsonnet";
  #     rev = "v0.21.0";
  #     sha256 = "sha256-J92xNDpCidbiSsN6NveS6BX6Tx+qDQqkgm6pjk1wBTQ="; # Same as above
  #   };
  #   subPackages = [ "cmd/jsonnetfmt" ];
  #   vendorHash  = null;
  # };
}