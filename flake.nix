{
  description = "Lyzh's Nix-Darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    home-config.url = "github:imlyzh/home-manager";
    dotfiles = {
      url = "github:imlyzh/dotfiles";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nix-darwin, home-config, dotfiles, ... }@inputs:
    {
      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
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
                ];
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
