{ config, lib, pkgs, ... }:
{
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # nix.package = lib.mkDefault pkgs.nix;

  home.username = "lyzh";
  home.homeDirectory = "/Users/lyzh";
  home.stateVersion = "26.05";

  # home.packages = with pkgs; [];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
  
    initContent = ''
    if [ -f $HOME/.zshenv.local ]; then
      source $HOME/.zshenv.local
    fi
  '';
  };

  home.sessionVariables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    EDITOR = "nvim";
  };
}
