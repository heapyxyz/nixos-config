{ lib, pkgs, ... }:

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
    nautilus
    gnome-extension-manager
    gnome-tweaks

    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
  ];

  # dconf generated using dconf2nix
  # https://github.com/gvolpe/dconf2nix
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
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
            cursor-blink-time = mkInt32 1200;
            cursor-blink-timeout = mkInt32 10;
            cursor-size = mkInt32 24;
            cursor-theme = "macOS";
            document-font-name = "Inter Medium 10";
            enable-animations = true;
            font-antialiasing = "grayscale";
            font-name = "Inter Medium 10";
            gtk-enable-primary-paste = false;
            gtk-key-theme = "Default";
            gtk-theme = "Adwaita";
            gtk-timeout-initial = mkInt32 200;
            gtk-timeout-repeat = mkInt32 20;
            icon-theme = "Adwaita";
            monospace-font-name = "JetBrainsMono Nerd Font Medium 10";
            scaling-factor = mkUint32 0;
            text-scaling-factor = 1.0;
          };

          "org/gnome/desktop/peripherals/mouse" = {
            accel-profile = "flat";
            double-click = mkInt32 540;
            drag-threshold = mkInt32 8;
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
            recent-files-max-age = mkInt32 7;
            remember-recent-files = true;
            remove-old-temp-files = true;
            remove-old-trash-files = true;
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
            auto-raise-delay = mkInt32 500;
            button-layout = ":minimize,maximize,close";
            disable-workarounds = false;
            focus-mode = "click";
            focus-new-windows = "smart";
            mouse-button-modifier = "<Alt>";
            num-workspaces = mkInt32 4;
            raise-on-click = true;
            resize-with-right-button = true;
            titlebar-font = "Inter Bold 10";
            titlebar-uses-system-font = false;
            visual-bell = false;
            visual-bell-type = "fullscreen-flash";
          };

          "org/gnome/settings-daemon/plugins/media-keys" = {
            screenshot = [ "<Super><Shift>s" ];
            # screenshot = [ "Print" "<Super><Shift>s" ];
          };

          "org/gnome/mutter" = {
            overlay-key = "Super";
          };

          "org/gnome/shell" = {
            enabled-extensions = [
              "blur-my-shell@aunetx"
              "just-perfection-desktop@just-perfection"
            ];
            favorite-apps = [
              "brave-browser.desktop"
              "code.desktop"
              "com.mitchellh.ghostty.desktop"
              "equibop.desktop"
            ];
          };

          "org/gnome/shell/extensions/blur-my-shell" = {
            settings-version = mkInt32 2;
          };

          "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
            brightness = 0.6;
            sigma = mkInt32 30;
          };

          "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
            blur = true;
            brightness = 0.6;
            sigma = mkInt32 30;
            static-blur = true;
            style-dash-to-dock = mkInt32 0;
          };

          "org/gnome/shell/extensions/blur-my-shell/panel" = {
            brightness = 0.6;
            sigma = mkInt32 30;
          };

          "org/gnome/shell/extensions/blur-my-shell/window-list" = {
            brightness = 0.6;
            sigma = mkInt32 30;
          };

          "org/gnome/shell/extensions/just-perfection" = {
            support-notifier-showed-version = mkInt32 36;
          };

          "org/gnome/tweaks" = {
            show-extensions-notice = false;
          };
        };
      }
    ];
  };
}
