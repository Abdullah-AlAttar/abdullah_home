{ pkgs }:

{
  # jv = pkgs.buildGoModule {
  #   pname = "jv";
  #   version = "latest";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "santhosh-tekuri";
  #     repo = "jsonschema";
  #     rev = "v1.4.0"; # Use the latest tag or commit hash
  #     # sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with actual hash
  #   };
  #   subPackages = [ "cmd/jv" ];
  #   vendorSha256 = null;
  # };

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
  #     rev = "v0.20.0";
  #     # sha256 = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB="; # Same as above
  #   };
  #   subPackages = [ "cmd/jsonnetfmt" ];
  #   vendorSha256 = null;
  # };
}