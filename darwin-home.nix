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
    tailscale

    stats
    hidden-bar
    ice-bar

    raycast           # 新一代应用启动器
    rectangle         # 开源窗口管理

    keycastr
    appcleaner

    iterm2
    iina
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
