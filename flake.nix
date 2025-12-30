{
  description = "Lyzh's Nix-Darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    rime-ice = {
      url = "github:iDvel/rime-ice";
      flake = false;
    };

    rime-without-ice = {
      url = "github:imlyzh/rime-without-ice";
      flake = false;
    };

    home-config.url = "github:imlyzh/home-manager";
    dotfiles = {
      url = "github:imlyzh/dotfiles";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nix-darwin, home-config, dotfiles, ... }@inputs:
    rec {
      darwinConfigurations = {
        "mac" = nix-darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
          };
          modules = [
            ./configuration.nix
            ./home-brew.nix
            home-manager.darwinModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.lyzh = {
                imports = [
                  ./darwin-home.nix
                  ({ ... }: {
                      _module.args = {
                        dotfiles=dotfiles;
                    };
                  })
                  (import "${home-config}/home/common.nix")
                ];
              };
            }
          ];
        };
        "mac-without-brew" = nix-darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
          };
          modules = [
            ./configuration.nix
            home-manager.darwinModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.lyzh = {
                imports = [
                  ./darwin-home.nix
                  ({ ... }: {
                      _module.args = {
                        dotfiles=dotfiles;
                    };
                  })
                  (import "${home-config}/home/common.nix")
                ];
              };
            }
          ];
        };
      };
      packages.aarch64-darwin.default = darwinConfigurations."mac".system;
    };
}
