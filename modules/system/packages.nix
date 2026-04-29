{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    apple-cursor
    brave
    btop
    equibop
    fastfetch
    git
    gh
    ghostty
    nixfmt
    wget
    vscode-fhs
  ];
}
