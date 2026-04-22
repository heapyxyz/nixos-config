{
  inputs,
  flake-dir,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs flake-dir; };
    users.heapy = import ./modules/home;
  };
}
