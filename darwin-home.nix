{ config, lib, pkgs, dotfiles, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/Users/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = lib.mkDefault pkgs.nix;
  # nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # home.packages = with pkgs; [];

  home.sessionVariables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    EDITOR = "nvim";
  };
}
