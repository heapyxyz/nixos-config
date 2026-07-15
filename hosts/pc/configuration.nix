{
  inputs,
  flake-dir,
  hostname,
  username,
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
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
