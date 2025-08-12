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
    dotfiles = {
      url = "github:imlyzh/dotfiles";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nix-darwin, rust-overlay, home-config, dotfiles, ... }@inputs:
    {
      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
            overlays = [
              rust-overlay.overlays.default
            ];
          };
          modules = [
            ./machines/macbook-configuration.nix
            home-manager.darwinModules.home-manager {
              # home-manager.useGlobalPkgs = true;
              # home-manager.useUserPackages = true;
              home-manager.users.lyzh = {
                imports = [
                  ./home/darwin-home.nix
                  ({ config, ... }: {
                      _module.args = {
                        dotfiles=dotfiles;
                    };
                  })
                  # (import "${home-config}/home/darwin-home.nix")
                  (import "${home-config}/home/shell.nix")
                  (import "${home-config}/home/dev.nix")
                  ({ pkgs, ... }: {
                    nixpkgs.overlays = [ rust-overlay.overlays.default ];
                  })
                ];
              };
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
