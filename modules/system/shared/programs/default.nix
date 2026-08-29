{ pkgs, ... }:

{
  imports = [
    ./nix-ld.nix
    ./zsh.nix
  ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    btop
    eza
    fastfetch
    git
    gh
    wget
  ];

  services.cloudflare-warp.enable = true;
}
