{ lib, pkgs, ... }:

with lib.gvariant;

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  # lightdm customization
  services.xserver.displayManager.lightdm.greeters.gtk = {
    theme.name = "Mint-Y-Dark-Orange";
    iconTheme.name = "Mint-Y-Yaru";
    cursorTheme.name = "macOS";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # disable cinnamon default apps
  services.cinnamon.apps.enable = false;

  # dconf generated using dconf2nix
  # https://github.com/gvolpe/dconf2nix
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/cinnamon" = {
            enabled-applets = [
              "panel1:left:0:menu@cinnamon.org:0"
              "panel1:left:1:separator@cinnamon.org:1"
              "panel1:left:2:grouped-window-list@cinnamon.org:2"
              "panel1:right:0:systray@cinnamon.org:3"
              "panel1:right:1:xapp-status@cinnamon.org:4"
              "panel1:right:2:notifications@cinnamon.org:5"
              "panel1:right:3:printers@cinnamon.org:6"
              "panel1:right:4:removable-drives@cinnamon.org:7"
              "panel1:right:5:keyboard@cinnamon.org:8"
              "panel1:right:6:favorites@cinnamon.org:9"
              "panel1:right:7:network@cinnamon.org:10"
              "panel1:right:8:sound@cinnamon.org:11"
              "panel1:right:9:power@cinnamon.org:12"
              "panel1:right:10:calendar@cinnamon.org:13"
              "panel1:right:11:cornerbar@cinnamon.org:14"
            ];
            favorite-apps = [
              "firefox.desktop"
              "cinnamon-settings.desktop"
              "org.gnome.Terminal.desktop"
              "nemo.desktop"
            ];
            next-applet-id = mkInt32 15;
            panel-edit-mode = false;
            panel-zone-icon-sizes = "[{\"panelId\":1,\"left\":0,\"center\":0,\"right\":24}]";
            panel-zone-symbolic-icon-sizes = "[{\"panelId\": 1, \"left\": 28, \"center\": 28, \"right\": 16}]";
            panel-zone-text-sizes = "[{\"panelId\":1,\"left\":0,\"center\":0,\"right\":0}]";
            panels-autohide = [
              "1:false"
              "2:false"
            ];
            panels-enabled = [ "1:0:bottom" ];
            panels-height = [
              "1:48"
              "2:40"
            ];
            panels-hide-delay = [
              "1:0"
              "2:0"
            ];
            panels-show-delay = [
              "1:0"
              "2:0"
            ];
          };

          "org/cinnamon/cinnamon-session" = {
            quit-time-delay = mkInt32 60;
          };

          "org/gnome/desktop/input-sources" = {
            sources = [
              (mkTuple [
                "xkb"
                "pl"
              ])
            ];
          };

          "org/cinnamon/desktop/interface" = {
            clock-show-date = true;
            clock-show-seconds = true;
            cursor-size = mkInt32 24;
            cursor-theme = "macOS";
            font-name = "Ubuntu 10";
            gtk-theme = "Mint-Y-Dark-Orange";
            icon-theme = "Mint-Y-Yaru";
            text-scaling-factor = 1.0;
            toolkit-accessibility = false;
          };

          "org/cinnamon/desktop/notifications" = {
            bottom-notifications = true;
            display-notifications = true;
            notification-duration = mkInt32 4;
          };

          "org/cinnamon/desktop/peripherals/keyboard" = {
            numlock-state = true;
          };

          "org/cinnamon/desktop/peripherals/mouse" = {
            accel-profile = "flat";
            double-click = mkInt32 540;
            drag-threshold = mkInt32 8;
            speed = 0.0;
          };

          "org/cinnamon/desktop/peripherals/touchpad" = {
            speed = 0.0;
          };

          "org/cinnamon/desktop/screensaver" = {
            layout-group = mkInt32 0;
          };

          "org/cinnamon/desktop/sound" = {
            event-sounds = false;
          };

          "org/cinnamon/gestures" = {
            enabled = false;
            pinch-percent-threshold = mkUint32 40;
            swipe-down-2 = "PUSH_TILE_DOWN::end";
            swipe-down-3 = "TOGGLE_OVERVIEW::end";
            swipe-down-4 = "VOLUME_DOWN::end";
            swipe-left-2 = "PUSH_TILE_LEFT::end";
            swipe-left-3 = "WORKSPACE_NEXT::end";
            swipe-left-4 = "WINDOW_WORKSPACE_PREVIOUS::end";
            swipe-percent-threshold = mkUint32 60;
            swipe-right-2 = "PUSH_TILE_RIGHT::end";
            swipe-right-3 = "WORKSPACE_PREVIOUS::end";
            swipe-right-4 = "WINDOW_WORKSPACE_NEXT::end";
            swipe-up-2 = "PUSH_TILE_UP::end";
            swipe-up-3 = "TOGGLE_EXPO::end";
            swipe-up-4 = "VOLUME_UP::end";
            tap-3 = "MEDIA_PLAY_PAUSE::end";
          };

          "org/cinnamon/launcher" = {
            check-frequency = mkInt32 300;
            memory-limit = mkInt32 2048;
          };

          "org/cinnamon/muffin" = {
            tile-maximize = true;
          };

          "org/cinnamon/settings-daemon/peripherals/keyboard" = {
            numlock-state = "on";
          };

          "org/cinnamon/settings-daemon/plugins/color" = {
            night-light-last-coordinates = mkTuple [
              52.25
              21.0
            ];
          };

          "org/cinnamon/settings-daemon/plugins/power" = {
            lid-close-ac-action = "suspend";
            lid-close-battery-action = "suspend";
            lid-close-suspend-with-external-monitor = false;
            sleep-display-ac = mkInt32 600;
            sleep-display-battery = mkInt32 600;
            sleep-inactive-ac-timeout = mkInt32 0;
            sleep-inactive-battery-timeout = mkInt32 0;
          };

          "org/cinnamon/settings-daemon/plugins/xsettings" = {
            antialiasing = "rgba";
            buttons-have-icons = false;
            hinting = "slight";
          };

          "org/cinnamon/theme" = {
            name = "Mint-Y-Dark-Orange";
          };
        };
      }
    ];
  };
}
