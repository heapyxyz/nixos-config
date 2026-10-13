{
  pkgs,
  lib,
  ...
}:

{
  services.displayManager.gdm = {
    enable = true;
    # make icons/cursor available to the gdm greeter
    extraPackages = [
      pkgs.mactahoe-icon-theme
      pkgs.apple-cursor
    ];
  };
  services.desktopManager.gnome.enable = true;

  programs.dconf.profiles.gdm.databases = lib.mkBefore [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-theme = "macOS";
          gtk-theme = "Adwaita-dark";
          icon-theme = "MacTahoe-dark";
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
    loupe # image viewer
    nautilus # files app
    showtime # video player
    gnome-text-editor # text editor

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
    gnomeExtensions.dynamic-music-pill
    gnomeExtensions.emoji-copy
    gnomeExtensions.privacy-indicators-accent-color
    gnomeExtensions.wireless-hid
  ];
}
