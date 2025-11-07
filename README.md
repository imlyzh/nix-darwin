# README

## first install nixos or nix-determinate

## usage

### first bootload

```sh
sudo nix run nix-darwin -- switch --flake .#macbook
```

```sh
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .#macmini
```

```sh
sudo darwin-rebuild switch --flake .#macbook
```

## use in home-manager

```sh
home-manager switch --flake .#mac
```
