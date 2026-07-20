{
  inputs,
  flake-dir,
  hostname,
  username,
  ...
}:

{
  imports = [
    # ./hardware-configuration.nix
    ../../modules/system/server
  ];

  home-manager = {
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit
        inputs
        flake-dir
        hostname
        username
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
