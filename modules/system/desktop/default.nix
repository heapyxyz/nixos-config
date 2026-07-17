{ ... }:

{
  imports = [
    ./gnome.nix
    ./packages.nix
    ./system.nix
    ./virtualisation.nix

    ../shared
  ];
}
