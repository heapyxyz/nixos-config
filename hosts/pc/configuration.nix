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
