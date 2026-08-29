{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./programs
    ./system.nix
    ./users.nix
  ];
}
