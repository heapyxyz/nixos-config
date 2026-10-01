{ pkgs, ... }:

{
  imports = [
    ./nix-ld.nix
    ./zsh.nix
  ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    aria2
    btop
    eza
    fastfetch
    git
    gh
    rar
    unrar
    unzip
    wget
    zip
  ];

  services.cloudflare-warp.enable = true;
}
