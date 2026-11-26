{
  inputs,
  flake-dir,
  hostname,
  username,
  background,
  cursor-theme,
  gtk-theme,
  icon-theme,
  mouse-speed,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/desktop
  ];

  home-manager = {
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit
        inputs
        flake-dir
        hostname
        username
        background
        cursor-theme
        gtk-theme
        icon-theme
        mouse-speed
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
