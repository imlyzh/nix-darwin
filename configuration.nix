{ config, pkgs, inputs, ... }:
{
  nix.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  system.stateVersion = 6;
  system.primaryUser = "lyzh";

  users.users.lyzh = {
    name = "lyzh";
    home = "/Users/lyzh";
  };

  environment.systemPackages = with pkgs; [
    mumble
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

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
      # autohide = true;
      show-recents = false;
      static-only = false;
      mru-spaces = false;
      appswitcher-all-displays = true;
      scroll-to-open = true;
      wvous-bl-corner = 7;
    };
    finder = {
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;   # 显示所有文件扩展名
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "Nlsv"; # 默认使用列表视图 ("Nlsv": 列表, "icnv": 图标, "clmv": 分栏)
      FXEnableExtensionChangeWarning = false;
      _FXShowPosixPathInTitle = true; # 在标题栏显示完整路径
      _FXSortFoldersFirst = true;
      NewWindowTarget = "Home";
      QuitMenuItem = false;
      ShowMountedServersOnDesktop = true;
      ShowPathbar = true;
      ShowStatusBar = true;
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
    lxgw-wenkai
    source-code-pro
    hack-font
    fira-code
    nerd-fonts.fira-code
    jetbrains-mono
  ];
}
