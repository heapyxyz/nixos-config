{ pkgs, pkgs-unstable, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    with pkgs;
    [
      brave
      btop
      fastfetch
      git
      gh
      ghostty
      nixfmt
      wget
    ]
    ++ (with pkgs-unstable; [
      equibop
      vscode-fhs
    ]);
}
