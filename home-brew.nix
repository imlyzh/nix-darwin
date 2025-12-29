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
    "raycast"
    "rectangle"
    "keycastr"
    "jordanbaird-ice"
    "stats"
    "keka"
    "appcleaner"
    "localsend"
    "squirrel-app"

    # improve life
    "iina"
    "vlc"
    # "mpv"
    "obs"
    "anki"
    "motrix"
    "zotero"
    "mumble"
    "syncplay"
    "balenaetcher"
    "grandperspective"
    "c0re100-qbittorrent" # qbittorrent-enhanced
    "thunderbird"

    "chatwise"
    "telegram"
    "steam"

    # optional
    "rustdesk"
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
  ];
  # homebrew.masApps = {};
  # homebrew.onActivation.upgrade = true;
}
