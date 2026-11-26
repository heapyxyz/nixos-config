{
  pkgs,
  lib,
  desktop,
  ...
}:

{
  services.displayManager.gdm = {
    enable = true;
    # make icons/cursor available to the gdm greeter
    extraPackages = with pkgs; [
      apple-cursor
      (mactahoe-icon-theme.override { withBold = true; })
    ];
  };
  services.desktopManager.gnome.enable = true;

  programs.dconf.profiles.gdm.databases = lib.mkBefore [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-theme = desktop.cursor-theme;
          gtk-theme = desktop.gtk-theme;
          icon-theme = desktop.icon-theme;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
          speed = desktop.mouse-speed;
        };
      };
    }
  ];

  # disable installing GNOME's applications
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    decibels # audio player
    gnome-calculator
    gnome-text-editor
    loupe # image viewer
    nautilus # files app
    showtime # video player
    video-trimmer

    # utilities
    gnome-disk-utility
    gnome-extension-manager
    gnome-tweaks
    gnome-themes-extra

    # extensions
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.auto-accent-colour
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.blur-my-shell
    gnomeExtensions.color-picker
    gnomeExtensions.emoji-copy
    gnomeExtensions.privacy-indicators-accent-color
    gnomeExtensions.wireless-hid
  ];
}
