{ pkgs, pkgs-unstable, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      cinnamon = pkgs-unstable.cinnamon;
      cinnamon-common = pkgs-unstable.cinnamon-common;
      cinnamon-session = pkgs-unstable.cinnamon-session;
      cinnamon-settings-daemon = pkgs-unstable.cinnamon-settings-daemon;
      cinnamon-control-center = pkgs-unstable.cinnamon-control-center;
      cinnamon-desktop = pkgs-unstable.cinnamon-desktop;
      cinnamon-menus = pkgs-unstable.cinnamon-menus;
      cinnamon-screensaver = pkgs-unstable.cinnamon-screensaver;
      nemo = pkgs-unstable.nemo;
    })
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

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
}
