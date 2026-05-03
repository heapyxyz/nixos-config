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
    telegram-desktop
    wget
    vscode-fhs
  ];

  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
