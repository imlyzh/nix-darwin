{ config, lib, pkgs, dotfiles, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/Users/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = lib.mkDefault pkgs.nix;
  # nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
  ];

  # home.sessionVariables = {
  #   QT_PLUGIN_PATH = "${pkgs.qt5.qtbase}/plugins";
  # };

  home.file = {
    ".config/ghostty/config.toml".text = "${dotfiles}/.config/ghostty/config.toml";
  };
}
