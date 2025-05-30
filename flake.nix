# ~/.config/home-manager/flake.nix
{
  description = "My personal Home Manager flake";

  inputs = {
    # Nixpkgs (stable channel)
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # Or use unstable: nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "github:nix-community/home-manager/archive/master.tar.gz";

      # url = "github:nix-community/home-manager/archive/master.tar.gz";
      # Or use unstable: url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # Make HM use the same nixpkgs
    };
    nixvim = {
       url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs:
    let
      # Replace <username> with your actual Linux username
      username = "ab_dullah";
      # Set your target system architecture
      system = "x86_64-linux"; # Or "aarch64-linux", etc.

      # Helper to access nixpkgs for the specified system
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Define the Home Manager configuration output
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Modules to import: your main configuration file (home.nix)
          modules = [
            ./home.nix
            # You can add more modules here later if you split your config
            catppuccin.homeModules.catppuccin
          ];

          # Optional: Extra arguments passed to your modules
          extraSpecialArgs = { inherit username; inherit inputs; };
        };
    };
}
