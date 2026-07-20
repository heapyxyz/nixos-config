{
  inputs,
  flake-dir,
  hostname,
  username,
  background,
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
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
