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
    nautilus
    gnome-extension-manager
    gnome-tweaks

    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.open-bar
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
            picture-uri = "file:///home/heapy/.local/share/backgrounds/background.jpeg";
            picture-uri-dark = "file:///home/heapy/.local/share/backgrounds/background.jpeg";
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
            document-font-name = "Inter Medium 10";
            enable-animations = true;
            font-antialiasing = "grayscale";
            font-name = "Inter Medium 10";
            gtk-enable-primary-paste = false;
            gtk-key-theme = "Default";
            gtk-theme = "Adwaita";
            gtk-timeout-initial = mkUint32 200;
            gtk-timeout-repeat = mkUint32 20;
            icon-theme = "Adwaita";
            monospace-font-name = "JetBrainsMono Nerd Font Regular 10";
            scaling-factor = mkUint32 0;
            text-scaling-factor = 1.0;
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
            picture-uri = "file:///home/heapy/.local/share/backgrounds/background.jpeg";
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
            titlebar-font = "Inter Bold 10";
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
            enabled-extensions = [
              "just-perfection-desktop@just-perfection"
              "appindicatorsupport@rgcjonas.gmail.com"
              "openbar@neuromorph"
              "dash-to-dock@micxgx.gmail.com"
            ];
            favorite-apps = [
              "brave-browser.desktop"
              "code.desktop"
              "org.gnome.Nautilus.desktop"
              "com.mitchellh.ghostty.desktop"
              "equibop.desktop"
            ];
          };

          "org/gnome/shell/extensions/appindicator" = {
            icon-brightness = 0.0;
            icon-contrast = 0.0;
            icon-opacity = mkUint32 240;
            icon-saturation = 0.0;
            icon-size = mkUint32 0;
          };

          "org/gnome/shell/extensions/dash-to-dock" = {
            apply-custom-theme = true;
            autohide-in-fullscreen = false;
            background-opacity = 0.0;
            custom-background-color = false;
            custom-theme-shrink = false;
            customize-alphas = true;
            dash-max-icon-size = mkUint32 48;
            disable-overview-on-startup = false;
            dock-position = "BOTTOM";
            extend-height = false;
            height-fraction = 0.9;
            icon-size-fixed = false;
            intellihide-mode = "ALL_WINDOWS";
            max-alpha = 1.0;
            middle-click-action = "launch";
            min-alpha = 0.6;
            multi-monitor = false;
            preferred-monitor = "-2";
            preferred-monitor-by-connector = "eDP-1";
            preview-size-scale = 0.0;
            require-pressure-to-show = false;
            running-indicator-style = "DOTS";
            shift-click-action = "minimize";
            shift-middle-click-action = "launch";
            show-apps-at-top = false;
            show-dock-urgent-notify = false;
            show-mounts-network = false;
            transparency-mode = "DEFAULT";
          };

          "org/gnome/shell/extensions/just-perfection" = {
            dash-icon-size = mkUint32 0;
            support-notifier-showed-version = mkUint32 36;
          };

          "shell/extensions/openbar" = {
            accent-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            accent-override = true;
            apply-accent-shell = true;
            apply-all-shell = false;
            apply-flatpak = true;
            apply-gtk = true;
            apply-menu-notif = true;
            apply-menu-shell = true;
            auto-bgalpha = false;
            autofg-bar = true;
            autofg-menu = false;
            autohg-bar = false;
            autohg-menu = false;
            autotheme-dark = "Pastel";
            autotheme-font = true;
            autotheme-light = "Pastel";
            autotheme-refresh = true;
            balpha = 0.5;
            bartype = "Islands";
            bcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            bg-change = false;
            bgalpha = 0.0;
            bgalpha2 = 0.0;
            bgcolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            bgcolor-wmax = [
              "0.118"
              "0.118"
              "0.118"
            ];
            bgcolor2 = [
              "0.812"
              "0.824"
              "0.906"
            ];
            bgpalette = true;
            bguri = "file:///home/heapy/.local/share/backgrounds/2026-04-30-22-20-02-26-Tahoe-Dark-6K-thumb.jpeg";
            border-wmax = false;
            bottom-margin = 0.0;
            boxalpha = 0.0;
            boxcolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            bradius = 24.0;
            buttonbg-wmax = false;
            bwidth = 4.0;
            candy1 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy10 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy11 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy12 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy13 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy14 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy15 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy16 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy2 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy3 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy4 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy5 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy6 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy7 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy8 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candy9 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            candyalpha = 0.5;
            candybar = true;
            card-hint = mkUint32 10;
            color-scheme = "prefer-dark";
            corner-radius = true;
            count1 = mkUint32 324129;
            count10 = mkUint32 6093;
            count11 = mkUint32 791;
            count12 = mkUint32 6;
            count2 = mkUint32 181674;
            count3 = mkUint32 169513;
            count4 = mkUint32 129197;
            count5 = mkUint32 89645;
            count6 = mkUint32 62274;
            count7 = mkUint32 19320;
            count8 = mkUint32 9528;
            count9 = mkUint32 7830;
            cust-margin-wmax = false;
            dark-accent-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-bcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-bgcolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            dark-bgcolor-wmax = [
              "0.118"
              "0.118"
              "0.118"
            ];
            dark-bgcolor2 = [
              "0.812"
              "0.824"
              "0.906"
            ];
            dark-bguri = "file:///home/heapy/.local/share/backgrounds/2026-04-30-22-20-02-26-Tahoe-Dark-6K-thumb.jpeg";
            dark-boxcolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            dark-candy1 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy10 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy11 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy12 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy13 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy14 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy15 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy16 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy2 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy3 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy4 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy5 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy6 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy7 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy8 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-candy9 = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-dbgcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-fgcolor = [
              "1.000"
              "1.000"
              "1.000"
            ];
            dark-hcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-hscd-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-iscolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            dark-mbcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-mbgcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-mfgcolor = [
              "1.000"
              "1.000"
              "1.000"
            ];
            dark-mhcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-mscolor = [
              "0.259"
              "0.373"
              "0.753"
            ];
            dark-mshcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            dark-palette1 = [
              "25"
              "43"
              "148"
            ];
            dark-palette10 = [
              "53"
              "36"
              "188"
            ];
            dark-palette11 = [
              "100"
              "108"
              "165"
            ];
            dark-palette12 = [
              "132"
              "132"
              "197"
            ];
            dark-palette2 = [
              "4"
              "4"
              "38"
            ];
            dark-palette3 = [
              "7"
              "12"
              "71"
            ];
            dark-palette4 = [
              "78"
              "80"
              "195"
            ];
            dark-palette5 = [
              "16"
              "27"
              "99"
            ];
            dark-palette6 = [
              "71"
              "93"
              "167"
            ];
            dark-palette7 = [
              "62"
              "73"
              "152"
            ];
            dark-palette8 = [
              "102"
              "119"
              "176"
            ];
            dark-palette9 = [
              "135"
              "150"
              "207"
            ];
            dark-shcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            dark-smbgcolor = [
              "0.400"
              "0.467"
              "0.690"
            ];
            dark-vw-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dark-winbcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dashdock-style = "Menu";
            dbgalpha = 0.5;
            dbgcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            dbradius = 24.0;
            default-font = "Sans 12";
            disize = 48.0;
            dshadow = false;
            fgalpha = 1.0;
            fgcolor = [
              "1.000"
              "1.000"
              "1.000"
            ];
            fitts-widgets = true;
            font = "Inter Bold 10";
            gradient = false;
            gtk-popover = true;
            gtk-shadow = "Default";
            gtk-transparency = 1.0;
            halpha = 1.0;
            hbar-gtk3only = true;
            hcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            headerbar-hint = mkUint32 10;
            heffect = true;
            height = 42.0;
            hpad = 2.0;
            hscd-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            import-export = false;
            isalpha = 0.0;
            iscolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            light-bcolor = [
              "0.027"
              "0.047"
              "0.278"
            ];
            light-bgcolor = [
              "0.243"
              "0.286"
              "0.596"
            ];
            light-bgcolor-wmax = [
              "0.922"
              "0.922"
              "0.922"
            ];
            light-bgcolor2 = [
              "0.812"
              "0.824"
              "0.906"
            ];
            light-bguri = "file:///home/heapy/.local/share/backgrounds/background.jpeg";
            light-boxcolor = [
              "0.243"
              "0.286"
              "0.596"
            ];
            light-hcolor = [
              "0.016"
              "0.016"
              "0.149"
            ];
            light-hscd-color = [
              "0.259"
              "0.373"
              "0.753"
            ];
            light-iscolor = [
              "0.243"
              "0.286"
              "0.596"
            ];
            light-mbcolor = [
              "0.016"
              "0.016"
              "0.149"
            ];
            light-mbgcolor = [
              "0.682"
              "0.714"
              "0.808"
            ];
            light-mhcolor = [
              "0.016"
              "0.016"
              "0.149"
            ];
            light-mscolor = [
              "0.259"
              "0.373"
              "0.753"
            ];
            light-mshcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            light-palette1 = [
              "25"
              "43"
              "148"
            ];
            light-palette10 = [
              "53"
              "36"
              "188"
            ];
            light-palette11 = [
              "100"
              "108"
              "165"
            ];
            light-palette12 = [
              "132"
              "132"
              "197"
            ];
            light-palette2 = [
              "4"
              "4"
              "38"
            ];
            light-palette3 = [
              "7"
              "12"
              "71"
            ];
            light-palette4 = [
              "78"
              "80"
              "195"
            ];
            light-palette5 = [
              "16"
              "27"
              "99"
            ];
            light-palette6 = [
              "71"
              "93"
              "167"
            ];
            light-palette7 = [
              "62"
              "73"
              "152"
            ];
            light-palette8 = [
              "102"
              "119"
              "176"
            ];
            light-palette9 = [
              "135"
              "150"
              "207"
            ];
            light-shcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            light-smbgcolor = [
              "0.812"
              "0.824"
              "0.906"
            ];
            light-vw-color = [
              "0.259"
              "0.373"
              "0.753"
            ];
            light-winbcolor = [
              "0.259"
              "0.373"
              "0.753"
            ];
            margin = 0.0;
            margin-wmax = 0.0;
            mbalpha = 0.5;
            mbcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            mbg-gradient = false;
            mbgalpha = 0.5;
            mbgcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            menu-radius = 24.0;
            mfgalpha = 1.0;
            mfgcolor = [
              "1.000"
              "1.000"
              "1.000"
            ];
            mhalpha = 0.25;
            mhcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            monitor-height = mkUint32 1080;
            monitor-width = mkUint32 1920;
            msalpha = 0.5;
            mscolor = [
              "0.259"
              "0.373"
              "0.753"
            ];
            mshalpha = 0.2;
            mshcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            neon = false;
            neon-wmax = false;
            notif-radius = 12.0;
            palette1 = [
              "25"
              "43"
              "148"
            ];
            palette10 = [
              "53"
              "36"
              "188"
            ];
            palette11 = [
              "100"
              "108"
              "165"
            ];
            palette12 = [
              "132"
              "132"
              "197"
            ];
            palette2 = [
              "4"
              "4"
              "38"
            ];
            palette3 = [
              "7"
              "12"
              "71"
            ];
            palette4 = [
              "78"
              "80"
              "195"
            ];
            palette5 = [
              "16"
              "27"
              "99"
            ];
            palette6 = [
              "71"
              "93"
              "167"
            ];
            palette7 = [
              "62"
              "73"
              "152"
            ];
            palette8 = [
              "102"
              "119"
              "176"
            ];
            palette9 = [
              "135"
              "150"
              "207"
            ];
            pause-reload = false;
            position = "Top";
            radius-bottomleft = true;
            radius-bottomright = true;
            radius-topleft = true;
            radius-topright = true;
            reloadstyle = true;
            sbar-gradient = "none";
            set-bottom-margin = false;
            set-fullscreen = true;
            set-notif-position = true;
            set-overview = false;
            set-yarutheme = false;
            shadow = false;
            shalpha = 0.32;
            shcolor = [
              "0.000"
              "0.000"
              "0.000"
            ];
            sidebar-hint = mkUint32 10;
            smbgcolor = [
              "0.400"
              "0.467"
              "0.690"
            ];
            smbgoverride = false;
            traffic-light = false;
            trigger-autotheme = false;
            trigger-reload = false;
            view-hint = mkUint32 10;
            vpad = 4.0;
            vw-color = [
              "0.278"
              "0.365"
              "0.655"
            ];
            width-bottom = true;
            width-top = true;
            winbalpha = 1.0;
            winbcolor = [
              "0.278"
              "0.365"
              "0.655"
            ];
            winbradius = 12.0;
            winbwidth = 0.0;
            window-hint = mkUint32 10;
            wmax-hbarhint = false;
            wmaxbar = true;
          };

          "org/gnome/tweaks" = {
            show-extensions-notice = false;
          };
        };
      }
    ];
  };
}
