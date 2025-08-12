
## first install nix-darwin or nix

## usage

### first bootload

```sh
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .#macmini
```

```sh
sudo darwin-rebuild switch --flake .#macbook
```

## use in home-manager(mac)
```sh
home-manager switch --flake .#mac
```
