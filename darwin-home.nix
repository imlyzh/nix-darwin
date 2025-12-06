{ config, lib, pkgs, dotfiles, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/Users/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = lib.mkDefault pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    # userName = "imlyzh";
    # userEmail = "enterindex@gmail.com";
    settings.user = {
      name = "imlyzh";
      email = "enterindex@gmail.com";
    };
  };

  home.packages = with pkgs; [
    # tailscale

    # raycast
    # rectangle
    # keycastr
    # appcleaner

    # iterm2
    # iina
  ];


  home.sessionVariables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    EDITOR = "nvim";

    # CC = "clang";
    # CXX = "clang++";

    # QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins";
    # QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins:${pkgs.qt5.full}/lib/qt-5/plugins";
  };

  home.file = {
    ".config/ghostty/config.toml".text = "${dotfiles}/.config/ghostty/config.toml";
  };
}
