{ config, pkgs, inputs, ... }:
{
  nix.enable = false;

  system.stateVersion = 6;
  system.primaryUser = "lyzh";

  users.users.lyzh = {
    name = "lyzh";
    home = "/Users/lyzh";
  };

  environment.systemPackages = with pkgs; [
    tailscale
    zsh

    raycast           # 新一代应用启动器
    rectangle         # 开源窗口管理
    keycastr
    # appcleaner

    iterm2
    iina

    keka

    # firefox
    # firefox-devedition

    # discord
    # spotify
    # obsidian
  ];

  environment.variables = {
    RUSTUP_HOME = "\${HOME}/.rustup";
    CARGO_HOME = "\${HOME}/.cargo";
    CC = "clang";
    CXX = "clang++";
    QT_PLUGIN_PATH = "${pkgs.qt6.full}/lib/qt-6/plugins:${pkgs.qt5.full}/lib/qt-5/plugins";
    EDITOR = "nvim";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.defaults = {
    # universalaccess.reduceMotion = true;

    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowAllFiles = true;
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
    NSGlobalDomain.NSUseAnimatedFocusRing = false;
    ActivityMonitor.IconType = 0;
    WindowManager = {
      EnableTiledWindowMargins = false;
    };
    controlcenter = {
      BatteryShowPercentage = true;
    };
    dock = {
      autohide = true;
      show-recents = true;
      mru-spaces = false;
      appswitcher-all-displays = true;
      expose-group-apps = true;
      scroll-to-open = true;
      wvous-bl-corner = 7;
    };
    finder = {
      AppleShowAllFiles = true;
      _FXShowPosixPathInTitle = true; # 在标题栏显示完整路径
      AppleShowAllExtensions = true;   # 显示所有文件扩展名
      FXDefaultSearchScope = "SCcf";
      NewWindowTarget = "Home";
      QuitMenuItem = false;
      ShowMountedServersOnDesktop = true;
      ShowPathbar = true;
      ShowStatusBar = false;
      _FXSortFoldersFirst = true;
      FXEnableExtensionChangeWarning = false;
    };
    screencapture = {
      target = "clipboard"; # "file" "preview"
    };
  };
  system = {
    keyboard = {
      enableKeyMapping = true;
      # remapCapsLockToControl = true;
      remapCapsLockToEscape = true;
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    sarasa-gothic  #更纱黑体
    source-code-pro
    hack-font
    fira-code
    nerd-fonts.fira-code
    jetbrains-mono
  ];
}
