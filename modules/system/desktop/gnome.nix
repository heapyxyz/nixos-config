{ pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

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

    # utilities
    gnome-disk-utility
    gnome-extension-manager
    gnome-tweaks

    # extensions
    gnomeExtensions.appindicator
    gnomeExtensions.emoji-copy
  ];
}
