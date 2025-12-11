{ ... }:
{
  homebrew.enable = true;
  # homebrew.formulae = [];
  homebrew.casks = [
    # necessary
    "clash-verge-rev"
    "tailscale-app"

    # necessary for development
    "visual-studio-code"
    "ghostty"
    "iterm2"
    "firefox"

    # cover Apple’s mess
    "rectangle"
    "keycastr"
    # "raycast"
    "jordanbaird-ice"

    # improve life
    "localsend"
    "appcleaner"
    "keka"
    "stats"

    "iina"
    "vlc"
    # "mpv"
    "obs"
    "anki"
    "motrix"
    "zotero"
    # "mumble"
    "syncplay"
    "balenaetcher"
    "disk-inventory-x"
    "c0re100-qbittorrent" # qbittorrent-enhanced

    "chatwise"
    "telegram"
    "steam"

    # optional
    "github"
    "onyx"
    "folo"

    "ungoogled-chromium"

    "orbstack"
    # "ollama"

    # "firefox@developer-edition"
    # "jetbrains-toolbox"
    # "zed"

    # "adguard"
    # "discord"
    # "spotify"
    # "logseq"
    # "obsidian"
    # "thunderbird"
  ];
  # homebrew.masApps = {};
  # homebrew.onActivation.upgrade = true;
}
