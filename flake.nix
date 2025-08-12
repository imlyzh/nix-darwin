{
  description = "Lyzh's Nix-Darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-config.url = "github:imlyzh/home-manager";
  };

  outputs = { nixpkgs, home-manager, home-config, nix-darwin, rust-overlay, ... }@inputs:
    {
      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./machines/macbook-configuration.nix
            home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.lyzh = home-config.darwinConfig;
            }
            # ({ pkgs, ... }: {
            #   nixpkgs.overlays = [ rust-overlay.overlays.default ];
            #   environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
            # })
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
