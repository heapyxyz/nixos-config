{
  inputs,
  flake-dir,
  hostname,
  username,
  desktop,
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
        desktop
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
