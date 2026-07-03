{
  config,
  lib,
  pkgs,
  ...
}:

with lib.gvariant;

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    decibels # audio player
    loupe # image viewer
    nautilus # files app
    showtime # video player

    # gnome utilities
    gnome-disk-utility
    gnome-extension-manager
    gnome-tweaks

    # gnome extensions
    gnomeExtensions.appindicator
    gnomeExtensions.emoji-copy
  ];

  # dconf generated using dconf2nix
  # https://github.com/gvolpe/dconf2nix
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/app-folders" = {
            # override default folder list
            folder-children = mkEmptyArray type.string;
          };

          "org/gnome/desktop/background" = {
            color-shading-type = "solid";
            picture-options = "zoom";
            picture-uri = "file:///home/heapy/.local/share/backgrounds/tahoe-dark.jpeg";
            picture-uri-dark = "file:///home/heapy/.local/share/backgrounds/tahoe-dark.jpeg";
            primary-color = "#000000000000";
            secondary-color = "#000000000000";
          };

          "org/gnome/desktop/input-sources" = {
            current = mkUint32 0;
            show-all-sources = false;
            sources = [
              (mkTuple [
                "xkb"
                "pl"
              ])
            ];
            xkb-options = [ "terminate:ctrl_alt_bksp" ];
          };

          "org/gnome/desktop/interface" = {
            clock-format = "24h";
            clock-show-date = true;
            clock-show-seconds = true;
            color-scheme = "prefer-dark";
            cursor-blink = true;
            cursor-blink-time = mkUint32 1200;
            cursor-blink-timeout = mkUint32 10;
            cursor-size = mkUint32 24;
            cursor-theme = "macOS";
            document-font-name = "JetBrainsMono Nerd Font 10";
            enable-animations = true;
            font-antialiasing = "grayscale";
            font-name = "JetBrainsMono Nerd Font 10";
            gtk-enable-primary-paste = false;
            gtk-key-theme = "Default";
            gtk-theme = "Adwaita";
            gtk-timeout-initial = mkUint32 200;
            gtk-timeout-repeat = mkUint32 20;
            icon-theme = "MacTahoe-dark-bold'";
            monospace-font-name = "JetBrainsMono Nerd Font 10";
            scaling-factor = mkUint32 0;
            text-scaling-factor = 1.0;
            show-battery-percentage = true;
          };

          "org/gnome/desktop/peripherals/mouse" = {
            accel-profile = "flat";
            double-click = mkUint32 540;
            drag-threshold = mkUint32 8;
            left-handed = false;
            middle-click-emulation = false;
            natural-scroll = false;
            speed = 0.0;
          };

          "org/gnome/desktop/peripherals/touchpad" = {
            click-method = "areas";
            speed = 0.022;
            two-finger-scrolling-enabled = true;
          };

          "org/gnome/desktop/privacy" = {
            disable-camera = true;
            disable-microphone = false;
            disable-sound-output = false;
            old-files-age = mkUint32 30;
            recent-files-max-age = mkUint32 7;
            remember-recent-files = true;
            remove-old-temp-files = true;
            remove-old-trash-files = true;
          };

          "org/gnome/desktop/screensaver" = {
            color-shading-type = "solid";
            picture-options = "zoom";
            picture-uri = "file:///home/heapy/.local/share/backgrounds/tahoe-dark.jpeg";
            primary-color = "#000000000000";
            secondary-color = "#000000000000";
          };

          "org/gnome/desktop/sound" = {
            event-sounds = false;
            input-feedback-sounds = false;
            theme-name = "adwaita";
          };

          "org/gnome/desktop/wm/preferences" = {
            action-double-click-titlebar = "toggle-maximize";
            action-middle-click-titlebar = "lower";
            action-right-click-titlebar = "menu";
            audible-bell = false;
            auto-raise = false;
            auto-raise-delay = mkUint32 500;
            button-layout = ":minimize,maximize,close";
            disable-workarounds = false;
            focus-mode = "click";
            focus-new-windows = "smart";
            mouse-button-modifier = "<Alt>";
            num-workspaces = mkUint32 4;
            raise-on-click = true;
            resize-with-right-button = true;
            titlebar-font = "JetBrainsMono Nerd Font Bold 10";
            titlebar-uses-system-font = false;
            visual-bell = false;
            visual-bell-type = "fullscreen-flash";
          };

          "org/gnome/settings-daemon/plugins/media-keys" = {
            screenshot = [ "<Super><Shift>s" ];
          };

          "org/gnome/mutter" = {
            overlay-key = "Super";
          };

          "org/gnome/shell" = {
            favorite-apps = [
              "brave-browser.desktop"
              "equibop.desktop"
              "code.desktop"
              "org.gnome.Nautilus.desktop"
              "com.mitchellh.ghostty.desktop"
            ];
          };

          "org/gnome/shell/extensions/appindicator" = {
            icon-brightness = 0.0;
            icon-contrast = 0.0;
            icon-opacity = mkUint32 240;
            icon-saturation = 0.0;
            icon-size = mkUint32 0;
          };

          "org/gnome/tweaks" = {
            show-extensions-notice = false;
          };

          "org/gnome/shell/keybindings" = {
            show-screenshot-ui = [ "<Shift><Super>s" ];
          };

          "org/gnome/desktop/wm/keybindings" = {
            switch-windows = [ "<Alt>Tab" ];
          };
        };
      }
    ];
  };
}
