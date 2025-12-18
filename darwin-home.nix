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
    settings.user = {
      name = "imlyzh";
      email = "enterindex@gmail.com";
    };
  };

  # home.packages = with pkgs; [];

  home.sessionVariables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    EDITOR = "nvim";

    # CC = "clang";
    # CXX = "clang++";

    # QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins";
    # QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins:${pkgs.qt5.full}/lib/qt-5/plugins";
  };

  # xdg.configFile."ghostty/config.toml".source = "${dotfiles}/.config/ghostty/config.toml";
  # xdg.configFile."helix/config.toml".source = "${dotfiles}/.config/helix/config.toml";
}
