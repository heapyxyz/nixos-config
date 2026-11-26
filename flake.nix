{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-additional = {
      url = "github:heapyxyz/nix-additional";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      flake-dir = "/etc/nixos";
      username = "heapy";

      desktop = {
        background = "golden-dark.png"; # stored in ./modules/home/backgrounds/
        cursor-theme = "macOS";
        gtk-theme = "Adwaita-dark";
        icon-theme = "MacTahoe-dark";
        mouse-speed = -0.5;
      };

      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              flake-dir
              username
              hostname
              desktop
              ;
          };

          modules = [
            (./hosts + "/${hostname}/configuration.nix")
            inputs.home-manager.nixosModules.default
            inputs.nix-additional.nixosModules.default
          ];
        };
    in
    {
      nixosConfigurations = {
        laptop = mkHost "laptop";
        pc = mkHost "pc";

        # todo: install nixos on home server and copy hardware-configuration.nix
        # todo: finish ./modules/system/server/
        # todo: use different home-manager configuration (not ./modules/home/) or not use it at all (?)
        home-server = mkHost "home-server";
      };
    };
}
