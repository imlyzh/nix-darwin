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
    zsh

    the-unarchiver

    raycast           # 新一代应用启动器
    rectangle         # 开源窗口管理

    iterm2
    syncplay
    iina
    localsend
    appcleaner
    keycastr
    # ollama

    zed-editor

    obsidian
    # logseq
    # teamspeak3
    # teamspeak_client
    # teamspeak_server

    firefox
    discord
    spotify
    telegram-desktop
    transmission_4-gtk
    whisky

    pkgs.qt5.full
    pkgs.qt6.full
    mumble
    # qbittorrent
    qbittorrent-enhanced
  ];

  home.sessionVariables = {
    QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins:${pkgs.qt5.full}/lib/qt-5/plugins";
  };

  home.file = {
    ".config/ghostty/config.toml".text = "${dotfiles}/.config/ghostty/config.toml";
  };
}
