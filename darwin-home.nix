{ config, lib, pkgs, dotfiles, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = lib.mkDefault pkgs.nix;

  home = {
    username = "lyzh";
    homeDirectory = "/Users/lyzh";
    stateVersion = "25.05";
  };

  # home.packages = with pkgs; [];

  programs.home-manager.enable = true;
  programs.zsh.enable = false;

  home.sessionVariables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    EDITOR = "nvim";
  };
}
